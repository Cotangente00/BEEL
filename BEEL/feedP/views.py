from django.shortcuts import render, redirect
from django.http import HttpResponse    
from django.contrib.auth.decorators import login_required
# Create your views here.


def homeP(request):
    return render(request, 'homeP.html')

def logout(request):
    logout(request)
    return redirect('/')