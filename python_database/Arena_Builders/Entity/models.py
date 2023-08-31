from django.db import models
from django.contrib.auth import models as auth
from Gangs import models as gangs
from GameData import models as gamedata

# Create your models here.
class Entity(models.Model):
    name = models.CharField(max_length=50)
    vitality = models.IntegerField()
    stamina = models.IntegerField()
    brawn = models.IntegerField()
    dexterity = models.IntegerField()
    harmony = models.IntegerField()
    level = models.IntegerField()
    items = models.ManyToManyField(gamedata.Item)
    skills = models.ManyToManyField(gamedata.Skill)

    def __str__(self):
        return self.name

# Create your models here.
class Character(Entity):
    account = models.ForeignKey(auth.User, on_delete=models.CASCADE)
    gang = models.ForeignKey(gangs.Gang, on_delete=models.CASCADE)

    def __str__(self):
        return self.name + " @ " +self.gang + " (" +self.account + ") "