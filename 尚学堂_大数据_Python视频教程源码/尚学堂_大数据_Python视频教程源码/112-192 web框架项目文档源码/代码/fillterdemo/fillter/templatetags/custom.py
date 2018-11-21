#coding=UTF-8
from  django.template import Library
#创建一个Libray对象
register = Library()

@register.filter
def strip(value,position):
    return  value[position:]
#takes_context=True 可以获得所有的参数
@register.simple_tag(takes_context=True)
def showdata(context,data):
    print (context['right'])
    return str(data.year)+"年"