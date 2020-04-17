from django.contrib.auth.decorators import login_required
from django.core.paginator import Paginator, PageNotAnInteger, EmptyPage
from django.shortcuts import render

from apps.app_test.models import AppCase, AppCaseStep


@login_required
def app_case_manage(request):
    """
    app 用例管理
    :param request:
    :return: 跳转到app用例管理页面
    """
    app_case_list = AppCase.objects.all()
    app_case_count = app_case_list.count()
    username = request.session.get("user", "")
    paginator = Paginator(app_case_list, 5)
    page = request.GET.get("page", 1)
    current_page = int(page)
    try:
        app_case_list = paginator.page(current_page)
    except PageNotAnInteger:
        app_case_list = paginator.page(1)
    except EmptyPage:
        app_case_list = paginator.page(paginator.num_pages)
    return render(request, "app_case_manage.html", {
        "user": username,
        "app_cases": app_case_list,
        "app_case_counts": app_case_count
    })


@login_required
def app_case_step_manage(request):
    username = request.session.get("user", "")
    app_case_step_list = AppCaseStep.objects.all()
    app_case_id = request.GET.get("app_case.id", None)
    app_case = AppCase.objects.get(id=app_case_id)
    paginator = Paginator(app_case_step_list, 5)
    page = request.GET.get("page", 1)
    current_page = int(page)
    try:
        app_case_step_list = paginator.page(current_page)
    except PageNotAnInteger:
        app_case_step_list = paginator.page(1)
    except EmptyPage:
        app_case_step_list = paginator.page(paginator.num_pages)
    return render(request, "app_case_step_manage.html", {
        "user": username,
        "app_case_steps": app_case_step_list,
        "app_case": app_case
    })


@login_required
def app_search(request):
    username = request.session.get("user", "")
    search_app_case_name = request.GET.get("app_case_name", "")
    app_case_list = AppCase.objects.filter(app_case_name__icontains=search_app_case_name)
    return render(request, "app_case_manage.html", {
        "user": username,
        "app_cases": app_case_list
    })
