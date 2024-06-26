from django.db import models
from django.contrib.auth.models import AbstractUser

# Create your models here.

class CustomUser(AbstractUser):
    ROLES = (
        ('empresa', 'Empresa'),
        ('postulante', 'Postulante'),
    )
    
    STATUS_CHOICES = (
        ('agente libre', 'Agente Libre'),
        ('aplicado', 'Aplicado'),
        ('contratado', 'Contratado'),
    )
    
    role = models.CharField(max_length=10, choices=ROLES)
    nit = models.CharField(max_length=20, blank=True, null=True)
    cedula = models.CharField(max_length=20, blank=True, null=True)
    status = models.CharField(max_length=20, choices=STATUS_CHOICES, default='agente libre')

    def save(self, *args, **kwargs):
        if self.role == 'empresa':
            self.cedula = None
        elif self.role == 'postulante':
            self.nit = None
        super(CustomUser, self).save(*args, **kwargs)
    
    def save2(self, *args, **kwargs):
        if self.role == 'postulante' and not self.status:
            self.status = 'agente libre'
        super().save(*args, **kwargs)


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
    
class TipoDocumento(models.Model):
    abreviacion = models.CharField(max_length=100)

    def __str__(self):
        return self.abreviacion
    
class TipoDiscapacidad(models.Model):
    tipo = models.CharField(max_length=50)

    def __str__(self):
        return self.tipo
    

class Aplicacion(models.Model):
    ESTADO_CHOICES = [
        ('pendiente', 'Pendiente'),
        ('rechazado', 'Rechazado'),
    ]

    oferta = models.ForeignKey(Oferta, on_delete=models.CASCADE, related_name='aplicaciones')
    nombres = models.CharField(max_length=255)
    apellidos = models.CharField(max_length=255)
    tipo_documento = models.ForeignKey(TipoDocumento, on_delete=models.CASCADE)
    numero_cedula = models.CharField(max_length=20)
    tipo_discapacidad = models.ForeignKey(TipoDiscapacidad, on_delete=models.CASCADE)
    descripcion_discapacidad = models.TextField()
    correo_electronico = models.EmailField()
    numero_contacto = models.CharField(max_length=20)
    conocimientos = models.TextField()
    estado = models.CharField(max_length=10, choices=ESTADO_CHOICES, default='pendiente')

    def __str__(self):
        return f'{self.nombres} {self.apellidos} - {self.oferta.titulo_cargo}'
    


