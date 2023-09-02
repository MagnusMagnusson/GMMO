from django.shortcuts import render
from django.http import JsonResponse
from GameData.models import Item, Skill

def ItemView(request):
    objects = Item.objects.all()
    return JsonResponse(
        {
            "length" : objects.count(),
            "results": [item.serialize() for item in objects]
        }
    )