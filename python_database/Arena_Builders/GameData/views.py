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

def SkillView(request):
    objects = Skill.objects.all()
    return JsonResponse(
        {
            "length" : objects.count(),
            "results": [skill.serialize() for skill in objects]
        }
    )