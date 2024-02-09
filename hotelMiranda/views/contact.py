from django.shortcuts import render,redirect
from django.http import HttpResponse

def renderContact(request):
    title = 'Contact'
    title_page = 'New Details'
    breadcrumb = 'Blog'
    return render(request,'hotelMiranda/contact.html', {'title' : title, 'title_page' : title_page, 'breadcrumb': breadcrumb})