# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from  django.http.response import HttpResponse
from django.shortcuts import render,redirect

# Create your views here.
from  django.views import View
from django.views.generic import ListView


class MyView(View):
    def get(self,request):
        return  render(request,'login.html')
    def post(self,request):
        return  redirect('/view/center')
from  myview.models import Post
class MyListView(ListView):
    template_name = 'list.html'
    model = Post


# def index_view(request):
#     return HttpResponse('数据')


def center_view(request):
    return HttpResponse('欢迎您')