#coding=utf-8
import tornado.web
import tornado.ioloop
import urls
import settings
def main():
    print settings.setting
    app = tornado.web.Application(urls.urlpatterns,**settings.setting)
    app.listen(8000)
    tornado.ioloop.IOLoop.instance().start()

if __name__ == '__main__':
    main()