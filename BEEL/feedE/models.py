from django.db import models
from Sistema_autenticacion_registro.models import localidad
from Sistema_autenticacion_registro.models import Empresa
# Create your models here.

class oferta(models.Model):     
    id = models.AutoField(primary_key=True)
    titulo = models.CharField(max_length=255, verbose_name="Titulo", null=False)
    empresas = models.ForeignKey(Empresa, on_delete=models.CASCADE, null=False)
    localidades = models.ForeignKey(localidad, on_delete=models.CASCADE, null=False)
    persona_de_contacto = models.CharField(max_length=255, verbose_name="Persona de Contacto", null=False)
    direccion = models.CharField(max_length=255, verbose_name="Direccion", null=False)
    telefono = models.CharField(max_length=255, verbose_name="teléfono", null=False, unique=True)
    correo_electronico = models.EmailField(max_length=255, verbose_name="Correo electronico", null=False, unique=True)
    perfil = models.TextField(max_length=255, verbose_name="Perfil", null=False)
    funciones = models.CharField(max_length=255, verbose_name="Funciones", null=False)
    fecha_creacion = models.DateField(max_length=255, verbose_name="Fecha de creación", null=False)
    fecha_expiracion = models.DateField(max_length=255, verbose_name="Fecha expiración", null=False)



