from django.contrib import admin
from GameData.models import *

class EffectInline(admin.TabularInline):
    model = Effect
    extra = 0

class RestrictionInline(admin.TabularInline):
    model = Restriction
    extra = 0


class GameDataAdmin(admin.ModelAdmin):
    pass

class ItemAdmin(admin.ModelAdmin):
    inlines = [RestrictionInline]
    exclude = ["restrictions"]

class SkillAdmin(admin.ModelAdmin):
    inlines = [EffectInline]
    exclude = ["effects"]

class GameDataAdmin(admin.ModelAdmin):
    pass


 

admin.site.register(Slot, GameDataAdmin)
admin.site.register(Skill, SkillAdmin)
admin.site.register(Item, ItemAdmin)