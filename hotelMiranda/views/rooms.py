from django.shortcuts import render, get_object_or_404
from django.http import HttpResponse, Http404
from django.db.models import F,ExpressionWrapper, fields
from ..models import Room


def getRooms(request):

    rooms = Room.objects.all()
    print(rooms)
    title = 'Rooms'
    title_page = 'Ultimate Room'
    return render(request, 'hotelMiranda/rooms.html',
    {"rooms": rooms, "title": title, "title_page": title_page, "breadcrumb": title})

def getRoomById(request, room_id):

    try:

        room = get_object_or_404(Room,room_id = room_id)
        return render(request,'hotelMiranda/roomDetails.html',{"room": room})
    
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
    pass