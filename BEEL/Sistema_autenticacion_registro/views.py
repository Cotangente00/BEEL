from django.shortcuts import render
from django.http import HttpResponse        
from .forms import postulanteForm, empresaForm

# Create your views here.

def index(request):
    return render(request, 'paginas/index.html')

def login(request):
    return render(request, 'paginas/login.html')

def aboutus(request):
    return render(request, 'paginas/aboutus.html')

def formularioPostulante(request): 
    if request.method == 'POST':
        form = postulanteForm(request.POST)
        if form.is_valid():
            form.save()
            return render(request, 'paginas/login.html')
            # hacer algo después de guardar los datos del usuario
    else:
        form = postulanteForm()
    return render(request, 'postulantes/formulario.html', {'form':form})


def formularioEmpresa(request): 
    if request.method == 'POST':
        form = empresaForm(request.POST)
        if form.is_valid():
            form.save()
            return render(request, 'paginas/login.html')
            # hacer algo después de guardar los datos del usuario
    else:
        form = empresaForm()
    return render(request, 'empresas/formulario.html', {'form':form})

