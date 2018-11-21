# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models

# Create your models here.
class Category(models.Model):
    name = models.CharField(max_length=20,unique=True)
    def __unicode__(self):
        return  u'%s'%self.name
def show():
        d= '体亲爱不错'
        return u'%s'%d
class Tag(models.Model):
    name = models.CharField(max_length=20)

    def __unicode__(self):
        return u'%s' % self.name
class Post(models.Model):
    title = models.CharField(max_length=100,verbose_name='标题')
    content = models.TextField(null=True,default='天气䣜')
    from datetime import date
    created = models.DateField(auto_now_add=True)
    modifed = models.DateTimeField(auto_now=True)
    img = models.ImageField(null=True,blank=True)
    category = models.ForeignKey(Category)
    tags = models.ManyToManyField(Tag)
    def __unicode__(self):
        return  u'%s'%self.title

class Goods(models.Model):
    name = models.CharField(max_length=20)
    price = models.DecimalField(max_digits=10,decimal_places=2)

class GoodsDetails(models.Model):
    img = models.ImageField()
    goods = models.ForeignKey(Goods)