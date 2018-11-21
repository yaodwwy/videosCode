# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render
from session.settings import  BASE_DIR
from  django.http.response import HttpResponseNotModified
import  os
# Create your views here.
def cache_view(request):
    last_modified =  request.META.get('HTTP_IF_MODIFIED_SINCE')
    path = os.path.join(BASE_DIR,'templates/cache.html')
    current_modified = os.path.getmtime(path)
    if last_modified==None or last_modified!=str(current_modified):
        response = render(request,'cache.html')
        response.setdefault('Cache-Control','no-cache')
        response.setdefault('Last-Modified',current_modified)
        response.setdefault('name','abc')
        return response
    else:
        return HttpResponseNotModified()
from  django.conf.global_settings import