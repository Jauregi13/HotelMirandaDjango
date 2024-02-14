# Generated by Django 5.0.1 on 2024-02-12 11:47

import django.core.validators
import django.db.models.deletion
import django.utils.timezone
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('hotelMiranda', '0004_alter_contact_customer_image_alter_contact_date_and_more'),
    ]

    operations = [
        migrations.AddField(
            model_name='booking',
            name='email',
            field=models.EmailField(max_length=30, null=True),
        ),
        migrations.AddField(
            model_name='booking',
            name='phone',
            field=models.CharField(max_length=11, null=True, validators=[django.core.validators.RegexValidator(code='invalid_phone_number', message='Invalid phone number, you have to put with this format: 999 999 999', regex='[6-9][0-9]{2} [0-9]{3} [0-9]{3}')]),
        ),
        migrations.AlterField(
            model_name='booking',
            name='room',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='bookings', to='hotelMiranda.room'),
        ),
        migrations.AlterField(
            model_name='contact',
            name='date',
            field=models.DateTimeField(default=django.utils.timezone.now),
        ),
    ]
