from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from .forms import ofertaForm

# Create your views here.


def homeE(request):
    return render(request, 'homeE.html')


def formularioOferta(request): 
    if request.method == 'POST':
        form = ofertaForm(request.POST)
        if form.is_valid():
            form.save()
            return render(request, 'homeE.html')
            # hacer algo después de guardar los datos del usuario
    else:
        form = ofertaForm()
    return render(request, 'formularioOferta.html', {'form':form})

def logout(request):
    logout(request)
    return redirect('/')