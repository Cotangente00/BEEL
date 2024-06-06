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
    descripcion_discapacidad = models.TextField(verbose_name="Descripción de discapacidad", null=False)
    contrasena = models.CharField(max_length=255, verbose_name="Contraseña", null=False)
    confirmacion_contrasena = models.CharField(max_length=255, verbose_name="Confirmación de contraseña", null=False)
    nacionalidad = models.CharField(max_length=255, verbose_name="Nacionalidad", null=False)
    id_tipo_documentos = models.ForeignKey("tipo_documentos", on_delete=models.CASCADE, null=False)
    id_localidad = models.ForeignKey("localidad", on_delete=models.CASCADE, null=False)
    id_tipo_discapacidad = models.ForeignKey("tipo_discapacidad", on_delete=models.CASCADE, null=False)
    id_sexo = models.ForeignKey("sexo", on_delete=models.CASCADE, null=False)

   

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
    

class tipo_documentos(models.Model):
    id = models.AutoField(primary_key=True)
    abreviatura = models.CharField(max_length=255, verbose_name="Abreviatura", null=False)
    descripcion = models.CharField(max_length=255, verbose_name="descripcion", null=False)
    


class localidad(models.Model):
    id = models.AutoField(primary_key=True)
    localidades = models.CharField(max_length=255, verbose_name="localidades", null=False)
    


class tipo_discapacidad(models.Model):
    id = models.AutoField(primary_key=True)
    tipo = models.CharField(max_length=255, verbose_name="tipo", null=False)
    


class sexo(models.Model):
    id = models.AutoField(primary_key=True)
    sexo = models.CharField(max_length=255, verbose_name="sexo", null=False)
    

