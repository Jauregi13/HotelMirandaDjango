from django.shortcuts import render,redirect
from django.http import HttpResponse
from django.views import View
from django.views.generic import CreateView
from django.contrib.messages.views import SuccessMessageMixin
from hotelMiranda.forms import ContactForm
import random
from hotelMiranda.models import Contact

class ContactView(SuccessMessageMixin, CreateView):

    model = Contact
    form_class = ContactForm
    template_name = 'hotelMiranda/contact.html'
    success_url = '/contact/'
    success_message = 'Message has sent successfully'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'Contact'
        context['title_page'] = 'New Details'
        context['breadcrumb'] = 'Blog'
        return context
    
    def form_valid(self,form):
        review_id = random.randint(10000,99999)
        while Contact.objects.filter(review_id=review_id).exists():
            review_id = random.randint(10000,99999)

        form.instance.review_id = review_id
        return super().form_valid(form)