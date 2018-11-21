#coding=utf-8
import tornado.web
import tornado.ioloop
import MySQLdb
def update(account,token):
    con = MySQLdb.Connection(host='127.0.0.1', db='test', user='root', passwd='admin')
    cursor = con.cursor()
    cursor.execute('update  authuser set token = "%s" where account = "%s"' % (token, account))
    con.commit()
    cursor.close()
    con.close()

def query(token):
    con = MySQLdb.Connection(host='127.0.0.1', db='test', user='root', passwd='admin')
    cursor = con.cursor()
    sql = 'select * from authuser WHERE  token = "%s"' % (token)
    print sql
    cursor.execute(sql)
    user=cursor.fetchone()
    cursor.close()
    con.close()
    return  user
#

class IndexHandler(tornado.web.RequestHandler):
    def get(self, *args, **kwargs):
        self.render('index.html')


    def post(self, *args, **kwargs):
        account = self.get_argument('account')
        password  = self.get_argument('password')
        # 这里就不查询数据库了
        if account != 'admin' and password !='admin':
            self.write('重新登录')
            return
        # token  用户登录之后的唯一标示
        import uuid
        token = uuid.uuid4().get_hex()
        update(account,token)
        self.set_secure_cookie('token',token,expires_days=30)
        self.redirect('/usercenter')

class UserCenter(tornado.web.RequestHandler):
    def get(self, *args, **kwargs):
        token = self.get_secure_cookie('token')
        user = query(token)
        self.write('欢迎：'+str(user))
import sqlalchemy

# session -----> 使用的是token，和数据库（orm类库都自带缓存）
import uuid

app = tornado.web.Application([(r'/',IndexHandler),(r'/usercenter',UserCenter)],cookie_secret='asdasddddddddddddddddddddddddddddasdhkjhasjdhsadgsajdgsaf')
app.listen(8000)
tornado.ioloop.IOLoop.instance().start()

