# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models

# Create your models here.
class User(models.Model):
    username = models.CharField(max_length=20)
    password = models.CharField(max_length=20)
    class UserNotFonudException(Exception):
        def __init__(self):
            Exception.__init__(self,'账号或密码不存在')
    @staticmethod
    def login(username,password,*args,**kwargs):
        try:
           return User.objects.get(username=username,password=password)
        except:
            raise  User.UserNotFonudException()
