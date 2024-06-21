from django.urls import path
from . import views

urlpatterns=[
    path('', views.homeE, name='homeP'),
    path('', views.logout, name='logout'),
]