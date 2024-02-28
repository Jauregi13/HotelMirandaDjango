from django.shortcuts import render,redirect
from django.http import HttpResponse
from hotelMiranda.forms import RoomsAvailableForm

def renderHome(request):
    title = 'Home'
    form = RoomsAvailableForm()
    return render(request,'hotelMiranda/home.html', {'title' : title, 'form': form})

def redirectHome(request):
    return redirect('home/')

def renderAbout(request):
    title = 'About Us'
    breadcrumb = 'About'
    return render(request, "hotelMiranda/aboutUs.html", {'title': title, 'title_page': title, 'breadcrumb': breadcrumb})