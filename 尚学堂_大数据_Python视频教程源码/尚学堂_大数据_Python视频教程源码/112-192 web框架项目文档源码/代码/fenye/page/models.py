# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models

# Create your models here.
class Post(models.Model):
    title = models.CharField(max_length=20,verbose_name='标题')
    created = models.DateField(auto_now_add=True,verbose_name='创建时间')
    modified = models.DateTimeField(auto_now=True,verbose_name='修改时间')
    content = models.TextField(verbose_name='内容')

    def __unicode__(self):
        return u'%s'%(self.title)
    # Meta信息是针对表的
    class Meta():
        verbose_name_plural='博客'
