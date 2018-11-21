# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models

# Create your models here.
class User(models.Model):
    account = models.CharField(max_length=20)
    password = models.CharField(max_length=20)

    @staticmethod
    def login(account,password):
        return  User.objects.get(account=account,password=password)