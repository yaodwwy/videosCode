#coding=utf-8
import tornado.web
import tornado.ioloop
from tornado.httputil import HTTPServerRequest, HTTPHeaders


class GetHandler(tornado.web.RequestHandler):
    def get(self, *args, **kwargs):
        self.write(u'您要查询的是:'+self.get_argument('q'))

class PostHandler(tornado.web.RequestHandler):
    def post(self, *args, **kwargs):
        # 注册的功能
        self.write(u'注册成功,欢迎:'+self.get_argument('account'))
import os
MEDIA_ROOT=os.path.join(os.path.dirname(__file__),'media')
class FileHandler(tornado.web.RequestHandler):
    def post(self, *args, **kwargs):
        if 'img' in self.request.files:
            imgfile =  self.request.files['img']
            filename = imgfile[0]['filename']
            filebody = imgfile[0]['body']
            # 创建目录，
            if not os.path.exists(MEDIA_ROOT):
                os.makedirs(MEDIA_ROOT)
            #  存储目录
            with open(os.path.join(MEDIA_ROOT,filename),'wb') as fw:
                fw.write(filebody)

        self.write('上传成功')
class HeadHandler(tornado.web.RequestHandler):
    def get(self, *args, **kwargs):
        # self.write('hello<br>')  # 写到缓存 （list）
        # self.write('worlkd')   [()]
        for k,v in self.request.headers.items():
            self.write(k+":"+v+"<br>")
class IPBlock(object):
    def __init__(self,get_response):
        self.get_response = get_response
    def __call__(self, handler=None,*args, **kwargs):
        BLACK_IP=['127.0.0.1']
        if  handler.request.remote_ip in BLACK_IP:
            handler.write('禁止访问')
            return
        return self.get_response(handler)


class RemoteIPHandler(tornado.web.RequestHandler):
    # @IPBlock
    def get(self, *args, **kwargs):
        self.write(u'您的ip是:'+self.request.remote_ip)
    #get = IPBlock(get)
    # IPBLOCK(get)(self,)
class ResponseHeadHandler(tornado.web.RequestHandler):
    def get(self, *args, **kwargs):
        self.add_header('name','张三年')
        self.write('hgello')
class RedirctHandler(tornado.web.RequestHandler):
    def get(self, *args, **kwargs):
        # self.set_status(404,'照比到了')
        # self.set_status(302,'FOUND')
        # self.add_header('LOCATION','http://www.bjsxt.com')

        self.redirect('http://www.bjsxt.com')

# HTTPServerRequest().remote_ip
app = tornado.web.Application([
    (r'/get',GetHandler),
    (r'/post',PostHandler),
    (r'/file',FileHandler),
    (r'/head',HeadHandler),
    (r'/remote',RemoteIPHandler),
    (r'/responsehead',ResponseHeadHandler),
    (r'/redirct',RedirctHandler),
    (r'/hello',tornado.web.RedirectHandler,{"url": "http://www.bjsxt.com"})
])
app.listen(8010)
tornado.ioloop.IOLoop.instance().start()