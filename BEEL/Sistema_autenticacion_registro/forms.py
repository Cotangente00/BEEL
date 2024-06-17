from django import forms
from .models import postulantes, empresas


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
