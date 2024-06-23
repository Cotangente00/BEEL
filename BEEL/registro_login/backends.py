# registro/backends.py
from django.contrib.auth.backends import ModelBackend
from .models import CustomUser

class CustomUserBackend(ModelBackend):
    def authenticate(self, request, username=None, password=None, nit=None, cedula=None, **kwargs):
        if nit:
            try:
                user = CustomUser.objects.get(nit=nit, role='empresa')
                if user.check_password(password):
                    return user
            except CustomUser.DoesNotExist:
                return None
        elif cedula:
            try:
                user = CustomUser.objects.get(cedula=cedula, role='postulante')
                if user.check_password(password):
                    return user
            except CustomUser.DoesNotExist:
                return None
        return None
