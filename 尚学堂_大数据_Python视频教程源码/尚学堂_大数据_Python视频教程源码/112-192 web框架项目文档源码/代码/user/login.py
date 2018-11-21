#coding=utf-8
import base

class LoginHandler(base.BaseHandler):
    def get(self, *args, **kwargs):
        self.render('login.html')
    def initialize(self,db):
         self.db = db
    def post(self, *args, **kwargs):
        #登录逻辑
        pass

class RegisterHandler(base.BaseHandler):
    def get(self, *args, **kwargs):
        self.render('register.html')
    def initialize(self, db):
        self.db = db
    def post(self, *args, **kwargs):
        account = self.get_argument('account')
        password = self.get_argument('password')
        cursor = self.db.cursor()
        try:
            sql = 'insert into users (account,password) values ("%s","%s")'%(account,password)
            cursor.execute(sql)
            self.redirect('/user')
        except Exception as e:
            print '注册失败%s'%e.message
            self.redirect('/register')
        cursor.close()
        self.db.close()



class UserHandler(base.BaseHandler):
    def get(self, *args, **kwargs):
        self.render('user.html')