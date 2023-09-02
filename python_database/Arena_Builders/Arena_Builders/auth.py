from django.contrib.auth import authenticate
from django.contrib.auth.models import User
from Entity.models import Character
from Gangs.models import Gang
from django.http import JsonResponse
import json

def login(request):
    bod = json.loads(request.body.decode('utf-8'))
    username = bod['username']
    password = bod['password']
    print(username, password)
    user = authenticate(username=username, password=password)
    if user is not None:
        character = Character.objects.filter(account = user)
        if(character.exists()):
            return JsonResponse({
                "success" : True,
                "character" : character[0].serialize()
            })
        else:
            return JsonResponse({
                "success" : False,
                "reason" : "Character does not exist"
            })
    else:
        return JsonResponse({
            "success" : False,
            "reason" : "Incorrect username/password"
        })

def create(request):
    try:
        bod = json.loads(request.body.decode('utf-8'))
        username = bod['username']
        password = bod['password']
        character = bod['character']
        if(User.objects.filter(username = username).exists()):
            return JsonResponse({
                "success" : False,
                "reason" : "Username already exists"
            })
        else:
            user = User.objects.create_user(username=username, email=username+'@arenabuildersonline.com', password=password)
            char = Character(
                name = username,
                vitality = character['vitality'],
                stamina = character['stamina'],
                dexterity = character['dexterity'],
                harmony = character['harmony'],
                brawn = character['brawn'],
                level = 1,
                account = user,
                gang = Gang.objects.get(name = character['gang'])
            )
            char.save()
            return JsonResponse({
                "success" : True,
                "character" : char.serialize()
            })
    except Exception as ex:
        print(ex)
        return JsonResponse({
            "success" : False,
            "reason" : "Unknown Error"
        })