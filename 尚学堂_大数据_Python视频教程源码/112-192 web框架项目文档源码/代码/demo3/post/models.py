# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models

# Create your models here.
# 基于帖子--类别
class Category(models.Model):
    # 创建一个字段，这个字段的类型是字符串的（Django框架会针对不同的数据库，产生不同sql语句）
    name = models.CharField(max_length=20)
    # def __str__(self):
    #     return self.name.encode("UTF-8")
    def __unicode__(self):
        return u'%s'%self.name
# class User():
#     def __init__(self,name):
#         self.name = name

