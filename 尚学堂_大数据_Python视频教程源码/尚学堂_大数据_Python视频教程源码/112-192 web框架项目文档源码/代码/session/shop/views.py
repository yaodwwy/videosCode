# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render
goods=[
    {'name':'苹果x','price':120,'img':'http://upload.techweb.com.cn/2017/1023/1508755872165.jpg'},
    {'name':'苹果1','price':120,'img':'http://upload.techweb.com.cn/2017/1023/1508755872165.jpg'},
    {'name':'苹果2','price':120,'img':'http://upload.techweb.com.cn/2017/1023/1508755872165.jpg'},
    {'name':'苹果3','price':120,'img':'http://upload.techweb.com.cn/2017/1023/1508755872165.jpg'},
    {'name':'苹果4','price':120,'img':'http://upload.techweb.com.cn/2017/1023/1508755872165.jpg'},
    {'name':'苹果5','price':120,'img':'http://upload.techweb.com.cn/2017/1023/1508755872165.jpg'},
    {'name':'苹果6','price':120,'img':'http://upload.techweb.com.cn/2017/1023/1508755872165.jpg'},
    {'name':'苹果7','price':120,'img':'http://upload.techweb.com.cn/2017/1023/1508755872165.jpg'},
    {'name':'苹果8','price':120,'img':'http://upload.techweb.com.cn/2017/1023/1508755872165.jpg'},
    {'name':'苹果9','price':120,'img':'http://upload.techweb.com.cn/2017/1023/1508755872165.jpg'},
]
# Create your views here.
def goods_view(request):
    referer = request.META.get("HTTP_REFERER")
    if referer:
       if not referer.startswith('http://127.0.0.1'):
           return HttpResponse('禁止访问')
    return render(request,'shop/goods.html',{'goods':goods})

from  django.http.response import HttpResponse,HttpResponseRedirect
def add_cart(request):

    goodsname = request.GET.get('name')
    #获得了商品的唯一表示
    #获得购物车
    #判断有没有商品，如果有购物车中此商品，商品的数量+1，如果购物车中没有商品，将商品加入购物车，1，
    #重定向到购物车.html
    cart = request.session.get('cart')
    if cart==None:
        cart={}
    count = cart.get(goodsname)
    if count==None:
        count=1
    else:
        count+=1
    cart[goodsname]=count
    request.session['cart']=cart
    return HttpResponseRedirect('/shop/cart.html')


def cart_view(request):
    cart = request.session.get('cart',{})
    return render(request,'shop/cart.html',{'cart':cart})


def show_view(request):
    return render(request,'a.html')