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
    success_message = '<h2 class="title-content">!Thank you for your request!</h2>'
    error_message = '<h2 class="title-content">!We are sorry!</h2>'

    def setup(self, request, *args, **kwargs):

        super().setup(request, *args, **kwargs)
        room_id = self.kwargs['id']
        self.room = Room.objects.get(room_id=room_id)
        
    
    def get_success_url(self):

        return self.request.get_full_path()

    
    def get_context_data(self, **kwargs):

        context = super().get_context_data(**kwargs)
        context["title"] = 'Room Details'
        context["title_page"] = 'Ultimate Room'
        context["breadcrumb"] = 'Room Details'
        context["room"] = self.room
        return context
    
    def form_valid(self,form):
       
        if not Room.getAvailableRoom(self.room.room_id,form.instance.check_in,form.instance.check_out):
            
            return self.form_invalid(form)
        else:

            booking_id = random.randint(10000,99999)
            while Booking.objects.filter(booking_id=booking_id).exists():
                booking_id = random.randint(10000,99999)

            form.instance.booking_id = booking_id
            form.instance.room = self.room

        return super().form_valid(form)

    
    def form_invalid(self,form):

        messages.error(self.request,self.error_message)
        return super().form_invalid(form)

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