from django.shortcuts import render, redirect
from django.views import View
from .models import CarbonFootprintData, EnvironmentData
from django.contrib import messages
from django.utils import timezone
from django.http import JsonResponse, HttpResponseNotFound
from django.urls import reverse
import requests


class IndexView(View):
    """Provides a method that renders the index page."""
    def get(self, request):
        """Renders the index page. It passes variables to the index page
        to display the user's environmental data and carbon footprint."""
        user=request.user

        # To handle the case for existing users with environmental data
        try:
            # Get the current user's complete environmental data to display on the table
            environmental_data = EnvironmentData.objects.filter(user=user)

            # Get the most recent environmental data and use to get the most recent carbon footprint data to display on charts
            env_data_for_emission = EnvironmentData.objects.filter(user=user).latest('date_entered')
            if env_data_for_emission is not None:
                # Make a request to the UserDataRetrievalView API to get the user's carbon footprint data
                environment_data_id = env_data_for_emission.id
                url = reverse('user_data', kwargs={'environment_data_id': environment_data_id})
                response = requests.get(request.build_absolute_uri(url))
                if response.status_code == 200:
                    data = response.json()
                else:
                    data = None
            else:
                data = None

            context = {
                'environmental_data': environmental_data,
                'emission_data': data,
            }
            return render(request, 'data_collection/index.html', context)
        
        # To handle the case for new users without environmental data
        except EnvironmentData.DoesNotExist:
            messages.info(request, "You have not submitted any environmental data.")
            return render(request, 'data_collection/index.html')


class EnvDataView(View):
    """Provides a method that renders the environmental data collection page."""
    def get(self, request):
        """Collects the user's environmental data"""
        return render(request, 'data_collection/env_data.html')
    
    def post(self, request):
        """Makes a call to the method that calculates the carbon footprint from the
        user's environmental data."""

        user = request.user

        ##### SAVE THE USER'S ENVIRONMENTAL DATA IN THE DATABASE #####
        environment_data = {
            'user': user,
            'energy_source': request.POST.get('energy_source'),
            'energy_amount': float(request.POST.get('energy_amount')),
            'energy_unit': request.POST.get('energy_unit'),
            'transport_mode': request.POST.get('transport_mode'),
            'transport_passengers': int(request.POST.get('transport_passengers')),
            'transport_distance': float(request.POST.get('transport_distance')),
            'transport_unit': request.POST.get('transport_unit'),
            'transport_amount_spent': float(request.POST.get('transport_amount_spend', 0.0)),
            'transport_weight': float(request.POST.get('transport_weight')),
            'transport_weight_unit': request.POST.get('transport_weight_unit'),
            'clothing_type': request.POST.get('clothing_type'),
            'clothing_spent': float(request.POST.get('clothing_spent')),
            'food_bev_tob_type': request.POST.get('food_bev_tob_type'),
            'food_bev_tob_spent': float(request.POST.get('food_bev_tob_spent')),
            'paper_products_type': request.POST.get('paper_product_type'),
            'paper_products_spent': float(request.POST.get('paper_products_spent')),
            'waste_type': request.POST.get('waste_type'),
            'waste_weight': float(request.POST.get('waste_weight')),
            'waste_unit': request.POST.get('waste_unit'),
            'water_supply_weight': float(request.POST.get('water_supply_weight')),
            'water_supply_unit': request.POST.get('water_supply_unit'),
            'water_treatment_volume': float(request.POST.get('water_treatment_volume')),
            'water_treatment_unit': request.POST.get('water_treatment_unit'),
            'cloud_computing_number': int(request.POST.get('cloud_computing_number')),
            'cloud_computing_time': float(request.POST.get('cloud_computing_time')),
            'cloud_computing_unit': request.POST.get('computing_time_unit'),
            'networking_data_transferred': float(request.POST.get('networking_data_transferred')),
            'networking_unit': request.POST.get('networking_data_unit'),
            'personal_computing_time_spent': float(request.POST.get('personal_computing_time_spent')),
            'personal_computing_unit': request.POST.get('personal_computing_unit'),
        }
        environment_data = EnvironmentData(**environment_data)
        environment_data.save()

        ##### CALCULATE CARBON FOOTPRINT #####
        environment_data = EnvironmentData.objects.filter(user=user).order_by('-date_entered').first()
        if environment_data is not None:
            carbon_footprint = CarbonFootprintCalculator.calculate_carbon_footprint([environment_data])
            individual_footprints = carbon_footprint['individual_footprints']
            total_carbon_footprint = carbon_footprint['total_carbon_footprint']

            carbon_footprint_data = CarbonFootprintData(
                user=user,
                date_calculated=timezone.now(),
                environment_data=environment_data,
                total_carbon_footprint=total_carbon_footprint,
                energy_footprint=individual_footprints['energy'],
                transport_footprint=individual_footprints['transportation'],
                consumer_goods_footprint=individual_footprints['consumer_goods'],
                waste_footprint=individual_footprints['waste'],
                water_footprint=individual_footprints['water'],
                technology_footprint=individual_footprints['technology'],
            )
            carbon_footprint_data.save()

        # Redirect user to the index page
        return redirect('data_collection')


