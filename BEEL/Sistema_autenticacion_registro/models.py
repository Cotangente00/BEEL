from typing import Any
from django.db import models
from django.contrib.auth.hashers import make_password
from django.contrib.auth.models import AbstractBaseUser, BaseUserManager
# Create your models here.

class postulantesManager(BaseUserManager):
    def create_user(self, email, password=None, **extra_fields):
        if not email:
            raise ValueError('The email is mandatory')

        user = self.model(email=self.normalize_email(email), **extra_fields)
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_superuser(self, email, password, **extra_fields):
        extra_fields.setdefault('is_staff', True)
        extra_fields.setdefault('is_superuser', True)

        if extra_fields.get('is_staff') is not True:
            raise ValueError('The superuser must have `is_staff` = True.')
        if extra_fields.get('is_superuser') is not True:
            raise ValueError('The superuser must have `is_superuser` = True.')

        return self.create_user(email, password, **extra_fields)


class postulantes(AbstractBaseUser):
    nombres = models.CharField(max_length=255, verbose_name="Nombres", null=False)
    apellidos = models.CharField(max_length=255, verbose_name="Apellidos", null=False)
    cedula = models.CharField(max_length=255, verbose_name="Número de Cédula", null=False, unique=True)
    fecha_nacimiento = models.DateField(verbose_name="Fecha de nacimiento", null=False)
    celular = models.CharField(max_length=255, verbose_name="Celular", null=False)
    correo = models.EmailField(verbose_name="Correo electrónico", unique=True, null=False)
    direccion = models.CharField(max_length=255, verbose_name="Dirección", null=False)
    descripcion_discapacidad = models.TextField(verbose_name="Descripción de discapacidad", null=False)
    nacionalidad =  models.ForeignKey("nacionalidad", on_delete=models.CASCADE, null=False)
    tipo_documentos = models.ForeignKey("tipo_documentos", on_delete=models.CASCADE, null=False)
    localidad = models.ForeignKey("localidad", on_delete=models.CASCADE, null=False)
    tipo_discapacidad = models.ForeignKey("tipo_discapacidad", on_delete=models.CASCADE, null=False)
    sexo = models.ForeignKey("sexo", on_delete=models.CASCADE, null=False)
    estado_civil = models.ForeignKey("estado_civil", on_delete=models.CASCADE, null=False)
    grupo_sanguineo_rh = models.ForeignKey("grupo_sanguineo_rh", on_delete=models.CASCADE, null=False)
    idioma = models.CharField(max_length=255, verbose_name="Idioma", null=False)
    nivel_idioma = models.ForeignKey("nivel_idioma", on_delete=models.CASCADE, null=False)
    password = models.CharField(max_length=128, verbose_name='Contraseña')

    USERNAME_FIELD = 'cedula'
    REQUIRED_FIELDS = ['nombres', 'apellidos', 'fecha_nacimiento', 'celular', 'correo', 'direccion', 'descripcion_discapacidad', 'nacionalidad', 'tipo_documentos', 'localidad', 'tipo_discapacidad', 'sexo', 'estado_civil', 'grupo_sanguineo_rh', 'idioma', 'nivel_idioma', 'password']

    objects = postulantesManager()

    def __str__(self):
        return self.nombres + ' ' + self.apellidos


    
class empresasManager(BaseUserManager):
    def create_user(self, email, password=None, **extra_fields):
        if not email:
            raise ValueError('The email is mandatory')

        user = self.model(email=self.normalize_email(email), **extra_fields)
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_superuser(self, email, password, **extra_fields):
        extra_fields.setdefault('is_staff', True)
        extra_fields.setdefault('is_superuser', True)

        if extra_fields.get('is_staff') is not True:
            raise ValueError('The superuser must have `is_staff` = True.')
        if extra_fields.get('is_superuser') is not True:
            raise ValueError('The superuser must have `is_superuser` = True.')

        return self.create_user(email, password, **extra_fields)



class empresas(AbstractBaseUser):
    razon_social = models.CharField(max_length=255, verbose_name="Razón social", null=False)
    direccion = models.CharField(max_length=255, verbose_name="Dirección", null=False)
    correo = models.EmailField(max_length=255, verbose_name="Correo electrónico", unique=True, null=False)
    nit = models.CharField(max_length=255, verbose_name="Número de NIT", null=False, unique=True)
    telefono = models.CharField(max_length=255, verbose_name="Teléfono", null=False)
    descripcion = models.TextField(verbose_name="Descripción", null=False)
    actividad_economica = models.ForeignKey("actividad_economica", on_delete=models.CASCADE, null=False)
    password = models.CharField(max_length=128, verbose_name='Contraseña')

    USERNAME_FIELD = 'nit'
    REQUIRED_FIELDS = ['razon_social', 'direccion', 'correo', 'telefono', 'descripcion', 'actividad_economica', 'password']

    objects = empresasManager()

    def __str__(self):
        return self.razon_social
    
    

class tipo_documentos(models.Model):
    id = models.AutoField(primary_key=True)
    abreviatura = models.CharField(max_length=255, verbose_name="Abreviatura", null=False)
    descripcion = models.CharField(max_length=255, verbose_name="descripcion", null=False)
    def __str__(self):
        return f'{self.abreviatura} - {self.descripcion}'
        
    
    


class localidad(models.Model):
    id = models.AutoField(primary_key=True)
    localidades = models.CharField(max_length=255, verbose_name="localidades", null=False)
    def __str__(self):
        return str(self.localidades)
    
    


class tipo_discapacidad(models.Model):
    id = models.AutoField(primary_key=True)
    tipo = models.CharField(max_length=255, verbose_name="tipo", null=False)
    def __str__(self):
        return str(self.tipo)

    


class sexo(models.Model):
    id = models.AutoField(primary_key=True)
    sexo = models.CharField(max_length=255, verbose_name="sexo", null=False)
    def __str__(self):
        return str(self.sexo)
    

class estado_civil(models.Model):
    id = models.AutoField(primary_key=True)
    estado_civil = models.CharField(max_length=255, verbose_name="estado_civil", null=False)
    def __str__(self):
        return str(self.estado_civil)


class grupo_sanguineo_rh(models.Model):
    id = models.AutoField(primary_key=True)
    grupo_sanguineo_rh = models.CharField(max_length=255, verbose_name="grupo_sanguineo_rh", null=False)
    def __str__(self):
        return str(self.grupo_sanguineo_rh)


class nivel_idioma(models.Model):
    id = models.AutoField(primary_key=True)
    nivel_idioma = models.CharField(max_length=255, verbose_name="nivel_idioma", null=False)
    def __str__(self):
        return str(self.nivel_idioma)


class nacionalidad(models.Model):
    id= models.AutoField(primary_key=True)
    nacionalidades = models.CharField(max_length=255, verbose_name="nacionalidad", null=False)
    def __str__(self):
        return str(self.nacionalidades)


class actividad_economica(models.Model):
    id = models.AutoField(primary_key=True)
    actividad_economica = models.CharField(max_length=255, verbose_name="actividad_economica", null=False)
    def __str__(self):
        return str(self.actividad_economica)



class roles(models.Model):
    id = models.AutoField(primary_key=True)
    roles = models.CharField(max_length=255, verbose_name="roles", null=False)
    def __str__(self):
        return str(self.roles)


