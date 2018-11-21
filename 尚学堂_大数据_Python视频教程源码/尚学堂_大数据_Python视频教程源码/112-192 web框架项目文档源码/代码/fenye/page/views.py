# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render
from django.views.decorators.gzip import gzip_page

from  page.models import *
# Create your views here.

from  django.core.paginator import  Paginator,Page,EmptyPage,InvalidPage
paginator = Paginator(Post.objects.all(),1)
def post_list_view(request,pageNum=1):
    print  request.META['name']
    # try:
    pageNum=int(pageNum)
    if pageNum<1:
        pageNum=1
    if pageNum>paginator.num_pages:
        pageNum=paginator.num_pages
    page = paginator.page(pageNum)
    pervious=1
    last = 2

    if pageNum>pervious:
        start = pageNum-pervious
        end = pageNum+last
    if pageNum<=pervious:
        start =1
        end=pervious+last+1
    if end>=paginator.num_pages:
        x=end-paginator.num_pages
        end=paginator.num_pages
        start-=x
    # except InvalidPage:
    #     print '无效'
    #     page = paginator.page(1)
    # except EmptyPage:
    #     print  '空'
    #     page = paginator.page(paginator.num_pages)

    posts = page.object_list  # 获得了这一页所有的帖子
    return render(request,'post_list_view.html',{'posts':posts,'page':page,'page_range':range(start,end+1)})