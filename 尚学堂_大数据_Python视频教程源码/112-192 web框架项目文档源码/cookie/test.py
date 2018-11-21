#coding=utf-8
import tornado.web
import tornado.ioloop
from tornado.gen import coroutine
from tornado.httpclient import AsyncHTTPClient, HTTPResponse


class IndexHandler(tornado.web.RequestHandler):
    def get(self, *args, **kwargs):
        import datetime
        print self.get_secure_cookie('abc')
        self.set_secure_cookie('abc','21333333333333333333')
        self.render('index.html')
    def post(self, *args, **kwargs):
        self.write('实现了')


# class AsycHanlder(tornado.web.RequestHandler):
#     @tornado.web.asynchronous
#     def get(self, *args, **kwargs):
#         httpclient = AsyncHTTPClient() # 浏览器
#         httpclient.fetch('http://www.bjsxt.com',callback=self.on_response)
#     def on_response(self,response):
#         self.write(response.body)
#         self.finish() # 结束输出，将缓存中的数据全部给浏览器
class AsycHanlder(tornado.web.RequestHandler):
    @tornado.gen.coroutine
    def get(self, *args, **kwargs):
        httpclient = AsyncHTTPClient() # 浏览器
        response = yield httpclient.fetch('http://www.bjsxt.com')
        self.write(response.body)




import uuid
app = tornado.web.Application([(r'/',IndexHandler),(r'/asyc',AsycHanlder)],
                              # cookie_secret='asdddddddddddddddddddddasd'
                               cookie_secret=uuid.uuid4().get_hex(),
                                xsrf_cookies=True
                              )
app.listen(8000)
tornado.ioloop.IOLoop.instance().start()

def request(url):
    import requests
    response = requests.get(url)
    return response.text