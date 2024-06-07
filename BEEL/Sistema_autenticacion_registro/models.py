from typing import Any
from django.db import models
from django.contrib.auth.hashers import make_password

# Create your models here.


class postulantes(models.Model):
    id = models.AutoField(primary_key=True)
    nombres = models.CharField(max_length=255, verbose_name="Nombres", null=False)
    apellidos = models.CharField(max_length=255, verbose_name="Apellidos", null=False)
    cedula = models.CharField(max_length=255, verbose_name="Número de Cédula", null=False, unique=True)
    fecha_nacimiento = models.DateField(verbose_name="Fecha de nacimiento", null=False)
    celular = models.CharField(max_length=255, verbose_name="Celular", null=False)
    correo = models.EmailField(verbose_name="Correo electrónico", unique=True, null=False)
    direccion = models.CharField(max_length=255, verbose_name="Dirección", null=False)
    descripcion_discapacidad = models.TextField(verbose_name="Descripción de discapacidad", null=False)
    contrasena = models.CharField(max_length=255, verbose_name="Contraseña", null=False)
    confirmacion_contrasena = models.CharField(max_length=255, verbose_name="Confirmación de contraseña", null=False)
    nacionalidad = models.CharField(max_length=255, verbose_name="Nacionalidad", null=False)
    tipo_documentos = models.ForeignKey("tipo_documentos", on_delete=models.CASCADE, null=False)
    localidad = models.ForeignKey("localidad", on_delete=models.CASCADE, null=False)
    tipo_discapacidad = models.ForeignKey("tipo_discapacidad", on_delete=models.CASCADE, null=False)
    sexo = models.ForeignKey("sexo", on_delete=models.CASCADE, null=False)
    estado_civil = models.ForeignKey("estado_civil", on_delete=models.CASCADE, null=False)
    grupo_sanguineo_rh = models.ForeignKey("grupo_sanguineo_rh", on_delete=models.CASCADE, null=False)
    idioma = models.CharField(max_length=255, verbose_name="Idioma", null=False)
    nivel_idioma = models.ForeignKey("nivel_idioma", on_delete=models.CASCADE, null=False)
    

    def save(self, *args, **kwargs):
        if not self.id:
            self.contrasena = make_password(self.contrasena)
        super().save(*args, **kwargs)
    

class empresas(models.Model):
    id = models.AutoField(primary_key=True)
    razon_social = models.CharField(max_length=255, verbose_name="Razón social", null=False)
    direccion = models.CharField(max_length=255, verbose_name="Dirección", null=False)
    correo = models.EmailField(max_length=255, verbose_name="Correo electrónico", unique=True, null=False)
    nit = models.CharField(max_length=255, verbose_name="Número de NIT", null=False, unique=True)
    rut = models.CharField(max_length=255, verbose_name="Número de RUT", null=False, unique=True)
    telefono = models.CharField(max_length=255, verbose_name="Teléfono", null=False)
    descripcion = models.TextField(verbose_name="Descripción", null=False)
    contrasena = models.CharField(max_length=255,  verbose_name="Contraseña", null=False)
    confirmacion_contrasena = models.CharField(max_length=255,  verbose_name="Confirmación de contraseña", null=False)

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
    

class estado_civil(models.Model):
    id = models.AutoField(primary_key=True)
    estado_civil = models.CharField(max_length=255, verbose_name="estado_civil", null=False)


class grupo_sanguineo_rh(models.Model):
    id = models.AutoField(primary_key=True)
    grupo_sanguineo_rh = models.CharField(max_length=255, verbose_name="grupo_sanguineo_rh", null=False)


class nivel_idioma(models.Model):
    id = models.AutoField(primary_key=True)
    nivel_idioma = models.CharField(max_length=255, verbose_name="nivel_idioma", null=False)

