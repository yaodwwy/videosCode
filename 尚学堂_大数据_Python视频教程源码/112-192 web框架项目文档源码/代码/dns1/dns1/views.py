#coding=UTF-8
from  django.http.response import HttpResponse
from  django.http.request import  HttpRequest
from django.shortcuts import render
def index(request):
    return render(request,'index.html')
def search(request):
    # k = request.GET.get('keyword')
    # print  k
    # for v in request.GET.getlist('options'):
    #     print  v
    # print  'age' in request.GET
    # str =u'查到了'+k
    # return  HttpResponse(str)
    print  request.POST.getlist('options')
    return  HttpResponse('查到了')