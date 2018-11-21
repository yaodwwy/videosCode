# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models

# 账号,密码(md5)
# Create your models here.
class User(models.Model):
    account = models.CharField(unique=True,max_length=20)
    password = models.CharField(max_length=64)
    class RegisterException(Exception):
        pass
    @staticmethod
    def register(account ,password,*args,**kwargs):

        try:
           return User.objects.create(account=account,password=password)
        except Exception as e:
            print  e.message
            raise  User.RegisterException()