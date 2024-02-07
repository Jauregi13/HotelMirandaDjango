from django.shortcuts import render,redirect
from django.http import HttpResponse

def renderHome(request):
    title = 'Home'
    return render(request,'hotelMiranda/home.html', {'title' : title})

def redirectHome(request):
    return redirect('home/')

def renderAbout(request):
    title = 'About Us'
    breadcrumb = 'About'
    return render(request, "hotelMiranda/aboutUs.html", {'title': title, 'title_page': title, 'breadcrumb': breadcrumb})

def renderContact(request):
    title = 'Contact'
    return render(request, "hotelMiranda/contact.html", {'title': title})