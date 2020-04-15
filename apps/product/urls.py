# -*- coding:utf-8 -*-
__author__ = "leo"

from django.urls import path, include

from apps.product import views

urlpatterns = [
    path("manage/", views.product_manage, name="product_manage"),
]