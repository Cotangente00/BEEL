from django.urls import path
from . import views

urlpatterns=[
    path('', views.homeP, name='homeP'),
    path('', views.logout, name='logout'),
]