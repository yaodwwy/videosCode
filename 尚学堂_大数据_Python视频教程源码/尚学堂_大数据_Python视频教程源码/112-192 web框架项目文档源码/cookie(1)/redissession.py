#coding=utf-8
import tornado.web
import tornado.ioloop

class Session(object):
    sessionid=''
    __cache={}
    def __init__(self):
        self.sessionid=self.__gen_session_id()
    def set(self,key,value):
        self.__cache[key]=value
    def get(self,key,default=None):
        return self.__cache.get(key,default)
    def deltate(self,key):
        del self.__cache[key]

    def __gen_session_id(self):
        import uuid
        return uuid.uuid4().get_hex()
    def get_sessionid(self):
        return self.sessionid
import tornadoredis
client = tornadoredis.Client(host='192.168.88.10',selected_db=2)
# class SessionManager(object):
#     __chache= client
#     @tornado.web.asynchronous
#     def getsession(self,seesionid):
#         if not seesionid:seesionid=""
#         return self.__chache.get(seesionid,callback=self.__get,)  # 空，null
#     def __get(self,session):
#         print session, '空么'
#         if session == None:
#             session = Session()
#             self.__chache.set(session.get_sessionid(), session)
#         return session


# sessionManager=SessionManager()
client = tornadoredis.Client(host='192.168.88.10',selected_db=15)
import tornado.gen
class SessionRequestHandler(tornado.web.RequestHandler):
    @tornado.web.asynchronous
    @tornado.gen.engine
    def prepare(self):
        sessionid = self.get_cookie('sessionid',None)
        if sessionid == None : sessionid=""
        session = yield  tornado.gen.Task(client.get,sessionid)
        print 'seesion',session,
        if session == None:
            session=Session()
            import jsonstruct
            client.set(session.get_sessionid(),session)
        self.request.session = session
        if sessionid != session.get_sessionid():
            import datetime
            self.set_cookie('sessionid',session.get_sessionid(),expires=datetime.datetime.today()+datetime.timedelta(minutes=30))

class User(object):
    def __init__(self,name):
        self.name = name

class IndexHandler(SessionRequestHandler):
    def get(self, *args, **kwargs):
        self.request.session.set('name','asdasdsad')
        self.render('index.html')
    def post(self, *args, **kwargs):
        user = User(self.get_argument('account'))
        self.request.session.set('user',user)
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



app = tornado.web.Application([(r'/',IndexHandler),(r'/session',SessionHandler)],debug=True)
app.listen(8000)
tornado.ioloop.IOLoop.instance().start()