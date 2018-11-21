#coding=utf-8
import tornado.web
import tornado.ioloop

class IndexHandler(tornado.web.RequestHandler):
    def get(self):
        print self.get_arguments('name')
        self.write('hello world'+str(self.get_argument('name')))
    def post(self):
        self.write(u'我是post'+self.get_argument('name'))
class TimeHandler(tornado.web.RequestHandler):
    def get(self,year,month,day):

        self.write('time'+year+month+day)


app = tornado.web.Application([
    (r'/',IndexHandler),
     (r'/time/(?P<month>\d+)/(?P<year>\d+)/(?P<day>\d+)',TimeHandler),
    # (r'/time/(\d+)/(\d+)/(\d+)',TimeHandler),

])
app.listen(8005)
# 死循环（从epoll中不断的读取要处理的请求（客户端）socket）
tornado.ioloop.IOLoop.instance().start()