from django.db import models
from django.contrib.auth.models import AbstractUser

# Create your models here.

class CustomUser(AbstractUser):
    ROLES = (
        ('empresa', 'Empresa'),
        ('postulante', 'Postulante'),
    )
    
    role = models.CharField(max_length=10, choices=ROLES)
    nit = models.CharField(max_length=20, blank=True, null=True)
    cedula = models.CharField(max_length=20, blank=True, null=True)

    def save(self, *args, **kwargs):
        if self.role == 'empresa':
            self.cedula = None
        elif self.role == 'postulante':
            self.nit = None
        super(CustomUser, self).save(*args, **kwargs)


