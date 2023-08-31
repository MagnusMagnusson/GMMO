from django.contrib import admin
from GameData.models import *

class GameDataAdmin(admin.ModelAdmin):
    pass


admin.site.register(Slot, GameDataAdmin)
admin.site.register(Skill, GameDataAdmin)
admin.site.register(Item, GameDataAdmin)