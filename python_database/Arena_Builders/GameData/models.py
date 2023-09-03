from pydoc import describe
from django.db import models


class Slot(models.Model):
    name = models.CharField(max_length = 20)
    def __str__(self):
        return self.name

class Skill(models.Model):
    name = models.CharField(max_length=20)
    description = models.TextField(max_length=200)
    range = models.IntegerField(default = 1)
    passive = models.BooleanField(default=False)
    
    def __str__(self):
        return self.name


    def serialize(self):
        return {
            "id": self.id,
            "name" : self.name,
            "description" : self.description,
            "range" : self.range,
            "passive" : self.passive,
            "effects" : [[effect.key, effect.value] for effect in self.effect_set.all()]
        }

class Effect(models.Model):
    key = models.CharField(max_length=20)
    value = models.CharField(max_length=20)
    skill = models.ForeignKey(Skill, on_delete=models.CASCADE )

class Item(models.Model):
    name = models.CharField(max_length = 20)
    description = models.TextField(max_length=200)
    slot = models.ForeignKey(Slot, null=True, on_delete=models.SET_NULL)
    cost = models.IntegerField()
    skills = models.ManyToManyField(Skill, blank=True)
    consumable = models.BooleanField(default = False)
    
    def __str__(self):
        return self.name + (" ("+ str(self.slot)+")" if self.slot else "")

    def serialize(self):
        return {
            "id": self.id,
            "name" : self.name,
            "description" : self.description,
            "slot" : self.slot.name,
            "cost" : self.cost,
            "skills" : [skill.id for skill in self.skills.all()],
            "consumable" : self.consumable,
            "restrictions" : [[restriction.key, restriction.value] for restriction in self.restriction_set.all()]
        }
        
class Restriction(models.Model):
    key = models.CharField(max_length=20)
    value = models.CharField(max_length=20)
    item = models.ForeignKey(Item, on_delete=models.CASCADE)