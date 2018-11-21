# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render
from django.http.response import HttpResponse
# Create your views here.
from django.views import View
# ?cartitems=['1,2,3','1,3,4']
from utils.cartutils import SessionCartManager
from view.views import BaseView, BaseRedirctView


class OrderView(View):
    def post(self,request):
        if request.session.get('user'):
           # 到订单界面
            # 购物项（订单）
            cartitems = request.POST.get('cartitems')
            # 重定向的问题？
            request.session['cartitems']=cartitems
            return HttpResponse('/order/orderlist/')
        else:
            # 登录界面
            return HttpResponse('/user/login/')


class OrderListView(BaseView):
    template_name = 'order.html'

    def get_extra_context(self, request):
        rawcartitems = request.session.get('cartitems',"")
        # del request.session['cartitems'] 创建完成订单在删除
        cartitems=rawcartitems.split(":")
        cart_manager = SessionCartManager(request.session)
        # 根据商品, 颜色，尺寸，数量获得订单项
        # 读取用户的默认收货地址
        # 如果创建订单成功，需不需要删除
        order_items=[]
        for cartitem in cartitems:
           order_items.append( cart_manager.get_cart_item1(*cartitem.split(',')))
        user = request.session.get('user')
        address = user.address_set.first() #
        allprice = 0
        for order_item in order_items:
            allprice+=order_item.all_price()
        return {'address':address,'orderitems':order_items,'allpirce':allprice,'raworderitems':rawcartitems}


from order.models import *
from goods.models import *
class OrderCreatedView(BaseRedirctView):
    redirct_url = '' #要支付的的url
    # 事务
    def handle(self,request):
        request.session.modified=True
        del request.session['cartitems']
        # 删除购物车记录 orderitems,
        orderitems = request.GET.get('orderitems')
        orderitems = orderitems.split(":")
        cart_manager = SessionCartManager(request.session)
        for orderitem in orderitems:
            # 删除失败
            cart_manager.delete_cart_item(*orderitem)
        import  time,uuid
        # order对象，（收货地址，订单项）（未付款，已付款，待发货，待收货，待评价，退货中，退货完成）
        Order.objects.create(name=request.GET.get('name'),
                             phone= request.GET.get('phone'),
                             address = request.GET.get('address'),
                             payway = request.GET.get('type'),
                             orderitems=orderitems,
                             user = request.session.get('user'),
                             sign = uuid.uuid4().get_hex(), # 基本上不会重复（订单的唯一标示）
                             order= str(time.time()*1000)  # 很多可能会重复（标示一个人在什么时间买的东西）
                             )
        # 库存--
        for orderitem in orderitems:
            print orderitem
            goodsid,colorid,sizeid,count=orderitem.split(',')
            store = Goods.objects.get(id=goodsid).store_set.filter(color_id=colorid).filter(size=Size.objects.get(id = sizeid)).first()
            store.count -=int(count)
            store.save() # 保存到数据库
        # 根据支付方式，生成字符界面
        pass