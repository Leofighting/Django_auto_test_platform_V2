# -*- coding:utf-8 -*-
__author__ = "leo"

from django.urls import path

from apps.app_test import views

urlpatterns = [
    path("app_mange/", views.app_case_manage, name="app_case_manage"),
    path("app_step/", views.app_case_step_manage, name="app_case_step_manage"),
]
