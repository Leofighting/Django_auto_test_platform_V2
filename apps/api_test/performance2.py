# -*- coding:utf-8 -*-
__author__ = "leo"

from locust import HttpLocust, TaskSet, task


class WebsiteTasks(TaskSet):
    @task
    def login(self):
        self.client.post("/test", {
            "username": "admin",
            "password": "test123qwe"
        })


class WebsiteUser(HttpLocust):
    task_set = WebsiteTasks
    min_wait = 100
    max_wait = 1000
