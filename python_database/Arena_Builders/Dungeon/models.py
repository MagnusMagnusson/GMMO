from django.db import models
from Entity.models import Entity

class Dungeon(models.Model):
    name = models.CharField(max_length=30)
    theme = models.CharField(max_length=10)
    description = models.CharField(max_length=200)

    def __str__(self):
        return self.name
    
    def serialize(self):
        return {
            "id":self.id,
            "name" :self.name,
            "description" : self.description,
            "rooms" : [room.serialize() for room in self.room_set.objects.all()],

        }

class Room(models.Model):
    dungeon = models.ForeignKey(Dungeon, on_delete=models.CASCADE)
    rank = models.IntegerField(default=0)
    width = models.IntegerField(default = 30)
    height = models.IntegerField(default = 30)

    def __str__(self):
        return self.dungeon.name + " - " + self.rank
    
    def serialize(self):
        return {
            "rank" : self.rank,
            "width" : self.width,
            "height" : self.height,
            "enemies" : [enemy.serialize() for enemy in self.enemy_set.objects.all()]
        }

class Enemy(models.Model):
    room = models.ForeignKey(Room, on_delete=models.CASCADE)
    enemy = models.ForeignKey(Entity, on_delete=models.CASCADE)
    level = models.IntegerField()
    xstart = models.IntegerField()
    ystart = models.IntegerField()

    def serialize(self):
        return {
            "id" : self.enemy.id,
            "level" : self.level,
            "xstart" : self.xstart,
            "ystart" : self.ystart,
        }
