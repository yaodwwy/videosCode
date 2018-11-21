# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render
from User.models import *
from  view.views import *
# Create your views here.
class RegisterView(BaseView):
    template_name = 'register.html'

class RegisterControlView(BaseRedirctView):
    redirct_url = '/user/usercenter/'

    # 完成表单的验证
    def handle(self, request, *args, **kwargs):
        user = User.register(**request.POST.dict())
        request.session['user'] = user

# 每次登陆发给服务器的密码都不一样
# md5   *加盐,(客户端加密)
#password = hex_md5(password)
# password = hex_md5(password+'时间')
# 时间
#password = md.update(password+'时间')
# 匹配
def usercenter(request):
    user = request.session.get('user')
    return HttpResponse(user.account +'欢迎')


class LoginView(BaseView):
    template_name = 'login.html'
class LoginControl(BaseRedirctView):
    redirct_url = '/user/usercenter/'
    def handle(self,request,*args,**kwargs):
        user = User.login(**request.POST.dict())
        print  user,'用户登录成功没有'
        request.session['user']=user

