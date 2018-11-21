#coding=utf-8
import tornado.web
import tornado.ioloop
from tornado.routing import URLSpec


class IndexHandler(tornado.web.RequestHandler):
    def initialize(self,db,name):
        self.db = db
        print '执行initialize-->'+db+':'+name
    def prepare(self):
        print '执行parepase'
    def get(self, *args, **kwargs):

        print '执行hello'
        self.write('hello')
    def on_finish(self):
        print '执行onfnish'

class UserHandler(tornado.web.RequestHandler):
    def get(self, *args, **kwargs):
        print '用户没有登录到重新login',self.reverse_url('lol')
        self.redirect(self.reverse_url('lol'))
class LoginHandler(tornado.web.RequestHandler):
    def get(self, *args, **kwargs):
        with  open('login.html') as fr:
            content = fr.read()
        self.write(content)

class CartHandler(tornado.web.RequestHandler):
    def get(self, *args, **kwargs):
        1/0
        self.write('号购物城')
    def write_error(self, status_code, **kwargs):
        print status_code,
        print kwargs
        self.write('服务器暂时维护中')

class DefaultHandler(tornado.web.RequestHandler):
    def set_default_headers(self):
        self.add_header('name','hello')
        self.add_header('age',10)
    def get(self, *args, **kwargs):
        self.write('asdasdasa')

class CookieHandler(tornado.web.RequestHandler):
    def get(self, *args, **kwargs):
        print self.get_cookie('sessionid','找不到')
        import uuid
        import datetime
        self.set_cookie('sessionid',uuid.uuid4().get_hex(),expires=datetime.datetime.utcnow()+ datetime.timedelta(minutes=30),path='/asd')
        self.write('asdsada')


app = tornado.web.Application([
    URLSpec(r'/',IndexHandler,{'db':'db','name':'张三年'}),
    (r'/user',UserHandler),
    URLSpec(r'/login',LoginHandler,name='lol'),
    (r'/cart',CartHandler),
    (r'/default',DefaultHandler),
    (r'/cookie',CookieHandler),
    (r'/asd',CookieHandler),
])

app.listen(8010)
tornado.ioloop.IOLoop.instance().start()
