from django.contrib import admin

from apps.app_test.models import AppCaseStep, AppCase


class AppCaseStepAdmin(admin.TabularInline):
    list_display = [
        "app_test_step", "app_test_obj_name", "app_find_method",
        "app_element", "app_opt_method", "app_assert_data",
        "app_test_result", "create_time", "id", "app_case"
    ]

    model = AppCaseStep
    extra = 1


class AppCaseAdmin(admin.ModelAdmin):
    list_display = [
        "app_case_name", "app_test_result", "create_time", "id"
    ]
    inlines = [AppCaseStepAdmin]


admin.site.register(AppCase, AppCaseAdmin)
