# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render
from  django.http.response import  HttpResponse
# Create your views here.
def cookie(request):
    response = HttpResponse('已经写入cookie')
    response.set_cookie('name','django',max_age=60*10)
    response.set_cookie('age','10')
    response.set_cookie('sex','男',path='/cookiedemo/')
    return response