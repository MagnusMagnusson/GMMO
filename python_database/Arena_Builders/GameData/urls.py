from django.urls import path
from . import views

urlpatterns = [
    path('items', views.ItemView, name = 'items'),
    path('skills', views.SkillView, name = 'skills')
]