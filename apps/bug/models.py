from django.db import models

from apps.product.models import Product


class Bug(models.Model):
    """bug"""
    BUG_STATUS = (("激活", "激活"), ("已解决", "已解决"), ("已关闭", "已关闭"))
    BUG_LEVEL = (("1", "1"), ("2", "2"), ("3", "3"))

    product = models.ForeignKey("product.Product", on_delete=models.CASCADE, null=True)
    bug_name = models.CharField("bug 名称", max_length=64)
    bug_detail = models.CharField("bug 详情", max_length=200)
    bug_status = models.CharField("解决状态", choices=BUG_STATUS, default="激活", max_length=200, null=True)
    bug_level = models.CharField("严重程度", choices=BUG_LEVEL, default="3", max_length=10, null=True)
    bug_creat = models.CharField("创建人", max_length=32)
    bug_assign = models.CharField("分配给", max_length=32)
    create_time = models.DateTimeField("创建时间", auto_now=True)

    class Meta:
        verbose_name = "bug 管理"
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.bug_name
