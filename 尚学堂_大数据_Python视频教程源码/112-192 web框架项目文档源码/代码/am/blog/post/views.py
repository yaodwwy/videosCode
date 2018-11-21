# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render
from  post.models import Category,Post
# Create your views here.
def index(request):
    cates = Category.objects.all()
    return  render(request,'index.html',{'categorys':cates})


def handle_category(request,categoryId):
    cate = Category.objects.get(id = categoryId)
    return render(request,'categorydeatils.html',{'posts':cate.post_set.all()})

