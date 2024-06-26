from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth import login, get_backends, update_session_auth_hash
from .forms import *
from .decorators import role_required
from .models import *
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from django.http import HttpResponseRedirect
from django.urls import reverse

# Create your views here.

#vista inicial de bienvenida
def welcome(request):
    return render(request, 'welcome.html')


#vista sobre nosotros
def aboutus(request):
    return render(request, 'aboutus.html')

#registro de usuarios
def registro(request):
    if request.method == 'POST':
        form = RegistroForm(request.POST)
        if form.is_valid():
            user = form.save(commit=False)
            if user.role == 'postulante':
                user.status = 'agente libre'
            user.save()
            backend = get_backends()[0]
            user.backend = f'{backend.__module__}.{backend.__class__.__name__}'
            login(request, user)
            if user.role == 'empresa':
                return redirect('home_empresa')
            else:
                return redirect('home_postulante')
    else:
        form = RegistroForm()
    return render(request, 'registro.html', {'form': form})

#vista de inicio de sesión para postulantes y empresas
def login_view(request):
    if request.method == 'POST':
        form = LoginForm(request.POST)
        if form.is_valid():
            user = form.cleaned_data['user']
            login(request, user)
            if user.role == 'empresa':
                return redirect('home_empresa')
            else:
                return redirect('home_postulante')
    else:
        form = LoginForm()
    return render(request, 'iniciar_sesion.html', {'form': form})

#vista home empresa protegida por login required
@role_required('empresa')
def home_empresa(request):
    return render(request, 'empresa/home_empresa.html', {'username': request.user.username})

#vista home postulante protegida por login required
@role_required('postulante')
def home_postulante(request):
    return render(request, 'postulante/home_postulante.html', {
        'username': request.user.username,
        'status': request.user.status
    })
'''
usuario de prueba:
2345654323
cas4limpi410039
cas4limpi42024
'''

'''
usuario de prueba:
1028880846
malufe22072005
'''

'''
usuario de prueba:
1048574854

'''

'''
superuser
julian 
CAMIL0242003
'''

#formulario de empresa para publicar oferta laboral
@role_required('empresa')
def formularioOferta(request):
    if request.method == 'POST':
        form = OfertaForm(request.POST)
        if form.is_valid():
            oferta = form.save(commit=False)
            oferta.empresa = request.user
            oferta.save()
            return redirect('home_empresa')  # Redirigir a la página de inicio de empresa
    else:
        form = OfertaForm()
    return render(request, 'empresa/formularioOferta.html', {'form': form})


#vista del postulante para visualizar todas las ofertas que publiquen las empresas
@role_required('postulante')
def lista_ofertas(request):
    if request.user.status == 'aplicado':
        messages.info(request, 'No puedes ver más ofertas laborales porque ya has aplicado a una.')
        return redirect('home_postulante')
    if request.user.status == 'seleccionado':
        messages.info(request, 'No puedes ver más ofertas laborales porque ya has sido seleccionado.')
        return redirect('home_postulante')
    
    ofertas = Oferta.objects.all()
    return render(request, 'postulante/lista_ofertas.html', {'ofertas': ofertas})

#vista del formulario del postulante para poder aplicar a la oferta laboral seleccionada
@role_required('postulante')
def aplicar_oferta(request, oferta_id):
    oferta = get_object_or_404(Oferta, id=oferta_id)

    if request.method == 'POST':
        form = AplicacionForm(request.POST)
        if form.is_valid():
            aplicacion = form.save(commit=False)
            aplicacion.postulante = request.user
            aplicacion.oferta = oferta
            aplicacion.save()
            #cambiar el estado a aplicado
            request.user.status = 'aplicado'
            request.user.save()

            messages.success(request, 'Has aplicado exitosamente a la oferta.')
            return redirect('lista_ofertas')  # Redirigir a la lista de ofertas o a alguna página de confirmación
    else:
        form = AplicacionForm()
    return render(request, 'postulante/aplicar_oferta.html', {'form': form, 'oferta': oferta})


#vista de la empresa para poder visualizar todas las ofertas publicadas hasta el momento
@role_required('empresa')
def mis_ofertas(request):
    ofertas = Oferta.objects.filter(empresa=request.user)
    return render(request, 'empresa/mis_ofertas.html', {'ofertas': ofertas})

#vista de la empresa para poder visualizar todos los postulantes aplicados a la oferta laboral seleccionada
@role_required('empresa')
def ver_postulantes(request, oferta_id):
    oferta = get_object_or_404(Oferta, id=oferta_id, empresa=request.user)
    aplicaciones = oferta.aplicaciones.filter(postulante__status='aplicado')
    return render(request, 'empresa/ver_postulantes.html', {'oferta': oferta, 'aplicaciones': aplicaciones})


#vista para rechazar o eliminar los postulantes descartados 
@role_required('empresa')
def rechazar_postulante(request, aplicacion_id):
    aplicacion = get_object_or_404(Aplicacion, id=aplicacion_id)
    if request.user.role == 'empresa' and aplicacion.oferta.empresa == request.user:
        postulante = aplicacion.postulante
        aplicacion.delete()
        postulante.status = 'agente libre'
        postulante.save()
        messages.success(request, 'Postulante rechazado exitosamente.')
    return HttpResponseRedirect(reverse('ver_postulantes', args=[aplicacion.oferta.id]))






#vistas para que los usuarios puedan actualizar los datos de username, email y contraseña
@login_required
def editar_perfil(request):
    if request.method == 'POST':
        form = EditProfileForm(request.POST, instance=request.user)
        if form.is_valid():
            form.save()
            messages.success(request, 'Tu perfil ha sido actualizado con éxito.')
            return redirect('editar_perfil')
    else:
        form = EditProfileForm(instance=request.user)
    return render(request, 'paginasComunes/editar_perfil.html', {'form': form})

@login_required
def cambiar_password(request):
    if request.method == 'POST':
        form = CustomPasswordChangeForm(data=request.POST, user=request.user)
        if form.is_valid():
            user = form.save()
            update_session_auth_hash(request, user)  # Importante actualizar la sesión con la nueva contraseña
            messages.success(request, 'Tu contraseña ha sido actualizada con éxito.')
            return redirect('cambiar_password')
    else:
        form = CustomPasswordChangeForm(user=request.user)
    return render(request, 'paginasComunes/cambiar_password.html', {'form': form})


#vista para cambiar el estado de los postulantes a seleccionados y enviar sus datos a la tabla "seleccionados"
@role_required('empresa')
def seleccionar_postulantes(request, aplicacion_id):
    aplicacion = get_object_or_404(Aplicacion, id=aplicacion_id)
    if request.user.role == 'empresa' and aplicacion.oferta.empresa == request.user:
        postulante = aplicacion.postulante
        Seleccionados.objects.create(
            postulante=postulante,
            oferta=aplicacion.oferta,
            nombres=aplicacion.nombres,
            apellidos=aplicacion.apellidos,
            tipo_documento=aplicacion.tipo_documento,
            numero_documento=aplicacion.numero_cedula,
            contacto=postulante.email,  # assuming email as contact information
        )
        postulante.status = 'seleccionado'
        postulante.save()
        messages.success(request, 'Postulante seleccionado exitosamente.')
    return HttpResponseRedirect(reverse('ver_postulantes', args=[aplicacion.oferta.id]))