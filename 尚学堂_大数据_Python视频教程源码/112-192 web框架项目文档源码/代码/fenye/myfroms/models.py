# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models

# Create your models here.
class User(models.Model):
    username = models.CharField(max_length=20,unique=True)
    password = models.CharField(max_length=10,)
    birthday = models.DateField()
    @staticmethod
    def register(username,password,birthday,*agrs,**kwargs):
           return User.objects.create(username=username,password=password,birthday=birthday)

