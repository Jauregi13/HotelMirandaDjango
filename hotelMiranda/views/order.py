from django.views.generic import ListView, CreateView, UpdateView, DeleteView
from django.contrib.auth.mixins import LoginRequiredMixin
from django.contrib.messages.views import SuccessMessageMixin
from django.shortcuts import render
from hotelMiranda.models import Order
from hotelMiranda.forms import CreateOrderForm, UpdateOrderForm

class OrderListView(LoginRequiredMixin, ListView):
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


class CreateOrderView(LoginRequiredMixin, SuccessMessageMixin, CreateView):
    model = Order
    form_class = CreateOrderForm
    template_name = "hotelMiranda/order/createOrder.html"
    login_url = '/login'
    success_url = '/orders'
    success_message = 'Order created successfully'

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

    def form_valid(self,form):
        form.instance.user = self.request.user
        return super().form_valid(form)

class UpdateOrderView(LoginRequiredMixin,SuccessMessageMixin, UpdateView):

    model = Order
    template_name = 'hotelMiranda/order/updateOrder.html'
    form_class = UpdateOrderForm
    pk_url_kwarg = 'id'
    success_url = '/orders'
    success_message = 'Order updated successfully'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context["title"] = 'Update order'
        context["title_page"] = 'Update an order'
        context["breadcrumb"] = 'Update order'
        return context


class DeleteOrderView(LoginRequiredMixin, SuccessMessageMixin, DeleteView):

    model = Order
    pk_url_kwarg = 'id'
    success_url = '/orders'
    success_message = 'Order deleted successfully'