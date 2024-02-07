from django.urls import path
from .views import rooms,generales

urlpatterns = [
    path("home/",  generales.renderHome, name="home"),
    path("about/", generales.renderAbout, name="about"),
    path("rooms/", rooms.getRooms, name="rooms"),
    path("rooms/", rooms.getRoomsAvailable, name="roomsAvailable"),
    path("rooms/<int:room_id>/",rooms.getRoomById, name="room"),
    path("offers/", rooms.getRoomsOffer, name="offers"),
    path("contact/", generales.renderContact, name="contact")
]