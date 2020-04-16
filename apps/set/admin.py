from django.contrib import admin

from apps.set.models import Set


class SetAdmin(admin.ModelAdmin):
    list_display = ["set_name", "set_value", "id"]


admin.site.register(Set, SetAdmin)
