# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render
from post.models import *
# Create your views here.
def index_view(request,num='1'):
    page,page_range = Post.get_posts_by_page(num,1)
    return render(request,'index.html',context={'page':page,'page_range':page_range})


def post_details_view(request,post_id):
    try:
        post = Post.objects.get(id=post_id)
    except:
        pass
    return render(request, 'details.html', {'post': post})


def category_details_view(request,category_id=None):
    posts = Post.objects.filter(category=category_id).order_by('-created')
    return render(request,'archive.html',{'posts':posts})


def date_details_view(request,year,month):
    posts = Post.objects.filter(created__year=year,created__month=month).all()
    return render(request,'archive.html',{'posts':posts})