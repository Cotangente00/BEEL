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
    path('aplicar/<int:oferta_id>/', aplicar_oferta, name='aplicar_oferta'),
    path('mis-ofertas/', mis_ofertas, name='mis_ofertas'),
    path('mis-ofertas/<int:oferta_id>/', ver_postulantes, name='ver_postulantes'),
    path('editar_perfil/', editar_perfil, name='editar_perfil'),
    path('cambiar_password/', cambiar_password, name='cambiar_password'),
]