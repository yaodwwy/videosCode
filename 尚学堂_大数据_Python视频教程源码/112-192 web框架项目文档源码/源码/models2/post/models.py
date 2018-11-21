# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models

# Create your models here.
class User(models.Model):
    name = models.CharField(max_length=20)
    passwrod = models.CharField(max_length=20)
    birthday=models.DateField()
    def __unicode__(self):
        return (u'姓名=%s,出生日期=%s'%(self.name,self.birthday))
    def getAge(self):
        from  datetime import date
        return date.today().year-self.birthday.year
    @staticmethod
    def login(userName,Password):
        try:
            User.objects.get(name=userName,passwrod=Password)
            print '登录成功'
        except:
            print '登录失败'

class Category(models.Model):
    name = models.CharField(max_length=20)
class Tag(models.Model):
    name = models.CharField(max_length=20)
class PostManager(models.Manager):
    def createAddTags(self,title,cate,tags,created):
       post = self.create(title = title,category = cate,created = created)
       #self当前的管理器
       post.tags.add(*tags)
       post.save()
    def queryPostByKeyWords(self,keyword):
        return self.filter(title__contains=keyword).order_by('-title')
    def all(self):
        return super(models.Manager,self).all().order_by('-created')
class Post(models.Model):
    title = models.CharField(max_length=100)
    category = models.ForeignKey(Category)
    created = models.DateField()
    tags= models.ManyToManyField(Tag,null=True)
    #多个管理器
    abc = PostManager()
    objects = models.Manager()
    def __unicode__(self):
        return u'标题:%s,时间:%s'%(self.title,self.created)