from pyexpat.errors import messages
from django.shortcuts import render, redirect
from django.http import HttpResponse        
from .forms import postulanteForm, empresaForm
from django.contrib.auth import authenticate, login
from feedE.views import homeE
from feedP.views import homeP
from django.contrib import messages



# Create your views here.

def index(request):
    return render(request, 'paginas/index.html')

def login(request):
    if request.method == 'POST':
        cedula_nit = request.POST['cedula_nit']
        password = request.POST['password']

        if cedula_nit.email():
            usuario = authenticate(username=cedula_nit, password=password)
            if usuario is not None and usuario.rol == "postulante":
                login(request, usuario)
                return redirect('feedP.homeP')
        else:
            usuario = authenticate(username=cedula_nit, password=password)
            if usuario is not None and usuario.rol == "empresa":
                login(request, usuario)
                return redirect('feedE.homeE')

        messages.error(request, 'Usuario o contraseña incorrectos.')
    return render(request, 'registration/login.html')






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