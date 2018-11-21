# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models

# Create your models here.
class Category(models.Model):
    name = models.CharField(max_length=20)

    def __unicode__(self):
        return u'%s'%self.name
class Post(models.Model):
    title = models.CharField(max_length=20)
    content = models.TextField()
    created = models.DateField()
    category = models.ForeignKey(Category)
    def __unicode__(self):
        return u'%s'%self.title
    class Meta():
        verbose_name_plural='帖子'

