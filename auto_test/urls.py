"""auto_test URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include

from apps.api_test import views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('login/', views.login, name="login"),
    path('logout/', views.logout, name="logout"),
    path('home/', views.home, name="home"),
    # 产品管理
    path("product/", include("apps.product.urls")),
    # api 流程接口管理
    path("api_test/", include("apps.api_test.urls")),
    # bug 管理
    path("bug/", include("apps.bug.urls")),
    # 设置管理
    path("set/", include("apps.set.urls")),
    # App 测试管理
    path("app_test/", include("apps.app_test.urls")),
    # web 测试管理
    path("web_test/", include("apps.web_test.urls")),
]
