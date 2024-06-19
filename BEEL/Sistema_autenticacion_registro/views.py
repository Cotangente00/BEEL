from pyexpat.errors import messages
from django.shortcuts import render, redirect
from django.http import HttpResponse        
from .forms import postulanteForm, empresaForm, LoginPostulantesForm
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required


# Create your views here.

def index(request):
    return render(request, 'paginas/index.html')

def postulantelogin(request):
    if request.method == 'POST':
        form = postulanteForm(request.POST)
        if form.is_valid():
            # Autentica al usuario con las credenciales proporcionadas
            username = form.cleaned_data['cedula']  # Suponiendo que usas 'cedula' como campo de usuario
            password = form.cleaned_data['password1']
            user = authenticate(request, username=username, password=password)

            if user is not None:
                # El usuario es válido, inícialo la sesión
                login(request, user)
                # Redirige a la página deseada después del inicio de sesión exitoso
                return redirect('homeP ')  # Reemplaza '/' con la URL de redirección deseada
            else:
                # Credenciales no válidas, vuelve a mostrar el formulario de inicio de sesión con un mensaje de error
                messages.error(request, 'Usuario o contraseña no válidos')
    else:
        # Solicitud GET inicial, muestra el formulario de inicio de sesión
        form = postulanteForm()

    return render(request, 'login.html', {'form': form})

def aboutus(request):
    return render(request, 'paginas/aboutus.html')

def formularioPostulante(request): 
    if request.method == 'POST':
        form = postulanteForm(request.POST)
        if form.is_valid():
            form.save()
            return render(request, 'registration/login.html')
            # hacer algo después de guardar los datos del usuario
    else:
        form = postulanteForm()
    return render(request, 'postulantes/formulario.html', {'form':form})

'''
---Usuario de prueba---
cedula: 1028880846
password: mafe2207

'''


def formularioEmpresa(request): 
    if request.method == 'POST':
        form = empresaForm(request.POST)
        if form.is_valid():
            form.save()
            return render(request, 'registration/login.html')
            # hacer algo después de guardar los datos del usuario
    else:
        form = empresaForm()
    return render(request, 'empresas/formulario.html', {'form':form})

'''
--Usuario de prueba--
nit: 2345654323
password: casalimpia100
'''