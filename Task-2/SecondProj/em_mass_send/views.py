from django.shortcuts import render

# Create your views here.
from django.shortcuts import render
from django.core.mail import send_mail
from django.http import HttpResponse
from django.conf import settings
# Create your views here.
def index(request):
    return render(request, "index.html")

def send(request):
    subject = request.POST['subject']
    mail_content = request.POST['message']
    settings.EMAIL_HOST_USER = request.POST['from']
    settings.EMAIL_HOST_PASSWORD = request.POST['password']
    to_many=request.POST['to'].split(',')
    if subject and mail_content and settings.EMAIL_HOST_USER:
        send_mail(subject, mail_content, settings.EMAIL_HOST_USER, to_many, fail_silently=False)
        return HttpResponse('Your mail has been sent')
    else:
        return HttpResponse('Enter Valid Data in the fields')
