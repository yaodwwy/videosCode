# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models

# Create your models here.
class Post(models.Model):
    name = models.CharField(max_length=20)
    created = models.DateField()
    modifed = models.DateTimeField()
    content = models.TextField()
    img = models.ImageField()
    srcfile = models.FileField()
    email = models.EmailField()
    price = models.DecimalField(max_digits=5,decimal_places=2)
    sex = models.BooleanField()
    sex1 = models.NullBooleanField()
    orderId = models.UUIDField()
    age = models.PositiveIntegerField()
    id = models.AutoField()

