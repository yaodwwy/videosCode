#coding=UTF-8
from  datetime import date
def globla_context_process(request):
    return {'right':'111我是右面的全局的','d':date.today()}
