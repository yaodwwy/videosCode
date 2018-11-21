#coding=utf-8
from http.server import *
class User(object):
    def __init__(self,account,password):
        self.account = account
        self.password = password
class UserAuth(object):
    def __init__(self,get_response):
        self.get_response = get_response
    def __call__(self, request ,*args, **kwargs):
        if request.PATH.startswith('/user'):
            return HttpResponse('未经授权')
        # 真实处理
        return self.get_response(request)

class User2Auth(object):
        def __init__(self, get_response):
            self.get_response = get_response

        def __call__(self, request, *args, **kwargs):
            if request.PATH.startswith('/user'):
                return HttpResponse('未经授权User2Auth')
            return self.get_response(request)

class User3Auth(object):
        def __init__(self, get_response):
            self.get_response = get_response

        def __call__(self, request, *args, **kwargs):
            response = self.get_response(request)
            response.content = '<font color="red">%s</font>'%response.content
            return response

# HttpRequest
def index_view(request):
    repsone = render('login.html')
    return repsone
def login_view(request):
    account = request.get_query('account')
    password = request.get_query('password')
    if account == '123456' and password == '123456':
        request.session.set('user',User(account=account,password=password))
        # print '用户登录成功',request.session.get1('user'),type(request.session)
        return HttpRedirctResponse('http://127.0.0.1:9001/usercenter')
    else:
        return HttpRedirctResponse('http://127.0.0.1:9001')
def post(request):
    return HttpResponse('post'+request.get_query('name','没有'))
# @User2Auth
# @UserAuth
# @User3Auth
def user(request):
    # print request.session.get1('user','没有找到'),  '进来了么'
    return HttpResponse('欢迎:%s'%request.session.get1('user','当前没有登录').account)
# user = UserAuth(user)对象
#user(request)   UserAuth(user)()
def tem(reuqest):
    with open('test.html') as fr:
        content = fr.read()
    content = content.replace('{{name}}','张三')
    return HttpResponse(content)
routers=[
    # 通过path直接匹配
    (r'^/$',index_view),
    (r'^/login$',login_view),
    (r'^/post$',post),
    (r'^/usercenter$',user),
    (r'^/tem',tem),
]


server = HttpServer(address=('',9001),routers=routers,static_url='/abc',static_file_dir='acd')
server.start()