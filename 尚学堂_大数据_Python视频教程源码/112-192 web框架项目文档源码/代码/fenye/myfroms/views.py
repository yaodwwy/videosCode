# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render
from myfroms.froms import UserForm
from  django.http.response import  HttpResponse
from  myfroms.models import *
# Create your views here.
def index_view(request):
    if request.method == 'POST':
        u = UserForm(request.POST)
        if u.is_valid():
            # 浏览器向服务器发送的都是字符串
            user = User.register(**u.cleaned_data)
            return HttpResponse(user.username+":欢迎您")
    else:
        u=None
    return render(request,'index_view.html',{'userfrom':u})