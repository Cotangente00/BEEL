from django import forms
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth import authenticate
from .models import CustomUser

class RegistroForm(UserCreationForm):
    email = forms.EmailField(required=True)
    role = forms.ChoiceField(choices=CustomUser.ROLES, required=True)
    nit = forms.CharField(max_length=20, required=False)
    cedula = forms.CharField(max_length=20, required=False)

    class Meta:
        model = CustomUser
        fields = ('username', 'email', 'role', 'nit', 'cedula', 'password1', 'password2')

    def clean(self):
        cleaned_data = super().clean()
        role = cleaned_data.get("role")
        nit = cleaned_data.get("nit")
        cedula = cleaned_data.get("cedula")

        if role == 'empresa' and not nit:
            self.add_error('nit', 'El campo NIT es obligatorio para empresas.')
        if role == 'postulante' and not cedula:
            self.add_error('cedula', 'El campo cédula es obligatorio para postulantes.')

        return cleaned_data



class LoginForm(forms.Form):
    role = forms.ChoiceField(choices=[('empresa', 'Empresa'), ('postulante', 'Postulante')], required=True)
    identifier = forms.CharField(max_length=20, required=True, label='NIT o Cédula')
    password = forms.CharField(widget=forms.PasswordInput, required=True)

    def clean(self):
        cleaned_data = super().clean()
        role = cleaned_data.get("role")
        identifier = cleaned_data.get("identifier")
        password = cleaned_data.get("password")

        if role == 'empresa':
            user = authenticate(nit=identifier, password=password)
        elif role == 'postulante':
            user = authenticate(cedula=identifier, password=password)

        if user is None:
            raise forms.ValidationError("Las credenciales no son correctas.")
        cleaned_data['user'] = user
        return cleaned_data