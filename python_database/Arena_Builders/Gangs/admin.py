from django.contrib import admin
from Gangs.models import *

class GangAdmin(admin.ModelAdmin):
    pass


admin.site.register(Gang, GangAdmin)