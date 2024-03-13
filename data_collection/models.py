from django.db import models
from django.contrib.auth.models import User
from django.utils.timezone import now


class EnvironmentData(models.Model):
    """Model for the environment data"""
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    date_entered = models.DateTimeField(default=now, editable=False)


    class Meta:
        """Ensures that the data is ordered by date entered, in descending order."""
        ordering = ['-date_entered']
        verbose_name_plural = 'Environment Data'


    # Energy data
    ENERGY_CHOICES = [
        ('electricity', 'Electricity'),
        ('natural_gas', 'Natural Gas'),
        ('fuel', 'Fuel'),
    ]
    energy_source = models.CharField(max_length=20, choices=ENERGY_CHOICES)
    energy_amount = models.FloatField(default=0.0)
    energy_unit = models.CharField(max_length=20, default='kWh')

    # Transportation data
    TRANSPORT_MODE_CHOICES = [
        ('air_travel', 'Air Travel'),
        ('rail_travel', 'Rail Travel'),
        ('vehicle', 'Vehicle'),
        ('freight', 'Freight'),
    ]
    transport_mode = models.CharField(max_length=20, choices=TRANSPORT_MODE_CHOICES)
    transport_type_choices = [
        ('international', 'International'),
        ('domestic', 'Domestic'),
    ]
    transport_mode = models.CharField(max_length=20, choices=TRANSPORT_MODE_CHOICES)
    transport_passengers = models.PositiveIntegerField(default=0)
    transport_distance = models.FloatField(default=0.0)
    transport_unit = models.CharField(max_length=50, default='km')
    transport_amount_spent = models.FloatField(default=0.0)
    transport_amount_unit = models.CharField(max_length=50, default='USD')
    transport_weight = models.FloatField(default=0.0)
    transport_weight_unit = models.CharField(max_length=50, default='kg')

    # Consumer goods
    CLOTHING_CHOICES = [
        ('fur', 'Fur'),
        ('leather', 'Leather'),
    ]

    FOOD_BEVERAGES_TOBACCO = [
        ('dairy', 'Dairy'),
        ('fish', 'Fish'),
        ('meat', 'Meat'),
        ('vegetables', 'Vegetables'),
        ('fruits', 'Fruits'),
        ('beverages', 'Beverages'),
        ('tobacco', 'Tobacco'),
        ('sugar', 'Sugar'),
        ('other', 'Other'),
    ]

    PAPER_PRODUCTS = [
        ('paper', 'Paper'),
        ('cardboard', 'Cardboard'),
        ('pulp', 'Pulp'),
        ('paper_bag', 'Paper Bag'),
        ('other', 'Other'),
    ]

    clothing_type = models.CharField(max_length=20, choices=CLOTHING_CHOICES)
    clothing_spent = models.FloatField(default=0.0)
    clothing_unit = models.CharField(max_length=50, default='USD')
    food_bev_tob_type = models.CharField(max_length=20, choices=FOOD_BEVERAGES_TOBACCO)
    food_bev_tob_spent = models.FloatField(default=0.0)
    food_bev_tob_unit = models.CharField(max_length=50, default='USD')
    paper_products_type = models.CharField(max_length=20, choices=PAPER_PRODUCTS)
    paper_products_spent = models.FloatField(default=0.0)
    paper_products_unit = models.CharField(max_length=50, default='USD')


    # Waste
    CONSTRUCTION_WASTE = 'construction_waste'
    ELECTRICAL_WASTE = 'electrical_waste'
    FOOD_ORGANIC_WASTE = 'food_organic_waste'
    GLASS_WASTE = 'glass_waste'
    METAL_WASTE = 'metal_waste'
    PLASTIC_WASTE = 'plastic_waste'
    WASTE_CHOICES = [
        (CONSTRUCTION_WASTE, 'Construction Waste'),
        (ELECTRICAL_WASTE, 'Electrical Waste'),
        (FOOD_ORGANIC_WASTE, 'Food and Organic Waste'),
        (GLASS_WASTE, 'Glass Waste'),
        (METAL_WASTE, 'Metal Waste'),
        (PLASTIC_WASTE, 'Plastic Waste'),
    ]
    waste_type = models.CharField(max_length=255, choices=WASTE_CHOICES)
    waste_weight = models.FloatField(default=0.0)
    waste_unit = models.CharField(max_length=50, default='kg')


    # Water
    water_supply_weight = models.FloatField(default=0.0)
    water_supply_unit = models.CharField(max_length=50, default='kg')
    water_treatment_volume = models.FloatField(default=0.0)
    water_treatment_unit = models.CharField(max_length=50, default='l')


    # Technology
    CLOUD_COMPUTING_UNIT_CHOICES = [
        ('hours', 'Hours'),
        ('days', 'Days'),
        ('months', 'Months'),
        ('years', 'Years'),
    ]

    NETWORKING_UNIT_CHOICES = [
        ('GB', 'Gigabytes'),
        ('TB', 'Terabytes'),
        ('PB', 'Petabytes'),
    ]

    PERSONAL_COMPUTING_UNIT_CHOICES = [
        ('hours', 'Hours'),
        ('days', 'Days'),
        ('months', 'Months'),
        ('years', 'Years'),
    ]

    cloud_computing_time = models.FloatField(default=0)
    cloud_computing_unit = models.CharField(max_length=50, choices=CLOUD_COMPUTING_UNIT_CHOICES, default='hours')
    cloud_computing_number = models.IntegerField(default=0)

    networking_data_transferred = models.FloatField(default=0)
    networking_unit = models.CharField(max_length=50, choices=NETWORKING_UNIT_CHOICES, default='GB')
    
    personal_computing_time_spent = models.FloatField(default=0)
    personal_computing_unit = models.CharField(max_length=50, choices=PERSONAL_COMPUTING_UNIT_CHOICES, default='hours')

    def __str__(self):
        return f"Environmental Data for {self.user.username} on {self.date_entered}"

# Path: data_collection/env_data.py
    


class CarbonFootprintData(models.Model):
    """Model to store calculated carbon footprint data."""
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    date_calculated = models.DateTimeField(auto_now_add=True)
    environment_data = models.ForeignKey(EnvironmentData, on_delete=models.CASCADE)

    total_carbon_footprint = models.FloatField(default=0.0)
    
    energy_footprint = models.FloatField(default=0.0)
    transport_footprint = models.FloatField(default=0.0)
    consumer_goods_footprint = models.FloatField(default=0.0)
    waste_footprint = models.FloatField(default=0.0)
    water_footprint = models.FloatField(default=0.0)
    technology_footprint = models.FloatField(default=0.0)

    class Meta:
        verbose_name_plural = 'Carbon Footprint Data'

    def __str__(self):
        return f"Carbon Footprint Data for {self.user.username} on {self.date_calculated}"
    
# Path: data_collection/views.py