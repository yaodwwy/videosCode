# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render
from  django.http.response import HttpResponse
from  post.models import Post
# Create your views here.
def index(request,num='0'):
    return HttpResponse('我是page'+num+'页面')


def get_archive(request,year,month,day):
    posts = Post.objects.filter(created__year=year,created__month=month,created__day=day)
    return render(request,'archives.html',{'posts':posts})


def get_post_by_category(request,categoryId):
    return HttpResponse('我是分类下的帖子额:'+categoryId)