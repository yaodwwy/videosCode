# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.contrib import admin

# Register your models here.
from  post.models import *
class PostModelAdmin(admin.ModelAdmin):
    list_display = ['title','created','category']
    search_fields = ['tags__name']
admin.site.register(Post,PostModelAdmin)
admin.site.register(Category)
admin.site.register(Tag)