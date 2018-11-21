#coding=utf-8
import tornado.web
import tornado.ioloop

# def ipblock(fun):
#     def wrapper(handler,*args,**kwargs):
#         black_ips=['127.0.0.1']
#         if handler.request.remote_ip in black_ips:
#             handler.write('重定向')
#             return
#         fun(handler,*args,**kwargs)
#     return  wrapper

def ipblock(redirct='/'):
    def _ipblock(fun):
        def wrapper(handler,*args,**kwargs):
            black_ips = ['127.0.0.1']
            if handler.request.remote_ip in black_ips:
                handler.redirect(redirct)
                return
            fun(handler,*args,**kwargs)
        return wrapper
    return _ipblock

class IndexHandler(tornado.web.RequestHandler):

    @ipblock('http://www.bjsxt.com')
    def get(self, *args, **kwargs):
        self.write('hgello')

app = tornado.web.Application(
    [(r'/',IndexHandler)]
)
app.listen(8010)
tornado.ioloop.IOLoop.instance().start()