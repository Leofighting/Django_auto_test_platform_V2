from django.contrib.auth.models import User
from django.core.paginator import Paginator, PageNotAnInteger, EmptyPage
from django.shortcuts import render

from apps.set.models import Set


def set_manage(request):
    """设置管理"""
    username = request.session.get("user", "")
    set_list = Set.objects.all()
    paginator = Paginator(set_list, 5)
    page = request.GET.get("page", 1)
    current_page = int(page)
    try:
        set_list = paginator.page(current_page)
    except PageNotAnInteger:
        set_list = paginator.page(1)
    except EmptyPage:
        set_list = paginator.page(paginator.num_pages)
    return render(request, "set_manage.html", {
        "user": username,
        "sets": set_list
    })


def set_user(request):
    """用户设置"""
    user_list = User.objects.all()
    username = request.session.get("user", "")

    return render(request, "set_user.html", {
        "user": username,
        "users": user_list
    })
