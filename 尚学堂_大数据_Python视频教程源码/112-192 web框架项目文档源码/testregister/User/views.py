# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.core.files.uploadedfile import InMemoryUploadedFile
from django.http.request import QueryDict
from django.shortcuts import render
from  django.http.response import HttpResponse,HttpResponseRedirect
from  User.models import *
# Create your views here.
def register_view(request):
    return render(request,'register.html')


def register(request):
    try:
        user = User.register(**request.POST.dict())
    except User.UserExistException , e:
        # 重定向问题
        return  render(request,'register.html',{'error':e.message})
        # return  HttpResponseRedirect('/user/',{'error':e.message})
        # session
    return HttpResponse('不错')


def online_view(request):
    if request.method=="POST":
        source = request.POST.get('source')
        result =  eval(source)
        return  render(request,'online.html',{"result":result})
    return render(request,'online.html')
import  os
import time
from  testregister.settings import BASE_DIR
def upload(request):
    username =   request.POST.get('username')
    os.mkdir(os.path.join(BASE_DIR,username))
    file = request.FILES.get('headimg')
    name = file.name[:file.name.index(r'.')]+str(time.time()*1000)+file.name[file.name.index(r'.'):]
    with open(os.path.join(BASE_DIR,username+"/"+name),'wb') as fw:
        for part in file.chunks():
            fw.write(part)
    return  HttpResponse('上传成功')


def upload_view(request):
    return render(request,'upload.html')
def get_cookies(request):

    return render(request,'cookies.html',{'cookies':request.COOKIES})


def write_cookies(request):
    response = HttpResponse('我写了一个cookies')
    from  datetime import *
    response.set_cookie('abc','asdsadsad',expires=datetime.today()+timedelta(30),path='/user/')
    return response


def goods(request):
    mygoods = [{'name':'iphoneX上市了'},{'name':'双11商品奖见了'},{'name':'今天天气不错'}]
    return render(request,'goods.html',{'goods':mygoods,'goodshistory':eval(request.COOKIES.get('goodshistory'))})


def write_goods_cookies(request):
    name = request.GET.get('name')
    goodsHistory = request.COOKIES.get("goodshistory")
    if not  goodsHistory:
        goodsHistory=[]
    else:
        goodsHistory = eval(goodsHistory)
    response = HttpResponse(name+u'存储好了')
    goodsHistory.append(name)
    response.set_cookie('goodshistory',goodsHistory,max_age=60*60*24,path='/user/')
    return response