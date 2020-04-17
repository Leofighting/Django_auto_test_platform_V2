# -*- coding:utf-8 -*-
__author__ = "leo"

from django.urls import path

from apps.product import views

urlpatterns = [
    path("manage/", views.product_manage, name="product_manage"),
    path("product_search/", views.product_search, name="product_search"),
]
