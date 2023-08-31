from django.contrib import admin
from Entity.models import *

class EntityAdmin(admin.ModelAdmin):
    pass


admin.site.register(Entity, EntityAdmin)
admin.site.register(Character, EntityAdmin)