from .models import oferta
from django import forms

class ofertaForm(forms.ModelForm):
    fecha_creacion = forms.DateField(widget=forms.DateInput(attrs={'type': 'date'}))
    fecha_expiracion = forms.DateField(widget=forms.DateInput(attrs={'type': 'date'}))

    class Meta:
        model = oferta
        fields = '__all__'