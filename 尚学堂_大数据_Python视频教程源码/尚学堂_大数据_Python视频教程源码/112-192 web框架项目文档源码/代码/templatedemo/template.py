#coding=utf-8
import tornado.web
import tornado.ioloop
from tornado.routing import URLSpec


class IndexHandler(tornado.web.RequestHandler):
    def get(self, *args, **kwargs):
        from tornado.template import  Template
        # 读取模板
        with open('index.html') as fr:
            content = fr.read()
        # 创建模板对象
        t = Template(content)
        # 渲染
        response = t.generate(name='张三')
        self.write(response)

class LoaderHandler(tornado.web.RequestHandler):
    def get(self, *args, **kwargs):
        from tornado.template import Loader
        import os
        TEMPLATE_PATH = os.path.dirname(__file__)
        loader = Loader(TEMPLATE_PATH)
        t = loader.load('index.html')
        response = t.generate(name='李四')
        self.write(response)
class Student(object):
    def __init__(self,name):
        self.name = name
    def show(self):
        return self.name
def add(num1,num2):
    return num1+num2
def abc():
    pass

class RenderHandler(tornado.web.RequestHandler):
    def get(self, *args, **kwargs):
        import datetime
        # self.reverse_url()
        # self.reverse_url()
        # print  self.static_url('a.jpg')
        self.render('index.html',content = 'asddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd',name=None,items=['<script>alert("读取信息")</script>','item2'],user={'name':'zhangsan','age':10},date=datetime.date.today(),s=Student('李四'),add=add,abc=abc)

class UserHandler(tornado.web.RequestHandler):
    def get(self, *args, **kwargs):
        self.render('user.html')

def context():
    return {'tianqi':'asdasdsad'}
import os
BASE_DIR = os.path.dirname(__file__)
app = tornado.web.Application([
    (r'/',IndexHandler),
    URLSpec(r'/loader',LoaderHandler,name='myabc'),
    (r'/render',RenderHandler),
    (r'/user',UserHandler)
]
    ,template_path=os.path.join(BASE_DIR,'templates'),
    static_path=os.path.join(BASE_DIR,'static'),
    static_url_prefix='/abc/',
)

app.listen(8000)
tornado.ioloop.IOLoop.instance().start()
