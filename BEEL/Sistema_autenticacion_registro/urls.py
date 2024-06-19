from django.urls import path
from . import views
from .views import postulantelogin


urlpatterns=[
    path('', views.index, name='index'),
    path('login/', postulantelogin, name='login'),
    path('registroP/', views.formularioPostulante, name='formularioPostulante'),
    path('registroE/', views.formularioEmpresa, name='formularioEmpresa'),
    path('sobreNosotros/', views.aboutus, name='aboutus'),
    
]