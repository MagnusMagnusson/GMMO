from django.urls import path
from . import views 

urlpatterns = [
    path('dungeons', views.DungeonView, name = 'dungeon'),
]