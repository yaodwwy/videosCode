# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render
from datetime import *
# Create your views here.
goods=[
    {'name':'苹果X','price':100},
    {'name':'苹果1','price':100},
    {'name':'苹果2','price':100},
    {'name':'苹果3','price':100},
    {'name':'苹果4','price':100},
]
def index_view(request):
    return render(request,'index.html',{'name':'hello','list':['hello','django'],'post':'归的基本思','d':datetime.today(),'html':'<h1>sad</h1>','goods':goods})

from  django.http.response import HttpResponseRedirect,HttpResponse
from  django.core.urlresolvers import reverse
def show_view(request):
    url = reverse('filter:new',args=[1008,10])
    # print  url
    return HttpResponseRedirect(url+'?name=张三')


from  renderutils.renderutils import render_context
def newdata_view(request,year,month):

    return render(request,'new.html',)


def base_view(request):
    return render(request,'index.html')


