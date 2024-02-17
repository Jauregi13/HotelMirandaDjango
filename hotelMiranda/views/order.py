from django.views.generic import ListView, CreateView, UpdateView, DeleteView
from django.contrib.auth.mixins import LoginRequiredMixin
from django.shortcuts import render
from hotelMiranda.models import Order
from hotelMiranda.forms import OrderForm

class OrderListView(LoginRequiredMixin,ListView):
    model = Order
    template_name= "hotelMiranda/order/orderList.html"
    login_url = '/login/'

    def get_queryset(self):

        return Order.objects.filter(user=self.request.user)

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context["title"] = 'Your orders'
        context["title_page"] = 'Your Orders'
        context["breadcrumb"] = 'Orders'
        return context


class CreateOrderView(LoginRequiredMixin,CreateView):
    model = Order
    form_class = OrderForm
    template_name = "hotelMiranda/order/createOrder.html"
    login_url = '/login/'

    def get_form_kwargs(self):
        kwargs = super().get_form_kwargs()
        kwargs['user'] = self.request.user
        return kwargs

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context["title"] = 'Add order'
        context["title_page"] = 'Place an order'
        context["breadcrumb"] = 'Add order'
        return context
