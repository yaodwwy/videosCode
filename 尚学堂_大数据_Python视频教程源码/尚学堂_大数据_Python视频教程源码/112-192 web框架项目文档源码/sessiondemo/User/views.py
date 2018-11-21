# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render
from  django.http.response import HttpResponse,HttpResponseRedirect
# Create your views here.
def register_view(request):
    error = request.session.get('registerError','')
    return render(request,'register.html',{'error':error})
from  User.models import User
def register_control(request):
    try:
        user = User.register(**request.POST.dict())
        request.session['user']=warrer(user)
    except User.UserExistException as e:
        request.session['registerError']=e.message
        return HttpResponseRedirect('/user/register.html')
    return HttpResponseRedirect('/user/user.html')


def user_view(request):
    user = request.session.get('user')
    print  type(user)
    # if(not  user):
    #     return  HttpResponseRedirect('/user/register.html')
    import  json
    print json.dumps(user)
    return render(request,'user.html',{'user':user})


def login_view(request):
    return render(request,'login.html',{'error':request.session.get('loginError',"")})


def login_control(request):
    try:
        user = User.login(**request.POST.dict())
        import  json
        # session中不能存储自定义对象
        # session将数据存储到数据库，
        # 对象转换成字符串 序列化 {'username':user.username}
        # 把字符串转换成对象是 反序列化

        request.session['user']=warrer(user)
    except User.UserNotFoundException as a:
        request.session['loginError']=a.message
        return  HttpResponseRedirect('/user/login.html')
    except Exception as e :
        print e
        print '出错了'
    return HttpResponseRedirect('/user/user.html')

def warrer(obj):
    d = {}
    for k,v in obj.__dict__.items():
        d[k]=str(v)
    return  d