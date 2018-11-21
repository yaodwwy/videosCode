#coding=utf-8
import tornado.web
import tornado.ioloop
import tornadoredis
client = tornadoredis.Client(host='192.168.88.10',selected_db=15)
class User(object):
    def __init__(self,name,age):
        self.name = name
        self.age = age
    def __unicode__(self):
        return self.__dict__
    def __str__(self):
        return str(self.__dict__)

class IndexHandler(tornado.web.RequestHandler):
    @tornado.web.asynchronous
    def get(self, *args, **kwargs):
        client.set('user',User('张三',10),expire=60*30)
        client.get('user',callback=self.on_response)
    def on_response(self,user):
        print user,type(user)
        self.write('hello worlld')
        self.finish()

import tornado.gen
class ShowHandler(tornado.web.RequestHandler):
    def initialize(self):
        pass
    def prepare(self):
        pass
    
    @tornado.web.asynchronous
    @tornado.gen.engine
    def get(self, *args, **kwargs):
        user_dict = yield  tornado.gen.Task(client.get,'user')
        user = User(**eval(user_dict))
        print user,user.name
        self.write('欢迎:'+user.name.decode('utf-8').encode('utf-8'))
        self.finish()

app = tornado.web.Application([(r'/',IndexHandler),(r'/show',ShowHandler)])
app.listen(8000)
tornado.ioloop.IOLoop.instance().start()