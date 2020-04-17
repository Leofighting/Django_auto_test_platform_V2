from django.db import models

from apps.product.models import Product


class ApiTest(models.Model):
    """api测试"""
    product = models.ForeignKey("product.Product", on_delete=models.CASCADE, null=True, verbose_name="产品名称")
    api_test_name = models.CharField("流程接口名称", max_length=64)
    api_test_desc = models.CharField("描述", max_length=200, null=True)
    api_tester = models.CharField("测试负责人", max_length=64)
    api_test_result = models.BooleanField("测试结果")
    create_time = models.DateTimeField("创建时间", auto_now=True)

    class Meta:
        verbose_name = "流程场景接口"
        verbose_name_plural = verbose_name
        ordering = ["id"]

    def __str__(self):
        return self.api_test_name


class ApiStep(models.Model):
    """测试步骤"""
    REQUEST_METHOD = (("get", "get"), ("post", "post"), ("put", "put"), ("delete", "delete"), ("patch", "patch"))

    api_test = models.ForeignKey("ApiTest", on_delete=models.CASCADE, related_name="api_step")
    api_step = models.CharField("测试步骤", max_length=100, null=True)
    api_name = models.CharField("接口名称", max_length=100)
    api_url = models.CharField("url地址", max_length=200)
    api_param_value = models.CharField("请求参数和值", max_length=800)
    api_method = models.CharField("请求方法", choices=REQUEST_METHOD, default="get", max_length=200, null=True)
    api_result = models.CharField("预期结果", max_length=200)
    api_status = models.BooleanField("是否通过")
    create_time = models.DateTimeField("创建时间", auto_now=True)

    class Meta:
        ordering = ["id"]

    def __str__(self):
        return self.api_name


class Apis(models.Model):
    """单一接口测试"""
    REQUEST_METHOD = (("0", "get"), ("1", "post"), ("2", "put"), ("3", "delete"), ("4", "patch"))
    product = models.ForeignKey("product.Product", on_delete=models.CASCADE, null=True)
    api_name = models.CharField("接口名称", max_length=100)
    api_url = models.CharField("url 地址", max_length=200)
    api_param_value = models.CharField("请求参数和值", max_length=800)
    api_method = models.CharField("请求方法", choices=REQUEST_METHOD, default="0", max_length=10)
    api_result = models.CharField("预期结果", max_length=200)
    api_status = models.BooleanField("是否通过")
    create_time = models.DateTimeField("创建时间", auto_now=True)

    class Meta:
        verbose_name = "单一场景接口"
        verbose_name_plural = verbose_name
        ordering = ["id"]

    def __str__(self):
        return self.api_name
