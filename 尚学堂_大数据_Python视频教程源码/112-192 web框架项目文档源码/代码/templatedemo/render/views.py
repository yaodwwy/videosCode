# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render
from  django.http.response import HttpResponse
from  django.template import Template
from  django.template import Context
from  renderutils.renderutils import render_context,render_loader_context
# Create your views here.
def index_view(request):
    # return  render(request,'index.html',{'name':'张三'})
    # return  render_context(request,'index.html',{'name':'李四'})
    # return  render_loader_context(request,'index.html',{'name':'李四'})
    from  datetime import  date
    return  render(request,'b.html',{'name':'<script>alert("天气不错")</script>'})
# admin 1' or '1
# select * from user where username = 'admin' and password ='1' or '1'

class User():
    class NameFordiennAccessException(Exception):
        silent_variable_failure = True
        def __init__(self):
            Exception.__init__(self,'没有访问名字的权限')
    def __init__(self,name,age):
        self.name = name
        self.age = age
    def get(self):
        raise User.NameFordiennAccessException()
        return  self.name




