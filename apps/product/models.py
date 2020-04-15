from django.db import models


class Product(models.Model):
    """产品"""
    product_name = models.CharField("产品名称", max_length=64)
    product_desc = models.CharField("产品描述", max_length=200)
    product_owner = models.CharField("产品负责人", max_length=200)
    create_time = models.DateTimeField("创建时间", auto_now=True)

    class Meta:
        verbose_name = "产品管理"
        verbose_name_plural = verbose_name
        ordering = ["id"]

    def __str__(self):
        return self.product_name
