from pydoc import describe
from django.db import models


class Slot(models.Model):
    name = models.CharField(max_length = 20)

class Effect(models.Model):
    attribute = models.CharField(max_length=30)
    value = models.IntegerField()

class Skill(models.Model):
    name = models.CharField(max_length=20)
    description = models.TextField(max_length=200)
    range = models.IntegerField(default = 1)
    effects = models.ManyToManyField(Effect)


class Item(models.Model):
    name = models.CharField(max_length = 20)
    description = models.TextField(max_length=200)
    slot = models.ForeignKey(Slot, null=True, on_delete=models.SET_NULL)
    cost = models.IntegerField()
    skills = models.ManyToManyField(Skill)