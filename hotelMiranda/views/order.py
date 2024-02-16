from django.views import View
from django.contrib.auth.decorators import login_required
from django.shortcuts import render
from hotelMiranda.models import Order

class OrderView(View):

    
    @login_required(login_url='login')
    def get(self,request):
        print(request.user)
        user = request.user
        orders = Order.objects.filter(user=user.id)
        return render(request, "hotelMiranda/order.html", {'orders': orders})
    
    @login_required(login_url='login')
    def post(self,request):
        user = request.user
        return render(request, "hotelMiranda/order.html")
    
    @login_required(login_url='login')
    def patch(self,request):
        user = request.user
        return render(request, "hotelMiranda/order.html")
    
    @login_required(login_url='login')
    def delete(self, request):
        user = request.user
        return render(request, "hotelMiranda/order.html")