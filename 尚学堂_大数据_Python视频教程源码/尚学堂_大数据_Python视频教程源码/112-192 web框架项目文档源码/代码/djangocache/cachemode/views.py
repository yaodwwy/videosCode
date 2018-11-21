# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render

# Create your views here.
from django.views.decorators.cache import  cache_page
@cache_page(60*10000)
def index_view(request):
    request.session['asd']='hello'
    return render(request,'index.html',{'user':'sadsad'})