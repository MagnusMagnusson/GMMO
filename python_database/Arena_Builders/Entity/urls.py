from django.urls import path
from . import views

urlpatterns = [
    path('entities', views.EntityView, name = 'entity'),
]