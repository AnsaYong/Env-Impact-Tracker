from django.shortcuts import render, redirect
from django.contrib.auth.models import User
from django.views import View
from .models import EnergyConsumption, Transportation, WasteGeneration, WaterUsage, FoodConsumption, ShoppingHabits, Housing


class EnergyConsumptionView(View):
    """Provides a method that allows the user to input their energy consumption data."""
    def get(self, request):
        """Renders the energy consumption form."""
        return render(request, 'data_collection/energy_consumption.html')

    def post(self, request):
        """Saves the energy consumption data."""

        # Get form data
        source = request.POST['source']
        amount = request.POST['amount']

        # Check if the user is new (registered in the current session)
        new_user_username = request.session.get('new_user_username')
        new_user_email = request.session.get('new_user_email')

        if new_user_username and new_user_email:
            # Check if the user exists in the database
            if User.objects.filter(username=new_user_username, email=new_user_email).exists():
                # Use the newly created user's information
                user = User.objects.get(username=new_user_username, email=new_user_email)
        else:
            # Use the authenticated user
            user = request.user

        # Create and save the EnergyConsumption object
        energy_consumption = EnergyConsumption.objects.create(user=user, source=source, amount=amount)
        energy_consumption.save()

        # Redirect to the next form or dashboard based on user status
        if new_user_username and new_user_email:
            return redirect('transportation')
        else:
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

        # Check if the user is new (registered in the current session)
        new_user_username = request.session.get('new_user_username')
        new_user_email = request.session.get('new_user_email')

        if new_user_username and new_user_email:
            # Check if the user exists in the database
            if User.objects.filter(username=new_user_username, email=new_user_email).exists():
                # Use the newly created user's information
                user = User.objects.get(username=new_user_username, email=new_user_email)
        else:
            # Use the authenticated user
            user = request.user

        # Create and save the Transportation object
        transportation_data = Transportation.objects.create(user=user, mode=mode, distance=distance)
        transportation_data.save()
        
        # Redirect the user based on whether they are new or authenticated
        # Redirect to the next form or dashboard based on user status
        if new_user_username and new_user_email:
            return redirect('waste_generation')
        else:
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

        # Check if the user is new (registered in the current session)
        new_user_username = request.session.get('new_user_username')
        new_user_email = request.session.get('new_user_email')

        if new_user_username and new_user_email:
            # Check if the user exists in the database
            if User.objects.filter(username=new_user_username, email=new_user_email).exists():
                # Use the newly created user's information
                user = User.objects.get(username=new_user_username, email=new_user_email)
        else:
            # Use the authenticated user
            user = request.user

        waste_generation = WasteGeneration.objects.create(user=user, waste_type=waste_type, amount=amount, unit=unit, frequency=frequency, location=location, recycling_habits=recycling_habits, composting_habits=composting_habits)
        waste_generation.save()
        
        if new_user_username and new_user_email:
            return redirect('water_usage')
        else:
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

        # Check if the user is new (registered in the current session)
        new_user_username = request.session.get('new_user_username')
        new_user_email = request.session.get('new_user_email')

        if new_user_username and new_user_email:
            # Check if the user exists in the database
            if User.objects.filter(username=new_user_username, email=new_user_email).exists():
                # Use the newly created user's information
                user = User.objects.get(username=new_user_username, email=new_user_email)
        else:
            # Use the authenticated user
            user = request.user

        water_usage = WaterUsage.objects.create(user=user, consumption=consumption, frequency=frequency)
        water_usage.save()

        if new_user_username and new_user_email:
            return redirect('food_consumption')
        else:
            return redirect('dashboard')
    
class FoodConsumptionView(View):
    """Provides a method that allows the user to input their food consumption data."""
    def get(self, request):
        """Renders the food consumption form."""
        return render(request, 'data_collection/food_consumption.html')

    def post(self, request):
        """Saves the food consumption data."""
        dietary_choices = request.POST['dietary_choices']
        frequency = request.POST['frequency']

        # Check if the user is new (registered in the current session)
        new_user_username = request.session.get('new_user_username')
        new_user_email = request.session.get('new_user_email')

        if new_user_username and new_user_email:
            # Check if the user exists in the database
            if User.objects.filter(username=new_user_username, email=new_user_email).exists():
                # Use the newly created user's information
                user = User.objects.get(username=new_user_username, email=new_user_email)
        else:
            # Use the authenticated user
            user = request.user

        food_consumption = FoodConsumption.objects.create(user=user, dietary_choices=dietary_choices, frequency=frequency)
        food_consumption.save()

        if new_user_username and new_user_email:
            return redirect('shopping_habits')
        else:
            return redirect('dashboard')
    
class ShoppingHabitsView(View):
    """Provides a method that allows the user to input their shopping habits data."""
    def get(self, request):
        """Renders the shopping habits form."""
        return render(request, 'data_collection/shopping_habits.html')

    def post(self, request):
        """Saves the shopping habits data."""
        purchasing_decisions = request.POST['purchasing_decisions']
        frequency = request.POST['frequency']

        # Check if the user is new (registered in the current session)
        new_user_username = request.session.get('new_user_username')
        new_user_email = request.session.get('new_user_email')

        if new_user_username and new_user_email:
            # Check if the user exists in the database
            if User.objects.filter(username=new_user_username, email=new_user_email).exists():
                # Use the newly created user's information
                user = User.objects.get(username=new_user_username, email=new_user_email)
        else:
            # Use the authenticated user
            user = request.user

        shopping_habits = ShoppingHabits.objects.create(user=user, purchasing_decisions=purchasing_decisions, frequency=frequency)
        shopping_habits.save()

        if new_user_username and new_user_email:
            return redirect('housing')
        else:
            return redirect('dashboard')
    
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
        location = request.POST['location']

        # Check if the user is new (registered in the current session)
        new_user_username = request.session.get('new_user_username')
        new_user_email = request.session.get('new_user_email')

        if new_user_username and new_user_email:
            # Check if the user exists in the database
            if User.objects.filter(username=new_user_username, email=new_user_email).exists():
                # Use the newly created user's information
                user = User.objects.get(username=new_user_username, email=new_user_email)
        else:
            # Use the authenticated user
            user = request.user

        housing = Housing.objects.create(user=user, home_size=home_size, energy_efficiency=energy_efficiency, heating_method=heating_method, cooling_method=cooling_method, location=location)
        housing.save()

        if new_user_username and new_user_email:
            # call function to calculate environmental impact if the user is new (this should be loaded with redirection to the dashboard)
            # the function that calculates the environmental impact should be in the impact/views.py file
            # it should also save the environmental impact in the database
            pass
        
        return redirect('dashboard')
