#coding=utf-8
from django.shortcuts import render
from  django.http.response import HttpResponse,HttpResponseRedirect
def get(request):
    return HttpResponse('hello get'+request.GET.get('name'))
def index(request):
    return render(request,'index.html')

def post(request):
    #django给大多数的请求头都设置成HTTP_
    print request.META.get('HTTP_ANC','没欧东西')
    return HttpResponse('hgello post'+request.POST.get('name','')+request.POST.get('age',''))


def postjson(request):
    "{'name':'张三','age':10}"
    return HttpResponse("[{'phone': 19233333, 'name': '张三'}, {'phone': 192333444, 'name': '李四'}]"
)


def redirect(request):
    reponse = HttpResponse('/static/asd.html')
    return reponse