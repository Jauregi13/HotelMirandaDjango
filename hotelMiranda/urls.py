from django.urls import path
from .views import rooms,generales,contact

urlpatterns = [
    path('', generales.redirectHome, name="redirectHome"),
    path("home/",  generales.renderHome, name="home"),
    path("aboutUs/", generales.renderAbout, name="aboutUs"),
    path("rooms/", rooms.getRooms, name="rooms"),
    path("rooms/", rooms.getRoomsAvailable, name="roomsAvailable"),
    path("rooms/<int:id>/",rooms.getRoomById, name="room"),
    path("offers/", rooms.getRoomsOffer, name="offers"),
    path("contact/", contact.renderContact, name="contact")
]