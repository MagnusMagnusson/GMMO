from django.shortcuts import render
from Entity.models import Entity
from django.http import JsonResponse

# Create your views here.
def EntityView(request):
    objects = Entity.objects.all()
    return JsonResponse(
        {
            "length" : objects.count(),
            "results": [entity.serialize() for entity in objects]
        }
    )