#coding=UTF-8
# 用户如果没有登录，是不能访问，有关用户信息界面的
from  django.http.response import HttpResponseRedirect
import  re

from django.middleware.gzip import GZipMiddleware


class UserAuth():
    def __init__(self,get_response):
        self.get_response=get_response
    def __call__(self, request):
        path =  request.path
        if  re.match('^/user/.+',path):
            if request.session.get('user')==None:
                return HttpResponseRedirect('/user')
        response = self.get_response(request)

        return response

# 管理权限，普通的员工，经理，admin，
