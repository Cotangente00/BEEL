from django.urls import path
from . import views

urlpatterns=[
    path('', views.homeE, name='homeE'),
    path('', views.logout, name='logout'),
]