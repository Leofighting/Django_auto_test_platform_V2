from django.contrib import auth
from django.contrib.auth.decorators import login_required
from django.core.paginator import Paginator, PageNotAnInteger, EmptyPage
from django.http import HttpResponseRedirect
from django.shortcuts import render

from apps.api_test.models import ApiTest, ApiStep, Apis


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


@login_required
def api_test_manage(request):
    """
    接口管理
    :param request:
    :return: 跳转到接口管理页面，并输出所有接口用例
    """
    api_test_list = ApiTest.objects.all()
    api_test_count = api_test_list.count()
    username = request.session.get("user", "")
    paginator = Paginator(api_test_list, 5)
    page = request.GET.get("page", 1)
    current_page = int(page)
    try:
        api_test_list = paginator.page(current_page)
    except PageNotAnInteger:
        api_test_list = paginator.page(1)
    except EmptyPage:
        api_test_list = paginator.page(paginator.num_pages)
    return render(request, "api_test_manage.html", {
        "user": username,
        "api_tests": api_test_list,
        "api_test_counts": api_test_count
    })


@login_required
def api_step_manage(request):
    username = request.session.get("user", "")
    api_step_list = ApiStep.objects.all()
    api_test_id = request.GET.get("api_test.id", None)
    api_test = ApiTest.objects.get(id=api_test_id)
    paginator = Paginator(api_step_list, 5)
    page = request.GET.get("page", 1)
    current_page = int(page)
    try:
        api_step_list = paginator.page(current_page)
    except PageNotAnInteger:
        api_step_list = paginator.page(1)
    except EmptyPage:
        api_step_list = paginator.page(paginator.num_pages)
    return render(request, "api_step_manage.html", {
        "user": username,
        "api_steps": api_step_list,
        "api_test": api_test
    })


@login_required
def apis_manage(request):
    username = request.session.get("user", "")
    apis_list = Apis.objects.all()
    apis_count = apis_list.count()
    paginator = Paginator(apis_list, 5)
    page = request.GET.get("page", 1)
    current_page = int(page)
    try:
        apis_list = paginator.page(current_page)
    except PageNotAnInteger:
        apis_list = paginator.page(1)
    except EmptyPage:
        apis_list = paginator.page(paginator.num_pages)
    return render(request, "apis_manage.html", {
        "user": username,
        "apiss": apis_list,
        "apis_counts": apis_count
    })
