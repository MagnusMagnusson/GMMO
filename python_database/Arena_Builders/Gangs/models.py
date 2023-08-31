from django.db import models

# Create your models here.
# Create your models here.
class Gang(models.Model):
    name =models.CharField(max_length= 25)

    def __str__(self):
        return self.name
