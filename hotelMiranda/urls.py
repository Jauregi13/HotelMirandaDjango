from django.urls import path
from .views import rooms,generales, contact, authenticate, order


urlpatterns = [
    path('', generales.redirectHome, name="redirectHome"),
    path("home/",  generales.renderHome, name="home"),
    path("aboutUs/", generales.renderAbout, name="aboutUs"),
    path("rooms/", rooms.getRooms, name="rooms"),
    path("rooms/available/", rooms.getRoomsAvailable, name="roomsAvailable"),
    path("rooms/<int:id>/",rooms.BookingRoom.as_view(), name="room"),
    path("offers/", rooms.getRoomsOffer, name="offers"),
    path("contact/", contact.ContactView.as_view(), name="contact"),
    path("login/",authenticate.loginPage, name="login"),
    path("register/", authenticate.register, name="register"),
    path("logout/", authenticate.logout, name="logout"),
    path("orders/", order.OrderListView.as_view(), name="order"),
    path("orders/create", order.CreateOrderView.as_view(), name="createOrder"),
    path("orders/<int:id>/edit",order.UpdateOrderView.as_view(), name="editOrder"),
    path("orders/<int:id>/delete", order.DeleteOrderView.as_view(), name="deleteOrder")
]