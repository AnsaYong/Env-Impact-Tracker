from django.db import models
from django.contrib.auth.models import User


class EnvData(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    date = models.DateField(auto_now_add=True)
    energy_consumption = models.FloatField()
    transportation = models.FloatField()
    waste_generation = models.FloatField()
    water_usage = models.FloatField()
    food_consumption = models.FloatField()
    shopping_habits = models.FloatField()
    housing = models.FloatField()

    def __str__(self):
        return f'{self.user.username}\'s environmental data'

    #def get_total(self):
    #    return self.energy_consumption + self.transportation + self.waste_generation + self.water_usage + self.food_consumption + self.shopping_habits + self.housing