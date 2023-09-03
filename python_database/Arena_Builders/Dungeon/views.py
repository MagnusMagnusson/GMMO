from django.shortcuts import render
from Dungeon.models import Dungeon
from django.http import JsonResponse

# Create your views here.
def DungeonView(request):
    objects = Dungeon.objects.all()
    return JsonResponse(
        {
            "length" : objects.count(),
            "results": [entity.serialize() for entity in objects]
        }
    )