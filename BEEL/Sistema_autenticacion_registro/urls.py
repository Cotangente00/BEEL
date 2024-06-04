from django.urls import path
from . import views

urlpatterns=[
    path('', views.index, name='index'),
    path('login/', views.login, name='login'),
    path('registroP/', views.formularioPostulante, name='formularioPostulante'),
    path('registroE/', views.formularioEmpresa, name='formularioEmpresa'),
    path('sobreNosotros/', views.aboutus, name='aboutus'),

]