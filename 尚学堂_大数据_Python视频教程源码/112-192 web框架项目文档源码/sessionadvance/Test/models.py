#coding=UTF-8

from  django.db import models
class Person(models.Model):
    name = models.CharField(max_length=10)
