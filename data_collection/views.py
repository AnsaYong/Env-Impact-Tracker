from django.shortcuts import render, redirect
from django.views import View
from .models import EnergyConsumption, Transportation, WasteGeneration, WaterUsage, FoodConsumption, ShoppingHabits, Housing


class EnergyConsumptionView(View):
    """Provides a method that allows the user to input their energy consumption data."""
    def get(self, request):
        """Renders the energy consumption form."""
        return render(request, 'data_collection/energy_consumption.html')

    def post(self, request):
        """Saves the energy consumption data."""
        source = request.POST['source']
        amount = request.POST['amount']

        # Assuming the user is logged in
        user = request.user

        # Create and save the EnergyConsumption object
        energy_consumption = EnergyConsumption.objects.create(user=user, source=source, amount=amount)
        energy_consumption.save()

        return redirect('dashboard')
    
class TransportationView(View):
    """Provides a method that allows the user to input their transportation data."""
    def get(self, request):
        """Renders the transportation form."""
        return render(request, 'data_collection/transportation.html')

    def post(self, request):
        """Saves the transportation data."""
        mode = request.POST['mode']
        distance = request.POST['distance']

        # Assuming the user is logged in
        user = request.user

        # Create and save the Transportation object
        transportation_data = Transportation.objects.create(user=user, mode=mode, distance=distance)
        transportation_data.save()
        
        return redirect('dashboard')
    
class WasteGenerationView(View):
    """Provides a method that allows the user to input their waste generation data."""
    def get(self, request):
        """Renders the waste generation form."""
        return render(request, 'data_collection/waste_generation.html')

    def post(self, request):
        """Saves the waste generation data."""
        waste_type = request.POST['waste_type']
        amount = request.POST['quantity']
        unit = request.POST['unit']
        frequency = request.POST['frequency']
        location = request.POST['location']
        recycling_habits = request.POST['recycling_habits']
        composting_habits = request.POST['composting_habits']

        user = request.user

        waste_generation = WasteGeneration.objects.create(user=user, waste_type=waste_type, amount=amount, unit=unit, frequency=frequency, location=location, recycling_habits=recycling_habits, composting_habits=composting_habits)
        waste_generation.save()
        
        return redirect('dashboard')
    
class WaterUsageView(View):
    """Provides a method that allows the user to input their water usage data."""
    def get(self, request):
        """Renders the water usage form."""
        return render(request, 'data_collection/water_usage.html')

    def post(self, request):
        """Saves the water usage data."""
        consumption = request.POST['consumption']
        frequency = request.POST['frequency']

        user = request.user

        water_usage = WaterUsage.objects.create(user=user, consumption=consumption, frequency=frequency)
        water_usage.save()

        return redirect('dashboard')
    
class FoodConsumptionView(View):
    """Provides a method that allows the user to input their food consumption data."""
    def get(self, request):
        """Renders the food consumption form."""
        return render(request, 'data_collection/food_consumption.html')

    def post(self, request):
        """Saves the food consumption data."""
        dietary_choices = request.POST['dietary_choices']
        user = request.user
        FoodConsumption.objects.create(user=user, dietary_choices=dietary_choices)
        return redirect('food_consumption')
    
class ShoppingHabitsView(View):
    """Provides a method that allows the user to input their shopping habits data."""
    def get(self, request):
        """Renders the shopping habits form."""
        return render(request, 'data_collection/shopping_habits.html')

    def post(self, request):
        """Saves the shopping habits data."""
        purchasing_decisions = request.POST['purchasing_decisions']
        user = request.user
        ShoppingHabits.objects.create(user=user, purchasing_decisions=purchasing_decisions)
        return redirect('shopping_habits')
    
class HousingView(View):
    """Provides a method that allows the user to input their housing data."""
    def get(self, request):
        """Renders the housing form."""
        return render(request, 'data_collection/housing.html')

    def post(self, request):
        """Saves the housing data."""
        home_size = request.POST['home_size']
        energy_efficiency = request.POST['energy_efficiency']
        heating_method = request.POST['heating_method']
        cooling_method = request.POST['cooling_method']
        user = request.user
        Housing.objects.create(user=user, home_size=home_size, energy_efficiency=energy_efficiency, heating_method=heating_method, cooling_method=cooling_method)
        return redirect('housing')
    
class DashboardView(View):
    """Provides a method that allows the user to view their data."""
    def get(self, request):
        """Renders the dashboard."""
        user = request.user
        energy_consumption = EnergyConsumption.objects.filter(user=user)
        transportation = TransportationData.objects.filter(user=user)
        waste_generation = WasteGeneration.objects.filter(user=user)
        water_usage = WaterUsage.objects.filter(user=user)
        food_consumption = FoodConsumption.objects.filter(user=user)
        shopping_habits = ShoppingHabits.objects.filter(user=user)
        housing = Housing.objects.filter(user=user)
        return render(request, 'data_collection/dashboard.html', {'energy_consumption': energy_consumption, 'transportation': transportation, 'waste_generation': waste_generation, 'water_usage': water_usage, 'food_consumption': food_consumption, 'shopping_habits': shopping_habits, 'housing': housing})
