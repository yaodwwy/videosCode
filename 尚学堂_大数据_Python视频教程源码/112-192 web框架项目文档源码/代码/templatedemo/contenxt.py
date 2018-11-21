#coding=utf-8
import  tornado.web
import tornado.ioloop
class BaseHandler(tornado.web.RequestHandler):
    def set_default_headers(self):
        pass
    # def write_error(self, status_code, **kwargs):
    #     # self.render('加载错误界面')
    #     pass
    # def prepare(self):
    #     # 准备
    #     self.get_template_namespace().update()
    def render_string(self, template_name, **kwargs):
        kwargs.update({'tianqi':'不错','name':'张三'})
        return tornado.web.RequestHandler.render_string(self,template_name,**kwargs)
class IndexHandler(BaseHandler):
    def get(self, *args, **kwargs):
       self.render('user.html')



import os
BASE_DIR= os.path.dirname(__file__)
app = tornado.web.Application([
    (r'/',IndexHandler)
],template_path=os.path.join(BASE_DIR,'templates'))
app.listen(8000)
tornado.ioloop.IOLoop.instance().start()