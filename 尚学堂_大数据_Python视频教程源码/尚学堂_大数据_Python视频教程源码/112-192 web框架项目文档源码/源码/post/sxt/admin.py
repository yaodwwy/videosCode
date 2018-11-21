# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.contrib import admin

# Register your models here.
from sxt.models import *
class PostModelAdmin(admin.ModelAdmin):
    list_display = ['title','content','created','modifed','category']
    list_editable =['category','title']
    list_display_links = ['created']
    list_filter = ['category','created']
    filter_horizontal = ['tags']
    list_per_page = 1
    search_fields = ['tags__name']




admin.site.register(Post,PostModelAdmin)
admin.site.register(Category)
admin.site.register(Tag)
class GoodsDetailsLines(admin.TabularInline):
    model = GoodsDetails
    extra = 1

class GoodsModelAdmin(admin.ModelAdmin):
    inlines = [GoodsDetailsLines]

admin.site.register(Goods,GoodsModelAdmin)
admin.site.register(GoodsDetails)
