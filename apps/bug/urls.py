# -*- coding:utf-8 -*-
__author__ = "leo"

from django.urls import path

from apps.bug import views

urlpatterns = [
    path("bug_manage/", views.bug_manage, name="bug_manage"),
    path("bug_search/", views.bug_search, name="bug_search"),
]
