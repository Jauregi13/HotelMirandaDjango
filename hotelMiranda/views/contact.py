from django.shortcuts import render,redirect
from django.http import HttpResponse
from django.views import View
from hotelMiranda.forms import ContactForm
import random
from hotelMiranda.models import Contact

class ContactView(View):

    def get(self,request):
        title = 'Contact'
        title_page = 'New Details'
        breadcrumb = 'Blog'
        form = ContactForm()
        return render(request,'hotelMiranda/contact.html', 
        {'title' : title, 'title_page' : title_page, 'breadcrumb': breadcrumb, 'form' : form})
    
    def post(self,request):
        form = ContactForm(request.POST)

        if form.is_valid():
            contact = form.save(commit=False)
            review_id = random.randint(10000,99999)
            while Contact.objects.filter(review_id=review_id).exists():
                review_id = random.randint(10000,99999)
            contact.review_id = review_id
            contact.save()
            form = ContactForm()
        
        return render(request, 'hotelMiranda/contact.html',{'form' : form})