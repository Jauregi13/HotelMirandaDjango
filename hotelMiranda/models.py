from django.db import models
from django.core.validators import MaxValueValidator, MinValueValidator, RegexValidator
from django.utils import timezone
from django.core.exceptions import ValidationError

phone_validator = RegexValidator(
            regex= r'[6-9][0-9]{2} [0-9]{3} [0-9]{3}',
            message= 'Invalid phone number, you have to put with this format: 999 999 999',
            code= 'invalid_phone_number'
)

class Room(models.Model):
    room_id = models.CharField(max_length=5,unique=True)
    room_type_choice = {
        "single_bed" : "Single Bed",
        "double_bed" : "Double Bed",
        "double_superior" : "Double Superior",
        "suite": "Suite"
    }
    room_type = models.CharField(choices=room_type_choice, max_length=15)
    room_number = models.IntegerField()
    description = models.CharField(max_length=255)
    amenities = models.JSONField()
    cancellation = models.CharField(max_length=255)
    price = models.IntegerField()
    offer = models.IntegerField(validators=[MaxValueValidator(99),MinValueValidator(0)])
    available = models.BooleanField("Is available?")

class Booking(models.Model):
    booking_id = models.CharField(max_length=5,unique=True)
    guest = models.CharField(max_length=30)
    guest_image = models.CharField(max_length=255, null=True)
    email = models.EmailField(max_length=50, null=True)
    phone = models.CharField(max_length=11,validators=[phone_validator], null=True)
    order_date = models.DateTimeField(auto_now_add=True)
    check_in = models.DateTimeField()
    check_out = models.DateTimeField()
    special_request = models.CharField(max_length=255, blank=True)
    room = models.ForeignKey(Room,on_delete=models.CASCADE, related_name='bookings')
    status_choice = {
        "check_in" : "Check In",
        "check_out" : "Check Out",
        "in_progress" : "In Progress"
    }
    status = models.CharField(choices=status_choice, max_length=11)

    def clean(self):
        print('llamada clean')
        if self.check_in > self.check_out:
            raise ValidationError('Check-out must be after check-in')


class Contact(models.Model):
    
    review_id = models.CharField(max_length=5,unique=True)
    date = models.DateTimeField(default=timezone.now)
    customer = models.CharField(max_length=30)
    customer_image = models.CharField(max_length=255, null=True)
    email = models.EmailField(max_length=50)
    phone = models.CharField(max_length=11, validators=[phone_validator])
    subject = models.CharField(max_length=50)
    comment = models.CharField(max_length=1024)
    published = models.BooleanField("Is published?", default=True) 