# -*- coding:utf-8 -*-
__author__ = "leo"

from django.urls import path

from apps.web_test import views

urlpatterns = [
    path("manage/", views.web_case_manage, name="web_case_manage"),
    path("step/", views.web_case_step_manage, name="web_case_step_manage"),
]
