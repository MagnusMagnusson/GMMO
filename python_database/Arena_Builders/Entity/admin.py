from django.contrib import admin
from Entity.models import *

class EntityAdmin(admin.ModelAdmin):
    pass

class InventoryInline(admin.TabularInline):
    model = Inventory
    extra = 0

class CharacterAdmin(admin.ModelAdmin):
    inlines = [InventoryInline]

admin.site.register(Entity, EntityAdmin)
admin.site.register(Character, CharacterAdmin)