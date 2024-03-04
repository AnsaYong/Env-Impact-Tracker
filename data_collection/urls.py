from django.urls import path
from . import views


urlpatterns = [
    path('energy_consumption/', views.EnergyConsumptionView.as_view(), name='energy_consumption'),
    path('transportation/', views.TransportationView.as_view(), name='transportation'),
    path('waste_generation/', views.WasteGenerationView.as_view(), name='waste_generation'),
    path('water_usage/', views.WaterUsageView.as_view(), name='water_usage'),
    path('food_consumption/', views.FoodConsumptionView.as_view(), name='food_consumption'),
    path('shopping_habits/', views.ShoppingHabitsView.as_view(), name='shopping_habits'),
    path('housing/', views.HousingView.as_view(), name='housing'),
]