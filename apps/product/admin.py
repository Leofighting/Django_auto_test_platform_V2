from django.contrib import admin

from apps.api_test.models import Apis
from apps.product.models import Product


class ApisAdmin(admin.TabularInline):
    list_display = ["api_name", "api_url", "api_param_value", "api_method",
                    "api_result", "api_status", "create_time", "id", "product"]

    model = Apis
    extra = 1


class ProductAdmin(admin.ModelAdmin):
    list_display = ["product_name", "product_desc", "product_owner", "create_time", "id"]
    # inlines = [ApisAdmin, AppCaseAdmin, WebCaseAdmin]
    inlines = [ApisAdmin]


admin.site.register(Product, ProductAdmin)
