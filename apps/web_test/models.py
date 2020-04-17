from django.db import models


class WebCase(models.Model):
    """web 用例管理"""
    product = models.ForeignKey("product.Product", on_delete=models.CASCADE, null=True)
    web_case_name = models.CharField("用例名称", max_length=64)
    web_test_result = models.BooleanField("测试结果")
    web_tester = models.CharField("测试负责人", max_length=24)
    create_time = models.DateTimeField("创建时间", auto_now=True)

    class Meta:
        verbose_name = "web 测试用例"
        verbose_name_plural = verbose_name
        ordering = ["id"]

    def __str__(self):
        return self.web_case_name


class WebCaseStep(models.Model):
    """web 用例测试步骤"""
    web_case = models.ForeignKey("WebCase", on_delete=models.CASCADE)
    web_test_step = models.CharField("测试步骤", max_length=255)
    web_case_name = models.CharField("测试用例标题", max_length=100)
    web_test_obj_name = models.CharField("测试对象名称描述", max_length=200)
    web_find_method = models.CharField("定位方式", max_length=200)
    web_element = models.CharField("控件元素", max_length=800)
    web_opt_method = models.CharField("操作方法", max_length=200)
    web_test_data = models.CharField("测试数据", max_length=200, null=True)
    web_assert_data = models.CharField("验证数据", max_length=200)
    web_test_result = models.BooleanField("测试结果")
    create_time = models.DateTimeField("创建时间", auto_now=True)

    def __str__(self):
        return self.web_case_name
