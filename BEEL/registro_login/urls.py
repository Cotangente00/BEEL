from django.urls import path, include
from . import views
from django.contrib.auth import views as auth_views
from .views import *


urlpatterns = [
    path('', views.welcome, name='welcome'),
    path('aboutus/', views.aboutus, name='aboutus'),
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
    path('rechazar_postulante/<int:aplicacion_id>/', rechazar_postulante, name='rechazar_postulante'),
    path('seleccionar_postulantes/<int:aplicacion_id>/', seleccionar_postulantes, name='seleccionar_postulantes'),
    path('ver_seleccionados/<int:oferta_id>/', ver_seleccionados, name='ver_seleccionados'),
    path('reject_selected/<int:seleccionado_id>/', reject_selected, name='reject_selected'),
    path('eliminar_oferta/<int:oferta_id>/', eliminar_oferta, name='eliminar_oferta'),
]