from django.db import models


class AppCase(models.Model):
    """APP 用例管理"""
    product = models.ForeignKey("product.Product", on_delete=models.CASCADE, null=True)
    app_case_name = models.CharField("用例名称", max_length=64)
    app_test_result = models.BooleanField("测试结果")
    app_tester = models.CharField("测试负责人", max_length=24)
    create_time = models.DateTimeField("创建时间", auto_now=True)

    class Meta:
        verbose_name = "app 测试用例"
        verbose_name_plural = verbose_name
        ordering = ["id"]

    def __str__(self):
        return self.app_case_name


class AppCaseStep(models.Model):
    """APP 用例测试步骤"""
    app_case = models.ForeignKey("AppCase", on_delete=models.CASCADE)
    app_test_step = models.CharField("测试步骤", max_length=255)
    app_test_obj_name = models.CharField("测试对象名称描述", max_length=200)
    app_find_method = models.CharField("定位方式", max_length=200)
    app_element = models.CharField("控件元素", max_length=800)
    app_opt_method = models.CharField("操作方法", max_length=200)
    app_test_data = models.CharField("测试数据", max_length=200, null=True)
    app_assert_data = models.CharField("验证数据", max_length=200)
    app_test_result = models.BooleanField("测试结果")
    create_time = models.DateTimeField("创建时间", auto_now=True)

    class Meta:
        ordering = ["id"]

    def __str__(self):
        return self.app_test_step
