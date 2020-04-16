from django.core.paginator import Paginator, PageNotAnInteger, EmptyPage
from django.shortcuts import render

from apps.bug.models import Bug


def bug_manage(request):
    """
    bug 管理
    :param request:
    :return: 跳转到 bug 管理页面
    """
    username = request.session.get("user", "")
    bug_list = Bug.objects.all()
    bug_count = bug_list.count()
    paginator = Paginator(bug_list, 5)
    page = request.GET.get("page", 1)
    current_page = int(page)
    try:
        bug_list = paginator.page(current_page)
    except PageNotAnInteger:
        bug_list = paginator.page(1)
    except EmptyPage:
        bug_list = paginator.page(paginator.num_pages)
    return render(request, "bug_manage.html", {
        "user": username,
        "bugs": bug_list,
        "bug_counts": bug_count
    })
