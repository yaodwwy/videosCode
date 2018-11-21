# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.http.response import HttpResponse
from django.shortcuts import render
from django.core.cache import caches
cache = caches['default']
# Create your views here.
def getPosts():
    posts = cache.get('posts')

    if posts==None:
        from  cachedemo.models import  Post
        posts = Post.objects.all();#会不会报错
        cache.set("posts",posts,60*1000)
        return  posts
    else:
        print '从内存中读取的'
        return posts


def cache_page(fun):
    import base64
    from  django.http.response import HttpResponse
    def wrapper(request):
        result = cache.get(base64.encodestring(str(fun)))
        if result != None:
            print '读取缓存'
            return HttpResponse(result)
        else:
            response = fun(request)
            cache.set(base64.encodestring(str(fun)),response.content,60)
            print '原生响应'
            return response
    return wrapper


@cache_page
def index_view(request):
    # html = cache.get('html')
    # if html!=None:
    #     print '响应缓存中的html',html
    #     return HttpResponse(html)
    posts = getPosts()
    reponse = render(request, 'cache_db.html', {'posts': posts})
    # cache.set('html',reponse.content,60)
    return reponse


