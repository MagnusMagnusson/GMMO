from django.contrib.auth import authenticate
from django.http import JsonResponse
import json

def login(request):
    bod = json.loads(request.body.decode('utf-8'))
    username = bod['username']
    password = bod['password']
    print(username, password)
    user = authenticate(username=username, password=password)
    if user is not None:
        return JsonResponse({
            "success" : True,
            "character" : None
        })
    else:
        return JsonResponse({
            "success" : False,
            "reason" : "Incorrect username/password"
        })