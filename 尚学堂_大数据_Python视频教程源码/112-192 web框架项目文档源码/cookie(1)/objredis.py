#coding=utf-8
import tornado.web
import tornado.ioloop
import tornadoredis
# client  = tornadoredis.Client(host='192.168.88.10',selected_db=8)
class RedisClient(tornadoredis.Client):

    def set(self, key, value,json=True, expire=None, pexpire=None,
            only_if_not_exists=False, only_if_exists=False, callback=None):
        if json:
            import jsonstruct
            value = jsonstruct.encode(value)
        tornadoredis.Client.set(self,key, value, expire=None, pexpire=None,
            only_if_not_exists=False, only_if_exists=False, callback=None)



    def get(self, key,cls=None,json=True,callback=None):
        tornadoredis.Client.get(self,key,callback)

client  = RedisClient(host='192.168.88.10',selected_db=8)
class User(object):
    name = ''
    def __init__(self,name):
        self.name = name

class IndexHandler(tornado.web.RequestHandler):
    def get(self, *args, **kwargs):
        u = User('李四')
        client.set('user',u)
        self.write('存好了')
import tornado.gen
class ShowHandler(tornado.web.RequestHandler):
    @tornado.gen.coroutine
    def get(self, *args, **kwargs):
        user = yield  tornado.gen.Task(client.get,'user')
        import jsonstruct
        user = jsonstruct.decode(user,User)
        self.write(u'欢迎:'+user.name)
        self.finish()

app = tornado.web.Application([(r'/',IndexHandler),(r'/show',ShowHandler)])
app.listen(8000)
tornado.ioloop.IOLoop.instance().start()
