# -*- coding:utf-8 -*-
__author__ = "leo"

from django.urls import path

from apps.set import views

urlpatterns = [
    path("manage/", views.set_manage, name="set_manage"),
    path("user/", views.set_user, name="set_user"),
    path("set_search/", views.set_search, name="set_search"),
    path("user_search/", views.user_search, name="user_search"),
]
