# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.contrib import admin
from page.models import *
# Register your models here.
class PostModelAdmin(admin.ModelAdmin):
    list_display = ['title','created','modified']
admin.site.register(Post,PostModelAdmin)