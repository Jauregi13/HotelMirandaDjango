from django.shortcuts import render,redirect
from django.http import HttpResponse

def renderHome(request):
    return render(request,'hotelMiranda/home.html')

def redirectHome(request):
    return redirect('home/')

def renderAbout(request):
    return render(request, "hotelMiranda/about.html")

def renderContact(request):
    return render(request, "hotelMiranda/contact.html")