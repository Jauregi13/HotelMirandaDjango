from django import forms
from django.core.validators import RegexValidator
from hotelMiranda.models import Contact, Booking, Order, Room
from django.contrib.auth import authenticate
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User

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

class LoginForm(forms.Form):

    username = forms.CharField(max_length=254, widget=forms.TextInput(attrs={'class': 'login-content__form__input-group__input input'}))
    password = forms.CharField(widget=forms.PasswordInput(attrs={'class': 'login-content__form__input-group__input input'}))
    
    def clean(self):
        username = self.cleaned_data.get('username')
        password = self.cleaned_data.get('password')
        user = authenticate(username=username,password=password)

        if user is None or not user.is_active:
            raise forms.ValidationError("The username or password is incorrect. Please try again")
        
        self.cleaned_data['user'] = user
        return self.cleaned_data


class RegisterForm(UserCreationForm):

    password1 = forms.CharField(label='Password', widget=forms.PasswordInput(attrs={'class': 'register-content__form__input-group__input input'}))
    password2 = forms.CharField(label='Password Confirmation', widget=forms.PasswordInput(attrs={'class': 'register-content__form__input-group__input input'}))

    class Meta:
        
        model = User
        fields = ['username','email','first_name','last_name']

        widgets = {
            "username" : forms.TextInput(attrs={'class': 'register-content__form__input-group__input input'}),
            "email": forms.EmailInput(attrs={'class': 'register-content__form__input-group__input input'}),
            "first_name" : forms.TextInput(attrs={'class': 'register-content__form__input-group__input input'}),
            "last_name" : forms.TextInput(attrs={'class': 'register-content__form__input-group__input input'}),
        }

class OrderForm(forms.ModelForm):

    def __init__(self,user, *args, **kwargs):
        super(OrderForm, self).__init__(*args, **kwargs)
        room_ids = Booking.objects.filter(email=user.email).values_list('room_id').distinct()
        self.fields['room'].queryset = Room.objects.filter(id__in=room_ids)

    class Meta:
        model = Order
        fields = ['room','order_type', 'description']

        widgets = {
            'room': forms.Select(attrs={'class': 'create-order-content__form__input-group__input input'}),
            'order_type': forms.Select(attrs={'class': 'create-order-content__form__input-group__input input'}),
            'description': forms.Textarea(attrs={'class': 'create-order-content__form__input-group__input input'})
        }