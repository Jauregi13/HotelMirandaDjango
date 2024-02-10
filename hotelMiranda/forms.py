from django import forms
from django.core.validators import RegexValidator
from hotelMiranda.models import Contact

class ContactForm(forms.ModelForm):

    class Meta:
        model = Contact
        fields = ["customer","email","phone","subject","comment"]
        widgets = {
            "customer": forms.TextInput(attrs={'placeholder': 'Your full name', 'class': 'contact-content__form__input-group__input input'}),
            "email": forms.EmailInput(attrs={'placeholder': 'Enter email address', 'class': 'contact-content__form__input-group__input input'}),
            "phone": forms.TextInput(attrs={'placeholder': 'Add phone number', 'class': 'contact-content__form__input-group__input input'}),
            "subject": forms.TextInput(attrs={'placeholder': 'Enter subject', 'class': 'contact-content__form__input-group__input input'}),
            "comment": forms.Textarea(attrs={"cols":30, "rows":10, 'placeholder': 'Enter message', 'class': 'contact-content__form__input-group__input input'})
        }