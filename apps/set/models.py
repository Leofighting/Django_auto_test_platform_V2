from django.db import models


class Set(models.Model):
    set_name = models.CharField("系统名称", max_length=64)
    set_value = models.CharField("系统设置", max_length=200)

    class Meta:
        verbose_name = "系统设置"
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.set_name
