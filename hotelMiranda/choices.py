from django.db import models

class RoomTypeChoice(models.TextChoices):

    SINGLE_BED = "Single Bed"
    DOUBLE_BED = "Double Bed"
    DOUBLE_SUPERIOR = "Double Superior"
    SUITE = "Suite"

class BookingStatusChoice(models.TextChoices):
    CHECK_IN = "Check In"
    CHECK_OUT = "Check Out"
    IN_PROGRESS = "In Progress"

class OrderTypeChoice(models.TextChoices):
    FOOD = "Food"
    OTHER = "Other"
