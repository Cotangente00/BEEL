# Generated by Django 5.0.6 on 2024-06-05 20:41

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Sistema_autenticacion_registro', '0011_localidad'),
    ]

    operations = [
        migrations.CreateModel(
            name='tipoDiscapacidad',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('tipo', models.CharField(max_length=255, verbose_name='localidades')),
            ],
        ),
    ]
