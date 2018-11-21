#coding=utf-8
import socket
import os
TEMPATE_PATH=os.path.dirname(os.path.dirname(__file__))
BASE_DIR = TEMPATE_PATH
class Session(object):
    def __init__(self):
        import uuid
        self.__sessionid = uuid.uuid4().get_hex()
        self.__cache = {}
    def set(self,k,v):
        print '存储进来么',k,v
        self.__cache[k]=v
        print '存储的数据中',self.__cache,id(self.__cache)
    def get1(self,k,defualut=None):
        print '读取存储的数据中==========>', self.__cache
        return self.__cache.get(k,defualut)
    def clear(self):
        self.__cache.clear()
    def get_sessionid(self):
        return self.__sessionid
# 单利的
class SessionManager(object):
    __caches={}
    def __new__(cls, *args, **kwargs):
        if not hasattr(cls,'instance'):
            setattr(cls,'instance',super(SessionManager,cls).__new__(cls))
        return getattr(cls,'instance')
    def get_session(self,sessionid):
        print '浏览器发的sesionid%s'%sessionid
        if sessionid == None :sessionid=""
        session = self.__caches.get(sessionid,None)
        print '在缓存中找到的session',session
        if session == None :
            session = Session()
            print '没有找到重新生成的session', session,session.get_sessionid()
            self.__caches[session.get_sessionid()]=session
        print '服务器存储的session:',self.__caches
        return session
class HttpRequest(object):
    def __init__(self,client_socket,client_address):
        self.__querys={}
        self.__cookies={}
        import datetime
        request_data = client_socket.recv(4096)
        request_head_data,request_body_data =request_data.split('\r\n\r\n')
        request_head_datas = request_head_data.split('\r\n')
        request_line_data = request_head_datas[0] #
        request_heads = request_head_datas[1:]
        self.wrap_request_line(request_line_data)
        self.wrap_request_body(request_body_data)
        self.wrap_headers(request_heads,client_address)
        self.wrap_cookies()
        self.wrap_session()
      #  print '来访者ip:%s:时间:%s: %s  :%s'%(self.headers.get('remote'),str(datetime.datetime.today()),self.METHOD,self.PATH)
       # print self.get_query('name')
    def wrap_headers(self, request_heads,client_address):
        self.headers = {}
        for head in request_heads:
            # host : 127.0.0.1:8000
            index = head.find(':')
            k,v= head[0:index],head[index+1:]
            # self.headers[('http_'+k).upper()]=v  #django写法
            self.headers[k]=v
        self.headers['remote']=str(client_address)
    def wrap_request_line(self, request_line_data):
        self.METHOD,self.PATH,self.SCHEMA = request_line_data.split()
        if self.METHOD.lower() == 'get' and self.PATH.find('?')!=-1:

            self.PATH,querys = self.PATH.split('?')
            self.wrap_querys(querys)
    def wrap_querys(self, querys):

        querys = querys.strip()
        if len(querys) == 0 : return
        for query in querys.split('&'):
            k,v = query.split('=')
            self.__querys[k]=v
    # 有没有写set方法（请求参数都是只读的）
    def get_query(self,k,default=None):
        return self.__querys.get(k,default)
    def wrap_request_body(self, request_body_data):
        if self.METHOD.lower() == 'post':
           self.wrap_querys(request_body_data)

    def wrap_cookies(self):
        cookies = self.headers.get('Cookie', None)

        if cookies != None:
            for cookie in cookies.split(';'):
                k,v = cookie.split('=')
                self.__cookies[k.strip()]=v
                print '解析的coolkie:',k,v
    def get_cookie(self,key,default=None):
        print 'Http中coolkie:',self.__cookies
        return self.__cookies.get(key,default)
    def get_cookie_items(self):
        return self.__cookies.items()

    def wrap_session(self):
       sessionid = self.get_cookie('sessionid')
       print '在cookie中读取的sessionid是:%s'%sessionid
        #我去存储查找，
       # print '浏览器发送的sessionid:%s'%sessionid
       session = SessionManager().get_session(sessionid)
       self.session = session



