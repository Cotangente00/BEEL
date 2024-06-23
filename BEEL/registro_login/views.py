from django.shortcuts import render, redirect
from django.contrib.auth import login, get_backends
from .forms import RegistroForm, LoginForm
from .decorators import role_required



# Create your views here.


def welcome(request):
    return render(request, 'welcome.html')



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

@role_required('empresa')
def home_empresa(request):
    return render(request, 'registro/home_empresa.html')

@role_required('postulante')
def home_postulante(request):
    return render(request, 'registro/home_postulante.html')
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