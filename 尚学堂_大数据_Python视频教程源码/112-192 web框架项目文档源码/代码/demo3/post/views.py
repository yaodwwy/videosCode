# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render
from django.http import HttpResponse
from django.shortcuts import render
import  os
# Create your views here.
from  models import *
def index(request):
    # print  __file__
    # print  os.path.dirname(__file__)
    # print  os.path.dirname(os.path.dirname(__file__))
    # BASE_DIR=os.path.dirname(os.path.dirname(__file__))
    #
    # with open(os.path.join(BASE_DIR,'templates/index.html')) as fr:
    #     content = fr.read()
    # from django.template import Template
    # t = Template(content)
    # from django.template.context import Context
    # c = Context({'categorys':Category.objects.all()})
    # return HttpResponse(t.render(c))
    map = {'categorys':Category.objects.all(),'title':'Django全栈开发'}
    map['categorys']
    return  render(request,'index.html',map)