from django.db import models
from django.contrib.auth.models import User


class EnergyConsumption(models.Model):
    """Model to store energey consumption."""
    user = models.ForeignKey(User, on_delete=models.CASCADE, default=1)
    source = models.CharField(max_length=255)  # Renewable vs. non-renewable
    amount = models.DecimalField(max_digits=10, decimal_places=2)

    def __str__(self):
        return self.source[:50]

class Transportation(models.Model):
    """Model to store transportation."""
    user = models.ForeignKey(User, on_delete=models.CASCADE, default=1)
    mode_choices = [
        ('car', 'Car'),
        ('bus', 'Bus'),
        ('train', 'Train'),
        ('plane', 'Plane'),
        ('bike', 'Bike'),
        ('walk', 'Walk'),
        ('other', 'Other'),
    ]
    mode = models.CharField(max_length=255, choices=mode_choices)
    distance = models.DecimalField(max_digits=10, decimal_places=2)
    #date = models.DateField(auto_now_add=True)

class WasteGeneration(models.Model):
    """Model to store waste generation."""
    user = models.ForeignKey(User, on_delete=models.CASCADE, default=1)
    waste_type = models.CharField(max_length=255)  # e.g., plastic, paper, organic
    amount = models.DecimalField(max_digits=10, decimal_places=2)
    unit = models.CharField(max_length=50)  # e.g., kg, pounds, bags
    recycling_habits = models.BooleanField()
    composting_habits = models.BooleanField()
    frequency = models.CharField(max_length=50)  # e.g., daily, weekly, monthly
    location = models.CharField(max_length=255)  # e.g., home, office, school

class WaterUsage(models.Model):
    """Model to store water usage."""
    user = models.ForeignKey(User, on_delete=models.CASCADE, default=1)
    consumption = models.FloatField()
    frequency = models.CharField(max_length=50)  # e.g., daily, weekly, monthly

class FoodConsumption(models.Model):
    """Model to store food consumption."""
    user = models.ForeignKey(User, on_delete=models.CASCADE, default=1)
    dietary_choices = models.TextField()
    frequency = models.CharField(max_length=50)  # e.g., daily, weekly, monthly

    def __str__(self):
        return self.dietary_choices[:50]

class ShoppingHabits(models.Model):
    """Model to store shopping habits."""
    user = models.ForeignKey(User, on_delete=models.CASCADE, default=1)
    purchasing_decisions = models.TextField()
    frequency = models.CharField(max_length=50)  # e.g., daily, weekly, monthly

class Housing(models.Model):
    """Model to store housing situation."""
    user = models.ForeignKey(User, on_delete=models.CASCADE, default=1)
    home_size = models.FloatField()
    energy_efficiency = models.BooleanField()
    heating_method = models.CharField(max_length=255)
    cooling_method = models.CharField(max_length=255)
    location = models.CharField(max_length=255)  # e.g., urban, suburban, rural
