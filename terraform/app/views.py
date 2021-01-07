from django.shortcuts import render
import requests

from django.http import request
from django.http import HttpResponse

def get_client_ip(request):
    x_forwarded_for = request.META.get('HTTP_X_FORWARDED_FOR')
    if x_forwarded_for:
        ip = x_forwarded_for.split(',')[0]
    else:
        ip = request.META.get('REMOTE_ADDR')
    return ip

def home(request):
    ip_address = get_client_ip(request)
    response = requests.get("http://api.ipstack.com/{0}?access_key=   ".format(ip_address))
    geodata = response.json()
    return render(request, 'home.html', {
        'ip': geodata['ip'],
        'country': geodata['country_name']
    })
