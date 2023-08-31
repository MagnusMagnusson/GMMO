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
    effects = models.TextField(max_length=500)
    
    def __str__(self):
        return self.name


class Item(models.Model):
    name = models.CharField(max_length = 20)
    description = models.TextField(max_length=200)
    slot = models.ForeignKey(Slot, null=True, on_delete=models.SET_NULL)
    cost = models.IntegerField()
    skills = models.ManyToManyField(Skill)

    
    def __str__(self):
        return self.name + ("("+self.slot+")" if self.slot else "")