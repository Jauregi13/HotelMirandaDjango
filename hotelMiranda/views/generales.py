from django.shortcuts import render
from django.http import HttpResponse

def renderHome(request):
    return render(request,'hotelMiranda/home.html')

def renderAbout(request):
    return render(request, "hotelMiranda/about.html")