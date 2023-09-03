from django.contrib import admin
from Dungeon.models import *

class RoomInline(admin.TabularInline):
    model = Room
    extra = 0
    
class EnemyInline(admin.TabularInline):
    model = Enemy
    extra = 0

class DungeonAdmin(admin.ModelAdmin):
    inlines = [RoomInline]


class RoomAdmin(admin.ModelAdmin):
    inlines = [EnemyInline]


admin.site.register(Dungeon, DungeonAdmin)
admin.site.register(Room, RoomAdmin)