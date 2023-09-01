from pydoc import describe
from django.db import models



class Restriction(models.Model):
    key = models.CharField(max_length=20)
    value = models.CharField(max_length=20)

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

class Effect(models.Model):
    key = models.CharField(max_length=20)
    value = models.CharField(max_length=20)
    skill = models.ForeignKey(Skill, on_delete=models.CASCADE )

class Item(models.Model):
    name = models.CharField(max_length = 20)
    description = models.TextField(max_length=200)
    slot = models.ForeignKey(Slot, null=True, on_delete=models.SET_NULL)
    cost = models.IntegerField()
    skills = models.ManyToManyField(Skill)
    consumable = models.BooleanField(default = False)

class Restriction(models.Model):
    key = models.CharField(max_length=20)
    value = models.CharField(max_length=20)
    item = models.ForeignKey(Item, on_delete=models.CASCADE)
    
    def __str__(self):
        return self.name + ("("+self.slot+")" if self.slot else "")