# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render
from  movie.models import Movie
# Create your views here.
def index(request,numpage=1):
    currentPage = int(numpage)
    nextPage=currentPage+1
    pervPage= currentPage-1

    return render(request,'index.html',{'movies':Movie.objects.all()[currentPage*16:(currentPage+1)*16],'nextPage':nextPage,'prevPage':pervPage})