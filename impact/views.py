from data_collection.models import EnergyConsumption, Transportation, WasteGeneration, WaterUsage, FoodConsumption, ShoppingHabits, Housing
from django.views import View
from .models import EnvData


class UserDataRetrievalView(View):
    """Retrieves user's data from the database to calculate the environmental impact"""
    def __init__(self, user):
        self.user = user
        self.energy_datatype = None
        self.transportation_data = None
        self.waste_data = None
        self.water_data = None
        self.food_data = None
        self.shopping_data = None
        self.housing_data = None
    
    def get_energy_consumption_data(self):
        """Retrieves the user's energy consumption data from the database"""
        energy_data = EnergyConsumption.objects.filter(user=self.user).first()
        return energy_data
    
    def get_transportation_data(self):
        """Retrieves the user's transportation data from the database"""
        transportation_data = Transportation.objects.filter(user=self.user).first()
        return transportation_data
    
    def get_waste_data(self):
        """Retrieves the user's waste data from the database"""
        waste_data = WasteGeneration.objects.filter(user=self.user).first()
        return waste_data
    
    def get_water_data(self):
        """Retrieves the user's water data from the database"""
        water_data = WaterUsage.objects.filter(user=self.user).first()
        return water_data
    
    def get_food_data(self):
        """Retrieves the user's food consumption data from the database"""
        food_data = FoodConsumption.objects.filter(user=self.user).first()
        return food_data
    
    def get_shopping_data(self):
        """Retrieves the user's shopping habits data from the database"""
        shopping_data = ShoppingHabits.objects.filter(user=self.user).first()
        return shopping_data
    
    def get_housing_data(self):
        """Retrieves the user's housing data from the database"""
        housing_data = Housing.objects.filter(user=self.user).first()
        return housing_data
    
    def store_user_data(self):
        """Stores the user's data in the EnvData table"""
        self.energy_data = self.get_energy_consumption_data()
        self.transportation_data = self.get_transportation_data()
        self.waste_data = self.get_waste_data()
        self.water_data = self.get_water_data()
        self.food_data = self.get_food_data()
        self.shopping_data = self.get_shopping_data()
        self.housing_data = self.get_housing_data()
        
        # Create an EnvData instance with the retrieved data
        env_data = EnvData(
            user=self.user,
            energy_consumption = self.energy_data.amount if self.energy_data else 0.0,
            transportation = self.transportation_data.distance if self.transportation_data else 0.0,
            waste_generation = self.waste_data.amount if self.waste_data else 0.0,
            water_usage = self.water_data.consumption if self.water_data else 0.0,
            food_consumption = 1.0 if self.food_data else 0.0,
            shopping_habits = 2.0 if self.shopping_data else 0.0,
            housing = self.housing_data.home_size if self.housing_data else 0.0
        )
        env_data.save()

        return {
            'energy_data': self.energy_data,
            'transportation_data': self.transportation_data,
            'waste_data': self.waste_data,
            'water_data': self.water_data,
            'food_data': self.food_data,
            'shopping_data': self.shopping_data,
            'housing_data': self.housing_data 
        }