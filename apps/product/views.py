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