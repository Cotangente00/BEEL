# Generated by Django 5.0.6 on 2024-06-07 19:43

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Sistema_autenticacion_registro', '0025_alter_postulantes_grupo_sanguineo_rh'),
    ]

    operations = [
        migrations.CreateModel(
            name='nivel_idioma',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('nivel_idioma', models.CharField(max_length=255, verbose_name='nivel_idioma')),
            ],
        ),
        migrations.AddField(
            model_name='postulantes',
            name='idioma',
            field=models.CharField(default=1, max_length=255, verbose_name='Idioma'),
        ),
    ]