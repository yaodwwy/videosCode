#coding=UTF-8
from  django.http.response import HttpResponse

def index(request):
    return HttpResponse('我是百度')