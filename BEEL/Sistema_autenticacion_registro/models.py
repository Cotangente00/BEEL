from typing import Any
from django.db import models
from django.contrib.auth.hashers import make_password

# Create your models here.


class postulantes(models.Model):
    id = models.AutoField(primary_key=True)
    nombres = models.CharField(max_length=255, verbose_name="Nombre", null=False)
    apellidos = models.CharField(max_length=255, verbose_name="Apellido", null=False)
    cedula = models.TextField(verbose_name="Número de Cédula", null=False, unique=True)
    fecha_nacimiento = models.DateField(verbose_name="Fecha de nacimiento", null=False)
    celular = models.CharField(max_length=255, verbose_name="Celular", null=False)
    correo = models.EmailField(verbose_name="Correo electrónico", unique=True, null=False)
    direccion = models.CharField(max_length=255, verbose_name="Dirección", null=False)
    descripcionDiscapacidad = models.TextField(verbose_name="Descripción de discapacidad", null=False)
    contrasena = models.CharField(max_length=255, verbose_name="Contraseña", null=False)
    confirmacion_contrasena = models.CharField(max_length=255, verbose_name="Confirmación de contraseña", null=False)

    def save(self, *args, **kwargs):
        if not self.id:
            self.contrasena = make_password(self.contrasena)
        super().save(*args, **kwargs)

class empresas(models.Model):
    id = models.AutoField(primary_key=True)
    razon_social = models.CharField(max_length=255, verbose_name="Razón social", null=False)
    direccion = models.CharField(max_length=255, verbose_name="Dirección", null=False)
    correo = models.EmailField(verbose_name="Correo electrónico", unique=True, null=False)
    nit = models.TextField(verbose_name="Número de NIT", null=False, unique=True)
    rut = models.TextField(verbose_name="Número de RUT", null=False, unique=True)
    telefono = models.CharField(max_length=255, verbose_name="Teléfono", null=False)
    descripcion = models.TextField(verbose_name="Descripción", null=False)
    contrasena = models.CharField(max_length=255,  verbose_name="Contraseña", null=False, default='some string')
    confirmacion_contrasena = models.CharField(max_length=255,  verbose_name="Contraseña", null=False, default='some string')

    def save(self, *args, **kwargs):
        if not self.id:
            self.contrasena = make_password(self.contrasena)
        super().save(*args, **kwargs)