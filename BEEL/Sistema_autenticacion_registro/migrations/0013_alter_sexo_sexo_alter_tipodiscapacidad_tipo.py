# Generated by Django 5.0.6 on 2024-06-05 19:54

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Sistema_autenticacion_registro', '0012_sexo_tipodiscapacidad'),
    ]

    operations = [
        migrations.AlterField(
            model_name='sexo',
            name='sexo',
            field=models.CharField(max_length=255, verbose_name='sexo'),
        ),
        migrations.AlterField(
            model_name='tipodiscapacidad',
            name='tipo',
            field=models.CharField(max_length=255, verbose_name='tipo'),
        ),
    ]
