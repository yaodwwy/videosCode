# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from _mysql import IntegrityError

from django.db import models

# Create your models here.
class User(models.Model):
    username = models.CharField(max_length=20,unique=True)
    password = models.CharField(max_length=20)
    @staticmethod
    def register(username,password,*args,**kwagrs):
        print username,password
        try:
            user = User.objects.create(username=username,password=password)
            return user
        except :
            raise User.UserExistException()

    class UserExistException(Exception):
        def __init__(self):
            Exception.__init__(self,'用户已经存在了')

    def __unicode__(self):
        return u'账号:%s,密码:%s'%(self.username,self.password)