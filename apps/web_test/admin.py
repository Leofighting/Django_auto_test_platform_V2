from django.contrib import admin

from apps.web_test.models import WebCaseStep, WebCase


class WebCaseStepAdmin(admin.TabularInline):
    list_display = [
        "web_test_step", "web_case_name", "web_test_obj_name", "web_find_method", "web_element",
        "web_opt_method", "web_assert_data", "web_test_result", "create_time", "id", "web_case"
    ]
    model = WebCaseStep
    extra = 1


class WebCaseAdmin(admin.ModelAdmin):
    list_display = ["web_case_name", "web_test_result", "create_time", "id"]
    inlines = [WebCaseStepAdmin]


admin.site.register(WebCase, WebCaseAdmin)