class UserDataRetrievalView(View):
    """Creates an endpoint to retrieve the current user's most recent environmental and
    carbon footprint datasets from the database and prepare them for display."""

    def get(self, request, environment_data_id=None, user_id=None):
        """Retrieve and display user's data.
        
        Arguments:
            request -- the request object
            environment_data_id -- the id of the environmental data to retrieve
        """

        # Check if environment_data_id is not None
        if environment_data_id is not None:
            try:
                environment_data = EnvironmentData.objects.get(id=environment_data_id)
                carbon_footprint_data = CarbonFootprintData.objects.get(environment_data_id=environment_data_id)
            except EnvironmentData.DoesNotExist:
                return HttpResponseNotFound('The requested environmental data does not exist.')
            except CarbonFootprintData.DoesNotExist:
                return HttpResponseNotFound('The requested carbon footprint data does not exist.')

            # Check if environment_data and carbon_footprint_data are not None
            if environment_data is not None and carbon_footprint_data is not None:
                # Prepare the data for JsonResponse
                env_data_summary = {
                    'labels': ['Energy', 'Transport', 'Consumer Goods', 'Waste', 'Water', 'Technology'],
                    'data': [
                        environment_data.energy_amount,
                        environment_data.transport_distance,
                        environment_data.clothing_spent + environment_data.food_bev_tob_spent + environment_data.paper_products_spent,
                        environment_data.waste_weight,
                        environment_data.water_supply_weight,
                        environment_data.cloud_computing_time + environment_data.personal_computing_time_spent,
                    ],
                }

                total_carbon_footprint = {
                    'total_carbon_footprint': carbon_footprint_data.total_carbon_footprint,
                }

                carbon_footprint = {
                    'Energy Footprint': carbon_footprint_data.energy_footprint,
                    'Transport Footprint': carbon_footprint_data.transport_footprint,
                    'Consumer Goods Footprint': carbon_footprint_data.consumer_goods_footprint,
                    'Waste Footprint': carbon_footprint_data.waste_footprint,
                    'Water Footprint': carbon_footprint_data.water_footprint,
                    'Technology Footprint': carbon_footprint_data.technology_footprint,
                }

                # Return the data as JsonResponse
                return JsonResponse({'env_data_summary': env_data_summary, 'carbon_footprint': carbon_footprint, 'total_carbon_footprint': total_carbon_footprint}, status=200)

        return HttpResponseNotFound('Data not found')
    

