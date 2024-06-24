from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth import login, get_backends
from .forms import *
from .decorators import role_required
from .models import *


# Create your views here.

#vista inicial de bienvenida
def welcome(request):
    return render(request, 'welcome.html')

#registro de usuarios
def registro(request):
    if request.method == 'POST':
        form = RegistroForm(request.POST)
        if form.is_valid():
            user = form.save()
            backend = get_backends()[0]  # Asumimos que tu backend personalizado es el primero en la lista
            user.backend = f'{backend.__module__}.{backend.__class__.__name__}'
            login(request, user)
            if user.role == 'empresa':
                return redirect('home_empresa')
            else:
                return redirect('home_postulante')
    else:
        form = RegistroForm()
    return render(request, 'registro/registro.html', {'form': form})

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
    return render(request, 'registro/iniciar_sesion.html', {'form': form})

#vista home empresa protegida por login required
@role_required('empresa')
def home_empresa(request):
    return render(request, 'registro/home_empresa.html', {'username': request.user.username})

#vista home postulante protegida por login required
@role_required('postulante')
def home_postulante(request):
    return render(request, 'registro/home_postulante.html', {'username': request.user.username})
'''
usuario de prueba:
2345654323
cas4limpi410039
'''

'''
usuario de prueba:
1398473984
malufe2207
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
    return render(request, 'registro/formularioOferta.html', {'form': form})


#vista del postulante para visualizar todas las ofertas que publiquen las empresas
@role_required('postulante')
def lista_ofertas(request):
    ofertas = Oferta.objects.all()
    return render(request, 'registro/lista_ofertas.html', {'ofertas': ofertas})

#vista del formulario del postulante para poder aplicar a la oferta laboral seleccionada
@role_required('postulante')
def aplicar_oferta(request, oferta_id):
    oferta = get_object_or_404(Oferta, id=oferta_id)
    if request.method == 'POST':
        form = AplicacionForm(request.POST)
        if form.is_valid():
            aplicacion = form.save(commit=False)
            aplicacion.oferta = oferta
            aplicacion.save()
            return redirect('lista_ofertas')  # Redirigir a la lista de ofertas o a alguna página de confirmación
    else:
        form = AplicacionForm()
    return render(request, 'registro/aplicar_oferta.html', {'form': form, 'oferta': oferta})

#vista de la empresa para poder visualizar todas las ofertas publicadas hasta el momento
@role_required('empresa')
def mis_ofertas(request):
    ofertas = Oferta.objects.filter(empresa=request.user)
    return render(request, 'registro/mis_ofertas.html', {'ofertas': ofertas})

#vista de la empresa para poder visualizar todos los postulantes aplicados a la oferta laboral seleccionada
@role_required('empresa')
def ver_postulantes(request, oferta_id):
    oferta = get_object_or_404(Oferta, id=oferta_id, empresa=request.user)
    aplicaciones = oferta.aplicaciones.all()
    return render(request, 'registro/ver_postulantes.html', {'oferta': oferta, 'aplicaciones': aplicaciones})

