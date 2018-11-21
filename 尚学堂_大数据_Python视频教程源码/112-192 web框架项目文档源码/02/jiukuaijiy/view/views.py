#coding=UTF-8
from django.http.request import QueryDict
from  django.views import View
from  django.shortcuts import  render
# 渲染,准备阶段
class BaseView(View):
    template_name = None

    def get(self,request,*args,**kwargs):
      # 准备

      if hasattr(self,'prepare') :
          getattr(self,'prepare')(request,*args,**kwargs)
      #获得cookie使用的
      if hasattr(self,'handle_request_cookie'):
          getattr(self,'handle_request_cookie')(request,*args,**kwargs)

      response = render(request, self.template_name, self.get_context(request))
      # 添加cookie使用的
      if hasattr(self,'handle_response_cookie'):
          getattr(self,'handle_response_cookie')(response,*args,**kwargs)
      return response

    def get_context(self, request):
        context = {}
        context.update(self.get_extra_context(request))
        return context

    def get_extra_context(self, request):
        return {}
