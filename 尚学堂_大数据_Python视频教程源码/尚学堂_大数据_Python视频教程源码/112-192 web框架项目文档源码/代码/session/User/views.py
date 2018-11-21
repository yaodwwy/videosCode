# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render
from  django.http.response import HttpResponse,HttpResponseRedirect
from redis_sessions.session import SessionStore

from  User.models import *
# Create your views here.
def login_view(request):
    if request.session.get('user'):
        return HttpResponseRedirect('/user/user.html')
    error = request.session.get('loginError',"")
    if  error:
        del request.session['loginError']
    return render(request,'login.html',{'error':error})


def login(request):
    try:
        user = User.login(**request.POST.dict())
        request.session['user']=tojson(user,fields=['username'])
        request.session.set_expiry(60)
    except User.UserNotFonudException as e:
        request.session['loginError']=e.message
        return HttpResponseRedirect('/user/login.html')
    return HttpResponseRedirect('/user/user.html')
def tojson(obj,fields=None):
    from django.core.serializers import serialize
    return eval(serialize('json',[obj,],fields=fields)[1:-1])['fields']


def user_view(request):
    print  request.session.session_key
    user = request.session.get('user')
    SessionStore().clear()
    return render(request,'user.html',{'user':user})


def logout(request):
    if 'user' in request.session:
        del request.session['user']
    return HttpResponseRedirect('/user/login.html')


def session_view(request):

    return HttpResponse(request.session.items())


def clearsession(request):
    request.session.clear()
    return HttpResponse('清空了')


def deletesession(request):
    request.session.flush()
    return HttpResponse('删除了')
