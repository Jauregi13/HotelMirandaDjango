from django.views.generic import ListView, CreateView, UpdateView, DeleteView
from django.contrib.auth.mixins import LoginRequiredMixin
from django.shortcuts import render
from hotelMiranda.models import Order

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
