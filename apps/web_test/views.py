from django.contrib.auth.decorators import login_required
from django.core.paginator import Paginator, PageNotAnInteger, EmptyPage
from django.shortcuts import render

from apps.web_test.models import WebCase, WebCaseStep


@login_required
def web_case_manage(request):
    web_case_list = WebCase.objects.all()
    web_case_count = web_case_list.count()
    username = request.session.get("user", "")
    paginator = Paginator(web_case_list, 5)
    page = request.GET.get("page", 1)
    current_page = int(page)
    try:
        web_case_list = paginator.page(current_page)
    except PageNotAnInteger:
        web_case_list = paginator.page(1)
    except EmptyPage:
        web_case_list = paginator.page(paginator.num_pages)
    return render(request, "web_case_manage.html", {
        "user": username,
        "web_cases": web_case_list,
        "web_case_counts": web_case_count,

    })


@login_required
def web_case_step_manage(request):
    web_case_step_list = WebCaseStep.objects.all()
    username = request.session.get("user", "")
    web_case_id = request.GET.get("web_case.id", None)
    web_case = WebCase.objects.get(id=web_case_id)
    paginator = Paginator(web_case_step_list, 5)
    page = request.GET.get("page", 1)
    current_page = int(page)
    try:
        web_case_step_list = paginator.page(current_page)
    except PageNotAnInteger:
        web_case_step_list = paginator.page(1)
    except EmptyPage:
        web_case_step_list = paginator.page(paginator.num_pages)
    return render(request, "web_case_step_manage.html", {
        "user": username,
        "web_case_steps": web_case_step_list,
        "web_case": web_case
    })


@login_required
def web_search(request):
    username = request.session.get("user", "")
    search_web_case_name = request.GET.get("web_case_name", "")
    web_case_list = WebCase.objects.filter(web_case_name__icontains=search_web_case_name)
    return render(request, "web_case_manage.html", {
        "user": username,
        "web_cases": web_case_list
    })
