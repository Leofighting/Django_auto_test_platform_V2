from django.contrib import admin

from apps.product.models import Product


class ProductAdmin(admin.ModelAdmin):
    list_display = ["product_name", "product_desc", "product_owner", "create_time", "id"]
    # inlines = [ApisAdmin, AppCaseAdmin, WebCaseAdmin]


admin.site.register(Product, ProductAdmin)