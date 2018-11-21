# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models
from  django.core.paginator import Paginator
# Create your models here.
class Category(models.Model):
    name = models.CharField(max_length=20,unique=True)
    def __unicode__(self):
        return u'%s'%self.name
class Tag(models.Model):
    name = models.CharField(max_length=20, unique=True)
    def __unicode__(self):
        return u'%s'%self.name
class Post(models.Model):
    title = models.CharField(max_length=20)
    desc = models.CharField(max_length=512)
    content = models.TextField()
    created = models.DateField(auto_now_add=True)
    modified = models.DateTimeField(auto_now=True)
    category = models.ForeignKey(Category)
    tags = models.ManyToManyField(Tag)
    def __unicode__(self):
        return u'%s'%self.title
    @staticmethod
    def get_posts_by_page(num,per_page = 1):
        num = int(num)
        pagintor = Paginator(Post.objects.order_by('-modified').all(),per_page)
        if num<1:
            num = 1
        if num>pagintor.num_pages:
            num = pagintor.num_pages
        page = pagintor.page(num)

        pervious = 2
        last = 2
        if num<=pervious:
            start =1
            end = last+pervious+1
        if num>pervious:
            start = num-pervious+1
            end = num+last+1
        if end>pagintor.num_pages:
            min = end-pagintor.num_pages
            end = pagintor.num_pages
            start -= min
            if start<=1:
                start=1
        # pagintor.page_range
        return  (page,range(start,end+1))
# p = Post()
# p.tags.all()
