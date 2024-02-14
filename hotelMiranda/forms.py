from django import forms
from django.core.validators import RegexValidator
from hotelMiranda.models import Contact, Booking

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

class BookingForm(forms.ModelForm):

    class Meta:
        model = Booking
        fields = ["check_in","check_out","guest","email","phone","special_request"]
        widgets = {
            "check_in": forms.DateInput(attrs={'class': 'room-details-content__check-availability__form__input input','type':'date'}),
            "check_out": forms.DateInput(attrs={'class': 'room-details-content__check-availability__form__input input','type':'date'}),
            "guest": forms.TextInput(attrs={'class': 'room-details-content__check-availability__form__input input'}),
            "email": forms.EmailInput(attrs={'class': 'room-details-content__check-availability__form__input input'}),
            "phone": forms.TextInput(attrs={'class': 'room-details-content__check-availability__form__input input'}),
            "special_request": forms.Textarea(attrs={'class': 'room-details-content__check-availability__form__input input'})
        }
        labels = {
            "check_in": "Check In",
            "check_out": "Check Out",
            "guest": "Full Name",
            "email": "Email",
            "phone": "Phone",
            "special_request": "Message"
        }