class CarbonFootprintCalculator:
    """Determines the user's carbon footprint.
    """

    @staticmethod
    def calculate_carbon_footprint(environment_data):
        """@staticmethod allows the method to be called
        directly on the class without needing an instance of the class"""

        # Initialize individual footprints and total footprint
        individual_footprints = {}
        total_carbon_footprint = 0

        # Calculate carbon footprint for energy consumption
        energy_factors = {
            'electricity': 0.5,
            'natural_gas': 0.7,
            'fuel': 2.0,
        }
        energy_footprint = sum(data.energy_amount * energy_factors.get(data.energy_source, 0) for data in environment_data)
        individual_footprints['energy'] = energy_footprint
        total_carbon_footprint += energy_footprint

        # Calculate carbon footprint for transportation
        transport_factors = {
            'air_travel': 1.0,
            'rail_travel': 0.5,
            'vehicle': 0.8,
            'freight': 1.2,
        }
        transport_footprint = sum(data.transport_distance * transport_factors.get(data.transport_mode, 0) for data in environment_data)
        individual_footprints['transportation'] = transport_footprint
        total_carbon_footprint += transport_footprint

        # Calculate carbon footprint for consumer goods
        consumer_goods_factors = {
            'fur': 0.3,
            'leather': 0.4,
            'food_bev_tob': 0.5,    # consider adding subcategories
            'paper_products': 0.2,
        }
        consumer_goods_footprint = sum(
            (data.clothing_spent if data.clothing_type in ['fur', 'leather'] else 0) * consumer_goods_factors.get(data.clothing_type, 0) +
            data.food_bev_tob_spent * consumer_goods_factors.get('food_bev_tob', 0) +   # consider using subcategories
            data.paper_products_spent * consumer_goods_factors.get('paper_products', 0)
            for data in environment_data
        )
        individual_footprints['consumer_goods'] = consumer_goods_footprint
        total_carbon_footprint += consumer_goods_footprint

        # Calculate carbon footprint for waste
        waste_factors = {
            'construction_waste': 0.4,
            'electrical_waste': 0.6,
            'food_organic_waste': 0.3,
            'glass_waste': 0.2,
            'metal_waste': 0.5,
            'plastic_waste': 0.7,
        }
        waste_footprint = sum(data.waste_weight * waste_factors.get(data.waste_type, 0) for data in environment_data)
        individual_footprints['waste'] = waste_footprint
        total_carbon_footprint += waste_footprint

        # Calculate carbon footprint for water
        water_factors = {
            'water_supply': 0.1,
            'water_treatment': 0.2,
        }
        water_footprint = sum(
            data.water_supply_weight * water_factors.get('water_supply', 0) +
            data.water_treatment_volume * water_factors.get('water_treatment', 0)
            for data in environment_data
        )
        individual_footprints['water'] = water_footprint
        total_carbon_footprint += water_footprint

        # Calculate carbon footprint for technology
        technology_factors = {
            'cloud_computing': 0.6,
            'networking': 0.8,
            'personal_computing': 0.7,
        }
        technology_footprint = sum(
            data.cloud_computing_number * data.cloud_computing_time * technology_factors.get('cloud_computing', 0) +
            data.networking_data_transferred * technology_factors.get('networking', 0) +
            data.personal_computing_time_spent * technology_factors.get('personal_computing', 0)
            for data in environment_data
        )
        individual_footprints['technology'] = technology_footprint
        total_carbon_footprint += technology_footprint

        # Return a dictionary containing all individual footprints and the total footprint
        return {'individual_footprints': individual_footprints, 'total_carbon_footprint': total_carbon_footprint}



class AnalyticsView(View):
    """Provides a method that renders the analytics page."""
    def get(self, request):
        """Renders the analytics page. It passes variables to the analytics page
        to display the user's environmental data and carbon footprint."""
        user=request.user

        # Get the current user's complete environmental data to display on the table
        environmental_data = EnvironmentData.objects.filter(user=user)

        # Get the most recent environmental data and use to get the most recent carbon footprint data to display on charts
        env_data_for_emission = EnvironmentData.objects.filter(user=user).latest('date_entered')
        if env_data_for_emission is not None:
            # Make a request to the UserDataRetrievalView API to get the user's carbon footprint data
            environment_data_id = env_data_for_emission.id
            url = reverse('user_data', kwargs={'environment_data_id': environment_data_id})
            response = requests.get(request.build_absolute_uri(url))
            if response.status_code == 200:
                data = response.json()
            else:
                data = None
        else:
            data = None

        context = {
            'environmental_data': environmental_data,
            'emission_data': data,
        }
        return render(request, 'data_collection/analytics.html', context)