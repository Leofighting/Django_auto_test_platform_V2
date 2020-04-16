# -*- coding:utf-8 -*-
__author__ = "leo"

from django.urls import path

from apps.api_test import views

urlpatterns = [
    path("test_manage/", views.api_test_manage, name="api_test_manage"),
    path("step_manage/", views.api_step_manage, name="api_step_manage"),
    path("apis_manage/", views.apis_manage, name="apis_manage"),
]
