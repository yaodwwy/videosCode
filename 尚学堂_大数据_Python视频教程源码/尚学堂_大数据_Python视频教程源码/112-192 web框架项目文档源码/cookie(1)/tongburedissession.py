#coding=utf-8
import tornado.web
import tornado.ioloop
import redis
class User(object):
    name =""
    def __init__(self,name):
        self.name = name
client = redis.Redis(host='192.168.88.10', port=6379,
                 db=0,)
# 弊端， 动态强类型语言，弱类型
# name = 'sad'
# name = 10
# name = User("")

class Session(object):
    sessionid=''
    cache={'':User("")}
    def __init__(self):
        self.sessionid=self.__gen_session_id()
        # self.cache={}
        # eval()
    def set(self,key,value):
        print self.cache,'cache空么'
        self.cache[key]=value
        print self.cache,'有美容么'
    def get(self,key,default=None):
        return self.cache.get(key,default)
    def deltate(self,key):
        del self.cache[key]

    def __gen_session_id(self):
        import uuid
        return uuid.uuid4().get_hex()
    def get_sessionid(self):
        return self.sessionid

class SessionManager(object):
    __chache=client
    def getsession(self,seesionid):
        if not seesionid:seesionid=""
        session = self.__chache.get(seesionid)
        if session == None:
            session = Session() # 只存储一次，
            import jsonstruct
            print 'session对象：',jsonstruct.encode(session)
            self.__chache[session.get_sessionid()]= jsonstruct.encode(session)
            return session
        else:
            import jsonstruct
            print 'reids读取的sesson',session
            session = jsonstruct.decode(session,Session)
            print '序列化回来的',session
            return session
    def update(self,session):
         import jsonstruct
         self.__chache[session.get_sessionid()] = jsonstruct.encode(session)
sessionManager=SessionManager()
class SessionRequestHandler(tornado.web.RequestHandler):
    def prepare(self):
        sessionid = self.get_cookie('sessionid',None)
        session = sessionManager.getsession(sessionid)
        print session,session.get_sessionid()
        self.request.session = session
        if sessionid != session.get_sessionid():
            import datetime
            self.set_cookie('sessionid',session.get_sessionid(),expires=datetime.datetime.today()+datetime.timedelta(minutes=30))


# django-redis


class IndexHandler(SessionRequestHandler):
    def get(self, *args, **kwargs):
        print self.request.session,'孔么'
        self.request.session.set('name','asdasdsad')
        sessionManager.update(self.request.session)
        self.render('index.html')
    def post(self, *args, **kwargs):
        user = User(self.get_argument('account'))
        self.request.session.set('user',user)
        sessionManager.update(self.request.session)
        self.redirect('/session')

def userauth(redirct='/'):
    def __userauth(fun):
        def wrapper(handler,*args,**kwargs):
            if not handler.request.session.get('user',None):
                handler.redirect(redirct)
                return
            return fun(handler,*args,**kwargs)
        return  wrapper
    return __userauth

class SessionHandler(SessionRequestHandler):
    @userauth(redirct='/')
    def get(self):
        self.write(u'欢迎:'+self.request.session.get('user').name)




import uuid
app = tornado.web.Application([(r'/',IndexHandler),(r'/session',SessionHandler)],debug=True,cookie_secret=uuid.uuid4().get_hex())
app.listen(8000)
tornado.ioloop.IOLoop.instance().start()