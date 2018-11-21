# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models

# Create your models here.
class User(models.Model):
    username = models.CharField(max_length=20,unique=True)
    password = models.CharField(max_length=20)
    def __unicode__(self):
        return  u'账号:%s,密码:%s'%(self.username,self.password)
    class UserExistException(Exception):
        def __init__(self):
            super(Exception,self).__init__('用户已经存在了')
    class UserNotFoundException(Exception):
        def __init__(self):
            super(Exception,self).__init__('用户不存在')
    @classmethod
    def register(cls,username,password,*args,**kwargs):
        try:
          return  cls.objects.create(username = username,password = password)
        except:
            raise User.UserExistException()

    @classmethod
    def login(cls, username,password,*args,**kwargs):
        try:
            return cls.objects.get(username=username,password=password)
        except:
            raise  User.UserNotFoundException()
