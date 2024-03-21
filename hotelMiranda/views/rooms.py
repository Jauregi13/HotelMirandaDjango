from django.shortcuts import render, get_object_or_404
from django.http import HttpResponse, Http404
from django.views.generic import ListView, CreateView, UpdateView, DeleteView
from django.db.models import F,ExpressionWrapper, fields, Q, Count, Subquery, OuterRef
from ..models import Room, Booking
import random
from hotelMiranda.forms import BookingForm
from django.contrib import messages
from django.contrib.messages.views import SuccessMessageMixin

def getRooms(request):

    rooms = Room.objects.all()
    title = 'Rooms'
    title_page = 'Ultimate Room'
    return render(request, 'hotelMiranda/rooms.html',
    {"rooms": rooms, "title": title, "title_page": title_page, "breadcrumb": title})

class BookingRoom(SuccessMessageMixin, CreateView):
    model = Room
    template_name = "hotelMiranda/roomDetails.html"
    pk_url_kwarg = 'id'
    form_class = BookingForm
    context_object_name = 'room'

    def get(self, request, *args, **kwargs):

        room_id = self.kwargs['id']
        self.room = self.model.objects.get(room_id=room_id)
        return super().get(request, *args, **kwargs)
        
    
    def get_success_url(self):

        return self.request.get_full_path()

    
    def get_context_data(self, **kwargs):

        context = super().get_context_data(**kwargs)
        context["title"] = 'Room Details'
        context["title_page"] = 'Ultimate Room'
        context["breadcrumb"] = 'Room Details'
        context["room"] = self.room
        return context
    
    def form_valid(self, form):
        pass
    


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

                if Room.getAvailableRoom(room.room_id,booking.check_in, booking.check_out):
                    pass
                else:

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

    roomsAvailable = Room.getAvailableRooms(check_in,check_out)

    return render(request, 'hotelMiranda/rooms.html', {'rooms': roomsAvailable})