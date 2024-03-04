from django.contrib import admin
from .models import EnergyConsumption, FoodConsumption, Housing, ShoppingHabits, Transportation, WasteGeneration, WaterUsage

admin.site.register(EnergyConsumption)
admin.site.register(FoodConsumption)
admin.site.register(Housing)
admin.site.register(ShoppingHabits)
admin.site.register(Transportation)
admin.site.register(WasteGeneration)
admin.site.register(WaterUsage)