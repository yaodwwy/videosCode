# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render,redirect

# Create your views here.
from django.views.decorators.gzip import gzip_page


@gzip_page
def index_view(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')
        if ('123456'==username and '123456'==password):
            request.session['user']=username
            return redirect('/user/usercenter/')
        else:
            return redirect('/user/')

    return render(request,'index.html')



from  django.http.response import HttpResponse
def user_center_view(request):
    # print HttpResponse(request.session.get('user', '') + ':欢迎')
    return HttpResponse(request.session.get('user','')+':欢迎')