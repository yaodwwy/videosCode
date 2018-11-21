#coding=utf-8
import tornado.web

class BaseHandler(tornado.web.RequestHandler):
    def set_default_headers(self):
        self.add_header('Server',' Diy Server')
    def write_error(self, status_code, **kwargs):
        self.render('error.html')