class HttpResponse(object):

    def __init__(self,content):
        self.headers={}
        self.init_heads()
        self.content = content
    def __str__(self):
        self.response_line = 'HTTP/1.1 200 ok\r\n'
        self.response_blank_line = '\r\n'
        response_data =self.response_line
        for k,v in self.headers.items():
            head = k+":"+v+"\r\n"
            response_data+=head
        response_data+=self.response_blank_line
        response_data+=self.content
        return response_data
    def set_cookie(self,name,value,path='/'):
        #Set-Cookie: BDSVRTM = 307; path = /
        key = 'Set-Cookie'
        value = ' %s=%s;path=%s'%(name,value,path)
        self.headers[key]=value

    def init_heads(self):
        self.headers['Server']=' My Server'
        self.headers['Content-Type']=' text/html;charset=utf-8'

class HttpRedirctResponse(object):
    def __init__(self, redirct):
        # Location: https: // www - temp.example.org /
        self.headers = {}
        self.headers['Location']=" %s"%redirct
        self.init_heads()
        self.content = ""

    def __str__(self):
        self.response_line = 'HTTP/1.1 302 Found\r\n'
        self.response_blank_line = '\r\n'
        response_data = self.response_line
        for k, v in self.headers.items():
            head = k + ":" + v + "\r\n"
            response_data += head
        response_data += self.response_blank_line
        response_data += self.content
        return response_data

    def set_cookie(self, name, value, path='/'):
        # Set-Cookie: BDSVRTM = 307; path = /
        key = 'Set-Cookie'
        value = ' %s=%s;path=%s' % (name, value, path)
        self.headers[key] = value

    def init_heads(self):
        self.headers['Server'] = ' My Server'
        self.headers['Content-Type'] = ' text/html;charset=utf-8'


class HttpServer(object):
    __is_start=True
    def __init__(self,address=('',8000),backlog=5,routers=[],static_url='/static',static_file_dir='static'):
        self.routers = routers
        self.static_url = static_url
        self.static_file_dir = os.path.join(BASE_DIR,static_file_dir)
        self.server_socket = socket.socket(socket.AF_INET,socket.SOCK_STREAM)
        self.server_socket.setsockopt(socket.SOL_SOCKET,socket.SO_REUSEADDR,1)
        self.server_socket.bind(address)
        self.server_socket.listen(backlog)
    def start(self):
        while self.__is_start:
            client_socket,client_address = self.server_socket.accept()
            httprequest = HttpRequest(client_socket,client_address)
            # init()
            # httprequest.data={quanjude zidian }
            self.__dispatch(httprequest,client_socket)

    def stop(self):
        self.__is_start=False
        self.server_socket.close()

    def __dispatch(self, httprequest,client_socket):
        # 处理静态文件使用的
        if httprequest.PATH.startswith(self.static_url):
            # /static/index.html /html
            #d:asd/asdasd/asdasd/httpdemp /index.html  ===> d：/index.html
            #映射  /static/index.html   static.file_dir/index.html
            path = httprequest.PATH[len(self.static_url)+1:]
            with open(os.path.join(self.static_file_dir,path)) as fr:
                content = fr.read()
            response = HttpResponse(content)
            client_socket.send(str(response))
            client_socket.close()
            return

        handler = None
        import re
        for path,handler_fun in self.routers:
            if re.match(path,httprequest.PATH) :
                handler = handler_fun
                break
        if handler != None:
            response  = handler(httprequest)
            sessionid = httprequest.get_cookie('sessionid')
            if sessionid != httprequest.session.get_sessionid():
                print '原始的浏览器发送的sessionuid',sessionid,
                print '服务器重新给浏览器覆盖发送的sessionuid',httprequest.session.get_sessionid(),

                response.set_cookie('sessionid', httprequest.session.get_sessionid())
            client_socket.send(str(response))
            client_socket.close()

def render(template_name):

    with open(os.path.join(TEMPATE_PATH,template_name)) as fr:
        content = fr.read()
    # 未知问题
    return  HttpResponse(content.strip())


