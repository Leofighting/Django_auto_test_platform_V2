import pymysql
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
        "apis_list": apis_list,
        "apis_counts": apis_count
    })


@login_required
def test_report(request):
    username = request.session.get("user", "")
    apis_list = Apis.objects.all()
    apis_count = Apis.objects.all().count()
    db = pymysql.connect(user="root", db="auto_test01", passwd="123456", host="127.0.0.1")
    cursor = db.cursor()
    sql1 = "select count(id) from api_test_apis where api_test_apis.api_status=1"
    aa = cursor.execute(sql1)
    apis_pass_count = [row[0] for row in cursor.fetchmany(aa)][0]

    sql2 = "select count(id) from api_test_apis where api_test_apis.api_status=0"
    bb = cursor.execute(sql2)
    apis_fail_count = [row[0] for row in cursor.fetchmany(bb)][0]
    db.close()
    return render(request, "report.html", {
        "user": username,
        "apis_list": apis_list,
        "apis_counts": apis_count,
        "apis_pass_counts": apis_pass_count,
        "apis_fail_counts": apis_fail_count
    })


def left(request):
    """左侧边栏"""
    return render(request, "left.html")


@login_required
def api_search(request):
    username = request.session.get("user", "")
    search_api_test_name = request.GET.get("api_test_name", "")
    api_test_list = ApiTest.objects.filter(api_test_name__icontains=search_api_test_name)
    return render(request, "api_test_manage.html", {
        "user": username,
        "api_tests": api_test_list
    })


@login_required
def apis_search(request):
    username = request.session.get("user", "")
    search_api_name = request.GET.get("api_name", "")
    apis_list = Apis.objects.filter(api_name__icontains=search_api_name)
    return render(request, "apis_manage.html", {
        "user": username,
        "apis_list": apis_list
    })
