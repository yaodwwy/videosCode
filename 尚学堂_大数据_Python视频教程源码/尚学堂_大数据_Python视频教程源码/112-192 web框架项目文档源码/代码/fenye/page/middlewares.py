#coding=UTF-8


class MySession():
    def __init__(self,get_response):
        print  get_response,type(get_response)
        self.get_response=get_response
    def __call__(self, request):
        print  '请求之前处理'
        request.META.update({'name':'张三'})
        # 一般通过请求头做一些处理
        response = self.get_response(request)#处理请求
        response.setdefault('name','李四')
        print '相应之后处理'
        return response
from  django.http.response import HttpResponse
class IPBlock():
    # 拦截黑名单

    def __init__(self,get_response):
        self.get_response=get_response
    def __call__(self, request):
        # 典型的在请求之前进行处理
        remote_ip = request.META['REMOTE_ADDR']
        if remote_ip in ['192.168.1.21']:
            return HttpResponse('禁止访问')
        response = self.get_response(request)
        return  response