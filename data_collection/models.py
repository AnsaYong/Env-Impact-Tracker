from django.db import models
#from django.contrib.auth import get_user_model


#User = get_user_model()

class EnergyConsumption(models.Model):
    """Model to store energey consumption."""
    #user = models.ForeignKey(User, on_delete=models.CASCADE)
    source = models.CharField(max_length=255)  # Renewable vs. non-renewable
    amount_used = models.FloatField()

    def __str__(self):
        return self.source[:50]

class Transportation(models.Model):
    """Model to store transportation."""
    #user = models.ForeignKey(User, on_delete=models.CASCADE)
    mode = models.CharField(max_length=255)  # Car, public transit, walking, cycling

class WasteGeneration(models.Model):
    """Model to store waste generation."""
    #user = models.ForeignKey(User, on_delete=models.CASCADE)
    amount_produced = models.FloatField()
    recycling_habits = models.BooleanField()
    composting_habits = models.BooleanField()

class WaterUsage(models.Model):
    """Model to store water usage."""
    #user = models.ForeignKey(User, on_delete=models.CASCADE)
    consumption = models.FloatField()

class FoodConsumption(models.Model):
    """Model to store food consumption."""
    #user = models.ForeignKey(User, on_delete=models.CASCADE)
    dietary_choices = models.TextField()

    def __str__(self):
        return self.dietary_choices[:50]

class ShoppingHabits(models.Model):
    """Model to store shopping habbits."""
    #user = models.ForeignKey(User, on_delete=models.CASCADE)
    purchasing_decisions = models.TextField()

class Housing(models.Model):
    """Model to store ehousing situation."""
    #user = models.ForeignKey(User, on_delete=models.CASCADE)
    home_size = models.FloatField()
    energy_efficiency = models.BooleanField()
    heating_method = models.CharField(max_length=255)
    cooling_method = models.CharField(max_length=255)
