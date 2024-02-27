from django.shortcuts import render, get_object_or_404
from django.http import HttpResponse, Http404
from django.db.models import F,ExpressionWrapper, fields, Q, Count, Subquery, OuterRef
from ..models import Room, Booking
import random
from hotelMiranda.forms import BookingForm


def getRooms(request):

    rooms = Room.objects.all()
    title = 'Rooms'
    title_page = 'Ultimate Room'
    return render(request, 'hotelMiranda/rooms.html',
    {"rooms": rooms, "title": title, "title_page": title_page, "breadcrumb": title})

def getRoomById(request, id):

    try:

        room = get_object_or_404(Room,room_id = id)
        room.final_price = room.price - int(room.price * ((room.offer) / 100))
        bookingForm = BookingForm()
        title = 'Room Details'
        title_page = 'Ultimate Room'

        if request.method == 'POST':
            bookingForm = BookingForm(request.POST)

            if bookingForm.is_valid():
                booking = bookingForm.save(commit=False)
                booking.room = room
                booking_id = random.randint(10000,99999)
                while Booking.objects.filter(booking_id=booking_id).exists():
                    booking_id = random.randint(10000,99999)
                booking.booking_id = booking_id
                
                booking.save()
                bookingForm = BookingForm()
                return render(request,'hotelMiranda/roomDetails.html',
                {"room": room, "title": title, "title_page": title_page, "breadcrumb": title, 'bookingForm': bookingForm })

        return render(request,'hotelMiranda/roomDetails.html',
        {"room": room, "title": title, "title_page": title_page, "breadcrumb": title, 'bookingForm': bookingForm })
    
    except Room.DoesNotExist:
        raise Http404('Room does not exist')

def getRoomsOffer(request):

    rooms = Room.objects.annotate(
        final_price = ExpressionWrapper(
            F('price') - F('price')*(F('offer') / 100),
            output_field=fields.IntegerField()
        )
    ).filter(offer__gt = 0).values()
    title = 'Offers'
    title_page = 'Our Offers'
    return render(request, 'hotelMiranda/offers.html',
    {"rooms": rooms, 'title': title, 'title_page': title_page, 'breadcrumb': title})

def getRoomsAvailable(request):
    
    check_in = request.GET.get('check_in')
    check_out = request.GET.get('check_out')

    roomAvailable = Room.objects.annotate(
        has_conflict=Subquery(
            Booking.objects.filter(
                room=OuterRef('pk'),
                check_in__lte=check_out,
                check_out__gte=check_in
            ).values('id')[:1]
        )
    ).filter(has_conflict=None)

    return render(request, 'hotelMiranda/rooms.html', {'rooms': roomAvailable})