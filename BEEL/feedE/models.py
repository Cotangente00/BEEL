from django.db import models

# Create your models here.

class oferta(models.Model):
    localidades = models.ForeignKey("localidad", on_delete=models.CASCADE, null=False)
    persona_de_contacto = models.CharField(max_length=255, verbose_name="Persona de Contacto", null=False)
    direccion = models.CharField(max_length=255, verbose_name="Direccion", null=False)
    telefono = models.CharField(max_length=255, verbose_name="teléfono", null=False, unique=True)
    correo_electronico = models.EmailField(max_length=255, verbose_name="Correo electronico", null=False, unique=True)
    perfil = models.CharField(max_length=255, verbose_name="Perfil", null=False)
    funciones = models.CharField(max_length=255, verbose_name="Funciones", null=False)
    fecha_creacion = models.DateField(max_length=255, verbose_name="Fecha de creación", null=False)
    fecha_expiracion = models.DateField(max_length=255, verbose_name="Fecha expiración", null=False)

class localidad(models.Model):
    id = models.AutoField(primary_key=True)
    localidades = models.CharField(max_length=255, verbose_name="localidades", null=False)
    def __str__(self):
        return str(self.localidades)

