# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render
from  django.http.response import HttpResponseRedirect
# Create your views here.
def testsession_view(request):
    reocders = request.session.get('recoders',[])
    return  render(request,'testsession.html',{'reocders':reocders})


def testsession(request):
    value = request.POST.get('recoder')
    # 你想获得session，如有有sesssionid（浏览器发送过来的），直接根据sessionid去查找数据库，没有sessionid，说明首次访问。我给创建一个session，然后将创建的session存储到数据库

    recoders = request.session.get('recoders')
    if recoders==None:
        recoders=[]
    recoders.append(value)
    request.session['recoders']=recoders
    return HttpResponseRedirect('/sessiondemo/testsession.html')