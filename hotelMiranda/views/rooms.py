from django.shortcuts import render, get_object_or_404
from django.http import HttpResponse, Http404
from ..models import Room


def getRooms(request):
    rooms = Room.objects.all()
    return render(request, 'hotelMiranda/rooms.html',{"rooms": rooms})

def getRoomById(request, room_id):

    try:

        room = get_object_or_404(Room,room_id = room_id)
        return render(request,'hotelMiranda/roomDetails.html',{"room": room})
    
    except Room.DoesNotExist:
        raise Http404('Room does not exist')

def getRoomsOffer(request):
    rooms = Room.objects.all()
    return render(request, 'hotelMiranda/offers.html',{"rooms": rooms})