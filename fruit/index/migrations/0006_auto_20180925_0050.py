# -*- coding: utf-8 -*-
# Generated by Django 1.11.8 on 2018-09-25 00:50
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('index', '0005_auto_20180925_0022'),
    ]

    operations = [
        migrations.AlterField(
            model_name='users',
            name='upwd',
            field=models.CharField(max_length=200, verbose_name='密码'),
        ),
    ]
