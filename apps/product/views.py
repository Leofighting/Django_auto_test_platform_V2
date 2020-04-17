from django.contrib.auth.decorators import login_required
from django.core.paginator import Paginator, PageNotAnInteger, EmptyPage
from django.shortcuts import render

from apps.product.models import Product


def product_manage(request):
    """
    产品管理
    :param request:
    :return: 跳转到产品管理页面
    """
    username = request.session.get("user", "")
    product_list = Product.objects.all()
    product_count = product_list.count()
    paginator = Paginator(product_list, 5)
    page = request.GET.get("page", 1)
    current_page = int(page)
    try:
        product_list = paginator.page(current_page)
    except PageNotAnInteger:
        product_list = paginator.page(1)
    except EmptyPage:
        product_list = paginator.page(paginator.num_pages)
    return render(request, "product_manage.html", {
        "user": username,
        "products": product_list,
        "product_counts": product_count
    })


@login_required
def product_search(request):
    """
    产品搜索
    :param request:
    :return: 按产品名搜索， 输出符合搜索条件的产品管理页面
    """
    username = request.session.get("user", "")
    search_product_name = request.GET.get("product_name", "")
    product_list = Product.objects.filter(product_name__icontains=search_product_name)
    return render(request, "product_manage.html", {
        "user": username,
        "products": product_list
    })
