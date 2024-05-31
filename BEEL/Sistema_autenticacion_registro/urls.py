from django.urls import path
from . import views

urlpatterns=[
    path('', views.index, name='index'),
    path('login/', views.login, name='login'),
    path('registro/', views.formularioPostulante, name='formularioPostulante'),
    path('registro/', views.formularioEmpresa, name='formularioEmpresa'),

]