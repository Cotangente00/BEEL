from typing import Any
from django import forms
from .models import postulantes, empresas
from django.contrib.auth.forms import UserCreationForm, AuthenticationForm

class LoginPostulantesForm(AuthenticationForm):
    cedula = forms.CharField(label='Cédula', max_length=128, required=True)
    password = forms.CharField(label='Contraseña', widget=forms.PasswordInput)

class postulanteForm(UserCreationForm):
    fecha_nacimiento = forms.DateField(widget=forms.DateInput(attrs={'type': 'date'}))
    password1 = forms.CharField(label='Contraseña', widget=forms.PasswordInput)
    password2 = forms.CharField(label='Confirmar contraseña', widget=forms.PasswordInput)

    class Meta:
        model = postulantes
        fields = ['nombres', 'apellidos', 'cedula', 'fecha_nacimiento', 'celular', 'correo', 'direccion', 'descripcion_discapacidad', 'nacionalidad', 'tipo_documentos', 'localidad', 'tipo_discapacidad', 'sexo', 'estado_civil', 'grupo_sanguineo_rh', 'idioma', 'nivel_idioma', 'password1', 'password2']
    def clean_password2(self):
        password1 = self.cleaned_data['password1']
        password2 = self.cleaned_data['password2']

        if password1 and password2 and password1 != password2:
            raise forms.ValidationError('Las contraseñas no coinciden')

        return password2
    
    def save(self, commit=True):
        user = super().save(commit=False)
        user.set_password(self.cleaned_data['password1'])
        if commit:
            user.save()
        return user
    
    


class empresaForm(forms.ModelForm):
    password1 = forms.CharField(label='Contraseña', widget=forms.PasswordInput)
    password2 = forms.CharField(label='Confirmar contraseña', widget=forms.PasswordInput)
    class Meta:
        model = empresas
        fields = ['razon_social', 'direccion', 'correo', 'nit', 'telefono', 'descripcion', 'actividad_economica', 'password1', 'password2']
    def clean_password2(self):
        password1 = self.cleaned_data['password1']
        password2 = self.cleaned_data['password2']

        if password1 and password2 and password1 != password2:
            raise forms.ValidationError('Las contraseñas no coinciden')

        return password2
    
    def save(self, commit=True):
        user = super().save(commit=False)
        user.set_password(self.cleaned_data['password1'])
        if commit:
            user.save()
        return user