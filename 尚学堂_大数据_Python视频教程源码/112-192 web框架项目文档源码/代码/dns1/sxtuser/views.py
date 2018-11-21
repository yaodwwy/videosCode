# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render
from  django.http.response import  HttpResponseBadRequest,HttpResponse,HttpResponseRedirect
# Create your views here.
def login_view(request):
    return render(request,'user/login.html')


def login(request):
    account = request.POST.get('account')
    password = request.POST.get('password')
    from  sxtuser.models import User
    try:
        user = User.login(account,password)
    except User.DoesNotExist:
        return  render(request,'user/login.html',{'error':"账号密码不匹配"})
    return  HttpResponse('欢迎:'+user.account)


