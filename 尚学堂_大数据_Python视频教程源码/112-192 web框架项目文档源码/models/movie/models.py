# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey has `on_delete` set to the desired behavior.
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from __future__ import unicode_literals

from django.db import models


class Area(models.Model):
    areaid = models.IntegerField(db_column='areaID')  # Field name made lowercase.
    area = models.CharField(max_length=20)
    fatherid = models.IntegerField(db_column='fatherID')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'area'
class Movie(models.Model):
    mid = models.AutoField(primary_key=True)
    mname = models.CharField(unique=True, max_length=100)
    mdesc = models.TextField(blank=True, null=True)
    mimg = models.CharField(max_length=120)
    mlink = models.CharField(max_length=200)
    def __unicode__(self):
        return u"%s"%self.mname.strip()
    class Meta:
        managed = False
        db_table = 'movie'


class Province(models.Model):
    provinceid = models.IntegerField(db_column='provinceID')  # Field name made lowercase.
    province = models.CharField(max_length=20)

    class Meta:
        managed = False
        db_table = 'province'



class StudentsClassroom(models.Model):
    cname = models.CharField(unique=True, max_length=20)

    class Meta:
        managed = False
        db_table = 'students_classroom'


class StudentsStudent(models.Model):
    sname = models.CharField(max_length=10)
    ssex = models.IntegerField()
    sdate = models.DateField()
    croom = models.ForeignKey(StudentsClassroom, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'students_student'


class SxtLove(models.Model):
    name = models.CharField(max_length=20)

    class Meta:
        managed = False
        db_table = 'sxt_love'


class SxtUser(models.Model):
    name = models.CharField(max_length=20)
    age = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'sxt_user'

class User(models.Model):
        name = models.CharField(max_length=20)
        birthday = models.DateField()

        def __unicode__(self):
            return u'%s'%self.name

