# -*- coding: utf-8 -*-
# Generated by Django 1.11.6 on 2017-10-26 06:14
from __future__ import unicode_literals

from django.db import migrations, models
import django.utils.timezone


class Migration(migrations.Migration):

    dependencies = [
        ('fileds', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='post',
            name='created',
            field=models.DateField(default=django.utils.timezone.now),
            preserve_default=False,
        ),
    ]
