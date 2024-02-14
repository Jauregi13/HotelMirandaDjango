from django.shortcuts import render,redirect
from hotelMiranda.forms import LoginForm
from django.contrib.auth import login
from django.contrib import messages

def loginPage(request):

    title = 'Login'
    login_form = LoginForm()

    if request.method == 'POST':
        login_form = LoginForm(request.POST)
        if login_form.is_valid():
           
           user = login_form.cleaned_data['user']
           login(request, user)
           return redirect('home')

    return render(request,"hotelMiranda/login.html", {'title': title,'title_page': title, 'breadcrumb': title, 'form': login_form})


def register(request):
    pass