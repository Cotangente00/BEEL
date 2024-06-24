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


class Oferta(models.Model):
    empresa = models.ForeignKey(CustomUser, on_delete=models.CASCADE)  # Suponiendo que User representa a la empresa
    nombre_empresa = models.CharField(max_length=255)
    titulo_cargo = models.CharField(max_length=255)
    persona_contacto = models.CharField(max_length=255)
    direccion = models.CharField(max_length=255)
    telefono = models.CharField(max_length=20)
    correo_electronico = models.EmailField()
    perfil_requisitos = models.TextField()
    funciones = models.TextField()
    fecha_creacion = models.DateTimeField(auto_now_add=True)
    fecha_expiracion = models.DateTimeField()

    def __str__(self):
        return self.titulo_cargo