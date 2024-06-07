from django import forms
from .models import postulantes, empresas, tipo_documentos, localidad, tipo_discapacidad, sexo


class postulanteForm(forms.ModelForm): 
    class Meta:
        model = postulantes
        fields = '__all__'
    def clean_confirmar_contrasena(self):
        contrasena = self.cleaned_data['contrasena']
        confirmar_contrasena = self.cleaned_data['confirmar_contrasena']

        if contrasena != confirmar_contrasena:
            raise forms.ValidationError('Las contraseñas no coinciden.')
        return confirmar_contrasena
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        # Personalizar el campo "perfil"
        self.fields['tipo_documentos'].queryset = tipo_documentos.objects.all()
        # Personalizar el campo "direccion"
        self.fields['localidad'].queryset = localidad.objects.all()


class empresaForm(forms.ModelForm):
    class Meta:
        model = empresas
        fields = '__all__'
    def clean_confirmar_contrasena(self):
        contrasena = self.cleaned_data['contrasena']
        confirmar_contrasena = self.cleaned_data['confirmar_contrasena']

        if contrasena != confirmar_contrasena:
            raise forms.ValidationError('Las contraseñas no coinciden.')
        return confirmar_contrasena
