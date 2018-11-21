#coding=utf-8
import socket
class HttpRequest(object):
    def __init__(self,client_socket,client_address):
        self.__querys={}
        import datetime
        request_data = client_socket.recv(2048)
        request_head_data,request_body_data =request_data.split('\r\n\r\n')
        request_head_datas = request_head_data.split('\r\n')
        request_line_data = request_head_datas[0] #
        request_heads = request_head_datas[1:]
        self.wrap_request_line(request_line_data)
        self.wrap_request_body(request_body_data)
        self.wrap_headers(request_heads,client_address)
        print '请求体',request_body_data
        print '来访者ip:%s:时间:%s: %s  :%s'%(self.headers.get('remote'),str(datetime.datetime.today()),self.METHOD,self.PATH)
        print self.get_query('name')
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
            print '封装了get参数'
            self.PATH,querys = self.PATH.split('?')
            self.wrap_querys(querys)
    def wrap_querys(self, querys):
        for query in querys.split('&'):
            k,v = query.split('=')
            self.__querys[k]=v
    # 有没有写set方法（请求参数都是只读的）
    def get_query(self,k,default=None):
        return self.__querys.get(k,default)
    def wrap_request_body(self, request_body_data):
        if self.METHOD.lower() == 'post':
           self.wrap_querys(request_body_data)



class HttpServer(object):
    __is_start=True
    def __init__(self,address=('',8000),backlog=5,routers=[]):
        self.server_socket = socket.socket(socket.AF_INET,socket.SOCK_STREAM)
        self.server_socket.setsockopt(socket.SOL_SOCKET,socket.SO_REUSEADDR,1)
        self.server_socket.bind(address)
        self.server_socket.listen(backlog)
    def start(self):
        while self.__is_start:
            client_socket,client_address = self.server_socket.accept()
            httprequest = HttpRequest(client_socket,client_address)
            self.__dispatch(httprequest,client_socket)

    def stop(self):
        self.__is_start=False
        self.server_socket.close()

    def __dispatch(self, httprequest,client_socket):
        handler = None
        import re
        for path,handler_clz in routers:
            if re.match(path,httprequest.PATH) :
                handler = handler_clz
                break
        if handler != None:
            handler=handler()
            handler.set_request(httprequest)
            # 9种，  GET / HTTP1.1 ABC / HTTP1.1
            content = getattr(handler,httprequest.METHOD.lower())()
            client_socket.send('HTTP/1.1 200 ok\r\n')
            client_socket.send('Server: diy server\r\n')
            client_socket.send('\r\n')
            client_socket.send(content)
            client_socket.close()
class  ReuqestHandler(object):
    __request = None
    def set_request(self,request):
        self.__request =request
    def get_query(self,key,default):
        return self.__request.get_query(key,default)

class IndexRequest(ReuqestHandler):
    def get(self):
        return 'hello world'+self.get_query('name','meiyou')
    def post(self):
        return 'hello post'
    def abc(self):
        return 'asdsadsad'
class ShowRequest(ReuqestHandler):
    def get(self):
        return  'show diaoyonmgle '
# 路由,
routers=[
    # 通过path直接匹配
    (r'^/$',IndexRequest),
    (r'^/show$',ShowRequest),
]
server = HttpServer(address=('',9001),routers=routers)
server.start()