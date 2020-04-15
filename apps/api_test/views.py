from django.contrib import auth
from django.http import HttpResponseRedirect
from django.shortcuts import render


def login(request):
    """
    登陆功能
    :param request:
    :return: 成功则跳转到登陆页面
    """
    if request.POST:
        username = request.POST.get("username")
        password = request.POST.get("password")
        user = auth.authenticate(username=username, password=password)
        if user and user.is_active:
            auth.login(request, user)
            request.session["user"] = username
            response = HttpResponseRedirect("/home/")
            return response
        else:
            return render(request, "login.html", {
                "error": "用户名 或 密码错误~"
            })
    return render(request, "login.html")


def home(request):
    """
    主页
    :param request:
    :return:登陆成功，跳转到主页面
    """
    return render(request, "home.html")


def logout(request):
    """
    退出登录
    :param request:
    :return: 跳转到登陆页面
    """
    auth.login(request)
    return render(request, "login.html")
