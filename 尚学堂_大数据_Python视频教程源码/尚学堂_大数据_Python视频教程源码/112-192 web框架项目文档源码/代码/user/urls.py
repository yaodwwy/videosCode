#coding=utf-8
import login
import db
urlpatterns=[
    (r'/login',login.LoginHandler,{'db':db.db()}),
    (r'/register',login.RegisterHandler,{'db':db.db()}),
    (r'/user',login.UserHandler),
]