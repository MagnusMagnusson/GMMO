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
    items = models.ManyToManyField(gamedata.Item, blank=True, null=True)
    skills = models.ManyToManyField(gamedata.Skill, blank=True, null=True)

    def __str__(self):
        return self.name

    def serialize(self):
        return {
            "name" : self.name,
            "vitality": self.vitality,
            "stamina": self.stamina,
            "brawn" : self.brawn,
            "dexterity" : self.dexterity,
            "harmony" : self.harmony,
            "level": self.level,
            "items": [item.id for item in self.items.all()],
            "skills": [skill.id for skill in self.skills.all()]
        }

# Create your models here.
class Character(Entity):
    account = models.ForeignKey(auth.User, on_delete=models.CASCADE)
    gang = models.ForeignKey(gangs.Gang, on_delete=models.CASCADE)

    def __str__(self):
        return self.name + " @ " + self.gang.name

    def serialize(self):
        old = super().serialize()
        old["gang"] = self.gang.name
        return old