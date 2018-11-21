#coding=UTF-8
from  django.http.response import HttpResponse

from  Test.models import *

carts=[
    {'key':{'goodsid':1,'colorid':2,'sizeid':3,'count':10}}
]
#11-10-10-10     #1-100-
def index_view(request):
    print  request.session.get('cart','没有')
    request.session['cart']=[Person(name='张三')]
    return HttpResponse('asdsadsad')


def add_view(request):
    cartitems = request.session.get('cart')
    for cartitem in cartitems:
        cartitem.save()
    return HttpResponse('图案家 成功')