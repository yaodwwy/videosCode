# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models

# Create your models here.
class Post(models.Model):
    title = models.CharField(max_length=20)
    created = models.DateField(auto_now_add=True)
    def __unicode__(self):
        return u'%s'%self.title