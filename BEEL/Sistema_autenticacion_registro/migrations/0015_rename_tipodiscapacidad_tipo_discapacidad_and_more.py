# Generated by Django 5.0.6 on 2024-06-05 20:21

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('Sistema_autenticacion_registro', '0014_rename_descripciondiscapacidad_postulantes_descripcion_discapacidad'),
    ]

    operations = [
        migrations.RenameModel(
            old_name='tipoDiscapacidad',
            new_name='tipo_discapacidad',
        ),
        migrations.RenameModel(
            old_name='tipoDocumentos',
            new_name='tipo_documentos',
        ),
    ]
