from django.urls import path
from . import views
from django.contrib.auth import views as auth_views
from .views import *


urlpatterns = [
    path('', views.welcome, name='welcome'),
    path('registro/', views.registro, name='registro'),
    path('iniciar_sesion/', views.login_view, name='iniciar_sesion'),
    path('home_empresa/', home_empresa, name='home_empresa'),
    path('home_postulante/', home_postulante, name='home_postulante'),
    path('logout/', auth_views.LogoutView.as_view(next_page='iniciar_sesion'), name='logout'),
    path('formularioOferta/', views.formularioOferta, name='formularioOferta'),
    path('ofertas/', views.lista_ofertas, name='lista_ofertas'),
]