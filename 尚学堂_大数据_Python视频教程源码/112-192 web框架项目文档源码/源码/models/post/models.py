# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models

# Create your models here.
class Category(models.Model):
    name = models.CharField(max_length=20)
    def __unicode__(self):
        return u"%s"%self.name
class Post(models.Model):
    title = models.CharField(max_length=20)
    category = models.ForeignKey(Category)
    created = models.DateField()
    remark=models.IntegerField()
    read= models.IntegerField()
    def __unicode__(self):
        return u"%s" % self.title

Post.objects.filter(remark__gte=)