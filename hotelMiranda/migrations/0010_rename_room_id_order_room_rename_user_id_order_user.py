# Generated by Django 5.0.1 on 2024-02-16 00:18

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('hotelMiranda', '0009_alter_booking_status_alter_room_room_type_order'),
    ]

    operations = [
        migrations.RenameField(
            model_name='order',
            old_name='room_id',
            new_name='room',
        ),
        migrations.RenameField(
            model_name='order',
            old_name='user_id',
            new_name='user',
        ),
    ]