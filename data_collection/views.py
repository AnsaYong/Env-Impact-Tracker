"""This module contains the views for the data_collection app.
"""
from django.shortcuts import render, redirect
from django.views import View
from .models import CarbonFootprintData, EnvironmentData
from django.contrib import messages
from django.utils import timezone
from django.http import JsonResponse, HttpResponseNotFound
from django.urls import reverse
import requests, json
from django.core.exceptions import ObjectDoesNotExist
from django.db.models import Sum
from datetime import timedelta


class IndexView(View):
    """
    Provides a method that renders the data collection/dashboard index page.

    Methods:
        - get(self, request): Renders the index page and passes variables to display the user's
        environmental data and carbon footprint.

    Attributes:
        None
    """

    def get(self, request):
        """
        Renders the index page and passes variables to display the user's most recent 
        environmental data and carbon footprint.

        Args:
            request (HttpRequest): The request object passed by Django.

        Returns:
            HttpResponse: The HTTP response containing the rendered index page.
        """
        if request.user.is_authenticated:
            user = request.user
        else:
            return redirect('login')

        # Get the user's COMPLETE environmental data to display on the table
        environmental_data = EnvironmentData.objects.filter(user=user)
        try:
            # Get the user's MOST RECENT carbon footprint data to display on charts
            env_data_for_emission = EnvironmentData.objects.filter(user=user).latest('date_entered')
            if env_data_for_emission is not None:
                # API call to retrieve the MOST RECENT emission data using the env data id
                environment_data_id = env_data_for_emission.id
                url = reverse('user_data', kwargs={'environment_data_id': environment_data_id})
                response = requests.get(request.build_absolute_uri(url))
                if response.status_code == 200:
                    data = response.json()
                else:
                    data = None
            else:
                data = None

        except ObjectDoesNotExist:
            # Handle the case where no EnvironmentData object exists for the user
            messages.info(request, "You have not submitted any environmental data yet.")
            return render(request, 'data_collection/index.html')

        # Pass the environmental data and carbon footprint data to the index page
        context = {
            'data_id': environment_data_id,
            'environmental_data': environmental_data,
            'emission_data': data,
        }
        return render(request, 'data_collection/index.html', context)


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
    """
    Creates an endpoint to retrieve the current user's most recent environmental and
    carbon footprint datasets from the database and prepare them for display.

    Methods:
        - get(self, request, environment_data_id=None, user_id=None): Retrieves
        and displays user's data.

    Attributes:
        None
    """

    def get(self, request, environment_data_id=None, user_id=None):
        """
        Retrieve and display user's data.

        Args:
            request (HttpRequest): The request object passed by Django.
            environment_data_id (int, optional): The id of the environmental data to retrieve.
            user_id (int, optional): The id of the user.

        Returns:
            JsonResponse: The JSON response containing the user's environmental and
            carbon footprint data.
            HttpResponseNotFound: If the requested data does not exist.
        """
        print(f"environment_data_id: {environment_data_id}")
        if environment_data_id is not None:
            print("Attempting to retrieve data from the database.")
            try:
                environment_data = EnvironmentData.objects.get(id=environment_data_id)
                carbon_footprint_data = CarbonFootprintData.objects.get(environment_data_id=environment_data_id)
            except EnvironmentData.DoesNotExist:
                return HttpResponseNotFound('The requested environmental data does not exist.')
            except CarbonFootprintData.DoesNotExist:
                return HttpResponseNotFound('The requested carbon footprint data does not exist.')
            
            print("Env data and carbon footprint data retrieved successfully.")

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
                    'labels': ['Energy', 'Transport', 'Consumer Goods', 'Waste', 'Water', 'Technology'],
                    'data': [
                        carbon_footprint_data.energy_footprint,
                        carbon_footprint_data.transport_footprint,
                        carbon_footprint_data.consumer_goods_footprint,
                        carbon_footprint_data.waste_footprint,
                        carbon_footprint_data.water_footprint,
                        carbon_footprint_data.technology_footprint,
                    ],
                }

                # Return the data as JsonResponse
                return JsonResponse(
                                    {'env_data_summary': env_data_summary,
                                     'carbon_footprint': carbon_footprint,
                                     'total_carbon_footprint': total_carbon_footprint
                                     },
                                     status=200)

        # Handle the case where environment_data_id is None
        
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

        total_carbon_footprint = round(total_carbon_footprint, 2)

        # Return a dictionary containing all individual footprints and the total footprint
        return {'individual_footprints': individual_footprints, 'total_carbon_footprint': total_carbon_footprint}


class AnalyticsView(View):
    """Provides a method that renders the analytics page."""
    def get(self, request):
        """Renders the analytics page. It passes variables to the analytics page
        to display the user's environmental data and carbon footprint."""
        if request.user.is_authenticated:
            user = request.user
        else:
            return redirect('login')
        
        environmental_data = EnvironmentData.objects.filter(user=user)

        context = {
            'environmental_data': environmental_data,
        }

        return render(request, 'data_collection/analytics.html', context)
    

class AggregateDataRetrievalView(View):
    """
    Creates an endpoint to retrieve the current user's aggregated environmental and
    carbon footprint datasets from the database and prepare them for display and analysis.

    Methods:
        - get(self, request): Retrieves and prepares user's data for display and analysis.

    Attributes: 
        None
    """

    def get(self, request, user_id=None):
        """
        Retrieve and prepare user's aggregated data for display and analysis.

        Args:
            request (HttpRequest): The request object passed by Django.

        Returns:
            JsonResponse: The JSON response containing the user's aggregated environmental
            and carbon footprint data.
        """
        if user_id is not None:
            # Get the earliest date in the user's data to use in preparing weekly data
            print("Finding the earliest date in the user's data...")
            earliest_date = EnvironmentData.objects.filter(user_id=user_id).order_by('date_entered').values('date_entered').first()
            earliest_date_value = earliest_date['date_entered']

            # Calculate the starting date of the first week
            start_date = earliest_date_value - timedelta(days=earliest_date_value.weekday())
            current_date = start_date

            # Group the environmental data into weeks based on the earliest date
            weekly_environment_data = []
            while True:
                end_date = current_date + timedelta(days=6)
                week_data = EnvironmentData.objects.filter(user_id=user_id, date_entered__gte=current_date, date_entered__lte=end_date).aggregate(
                    total_energy=Sum('energy_amount'),
                    total_distance=Sum('transport_distance'),
                    total_waste=Sum('waste_weight'),
                    total_technology=Sum('personal_computing_time_spent') + Sum('cloud_computing_time'),
                    total_water=Sum('water_supply_weight'),
                    total_consumer_goods=Sum('clothing_spent') + Sum('food_bev_tob_spent') + Sum('paper_products_spent'),
                )
                if all(value is None for value in week_data.values()):
                    break
                weekly_environment_data.append(week_data)
                current_date = end_date + timedelta(days=1)

            print("Weekly environment data:", weekly_environment_data)

            # Group the carbon footprint data into weeks based on the earliest date
            weekly_carbon_footprint_data = []
            current_date = start_date
            while True:
                end_date = current_date + timedelta(days=6)
                week_data = CarbonFootprintData.objects.filter(environment_data__user_id=user_id, environment_data__date_entered__gte=current_date, environment_data__date_entered__lte=end_date).aggregate(
                    total_carbon_footprint=Sum('total_carbon_footprint'),
                    energy_footprint=Sum('energy_footprint'),
                    transport_footprint=Sum('transport_footprint'),
                    consumer_goods_footprint=Sum('consumer_goods_footprint'),
                    waste_footprint=Sum('waste_footprint'),
                    water_footprint=Sum('water_footprint'),
                    technology_footprint=Sum('technology_footprint'),
                )
                if all(value is None for value in week_data.values()):
                    break
                weekly_carbon_footprint_data.append(week_data)
                current_date = end_date + timedelta(days=1)

            print("Weekly carbon footprint data:", weekly_carbon_footprint_data)

            # Prepare data for JsonResponse
            weekly_env_summary = {}
            for i, week_env in enumerate(weekly_environment_data, start=1):
                week_number = i
                weekly_env_summary[f'Week {week_number}'] = {
                    'total_energy': week_env['total_energy'] or 0,
                    'total_distance': week_env['total_distance'] or 0,
                    'total_waste': week_env['total_waste'] or 0,
                    'total_technology': week_env['total_technology'] or 0,
                }

            weekly_footprint_summary = {}
            for i, week_cf in enumerate(weekly_carbon_footprint_data, start=1):
                week_number = i
                weekly_footprint_summary[f'Week {week_number}'] = {
                    'total_carbon_footprint': week_cf['total_carbon_footprint'] or 0,
                    'energy_footprint': week_cf['energy_footprint'] or 0,
                    'transport_footprint': week_cf['transport_footprint'] or 0,
                    'consumer_goods_footprint': week_cf['consumer_goods_footprint'] or 0,
                    'waste_footprint': week_cf['waste_footprint'] or 0,
                    'water_footprint': week_cf['water_footprint'] or 0,
                    'technology_footprint': week_cf['technology_footprint'] or 0,
                }

            # Get the highest three contributors to the user's carbon footprint
            highest_contributors = [
                ('Energy', sum([week_cf['energy_footprint'] or 0 for week_cf in weekly_carbon_footprint_data])),
                ('Transport', sum([week_cf['transport_footprint'] or 0 for week_cf in weekly_carbon_footprint_data])),
                ('Consumer Goods', sum([week_cf['consumer_goods_footprint'] or 0 for week_cf in weekly_carbon_footprint_data])),
                ('Waste', sum([week_cf['waste_footprint'] or 0 for week_cf in weekly_carbon_footprint_data])),
                ('Water', sum([week_cf['water_footprint'] or 0 for week_cf in weekly_carbon_footprint_data])),
                ('Technology', sum([week_cf['technology_footprint'] or 0 for week_cf in weekly_carbon_footprint_data])),
            ]
            highest_contributors.sort(key=lambda x: x[1], reverse=True)
            highest_contributors = highest_contributors[:3]

            # Return the data as JsonResponse
            return JsonResponse({'weekly_env_data': weekly_env_summary,
                                 'weekly_footprint_data': weekly_footprint_summary,
                                 'highest_contributors': highest_contributors}, status=200)


class DataProjectionView(View):
    """
    View to project the user's carbon footprint based on their environmental data.
    
    This view retrieves weekly environmental and carbon footprint data for the user, calculates the
    average change per week, and predicts the next week's data based on this average change.
    
    Attributes:
        None

    Methods:
        get: Retrieves data, performs trnd analysis, and reders the data in a template.
    """
    def get(self, request, user_id=None):
        """
        Retrieves weekly environmental and carbon footprint data, performs trend analysis,
        and renders the data in a template.

        Args:
            request: The HTTP request object.
            user_id: The user ID for which to retrieve data.

        Returns:
            A rendered template displaying the data.

        """
        user_id = request.user.id
        print("Projection: User ID:", user_id)

        response = AggregateDataRetrievalView.as_view()(request, user_id)
        content = response.content
        data = json.loads(content)

        print("Data:", data)

        # Perform trend analysis
        # For simplicity, let's assume we're predicting the next week's data based on the average change per week
        last_week_env = data['weekly_env_data'][list(data['weekly_env_data'].keys())[-1]]
        last_week_cf = data['weekly_footprint_data'][list(data['weekly_footprint_data'].keys())[-1]]

        # Calculate the average change per week
        avg_change_env = {
            'total_energy': last_week_env['total_energy'] / len(data['weekly_env_data']),
            'total_distance': last_week_env['total_distance'] / len(data['weekly_env_data']),
            'total_waste': last_week_env['total_waste'] / len(data['weekly_env_data']),
            'total_technology': last_week_env['total_technology'] / len(data['weekly_env_data']),
        }
        avg_change_cf = {
            'total_carbon_footprint': last_week_cf['total_carbon_footprint'] / len(data['weekly_footprint_data']),
            'energy_footprint': last_week_cf['energy_footprint'] / len(data['weekly_footprint_data']),
            'transport_footprint': last_week_cf['transport_footprint'] / len(data['weekly_footprint_data']),
            'consumer_goods_footprint': last_week_cf['consumer_goods_footprint'] / len(data['weekly_footprint_data']),
            'waste_footprint': last_week_cf['waste_footprint'] / len(data['weekly_footprint_data']),
            'water_footprint': last_week_cf['water_footprint'] / len(data['weekly_footprint_data']),
            'technology_footprint': last_week_cf['technology_footprint'] / len(data['weekly_footprint_data']),
        }

        # Predict the next week's data
        next_week_env = {
            'total_energy': last_week_env['total_energy'] + avg_change_env['total_energy'],
            'total_distance': last_week_env['total_distance'] + avg_change_env['total_distance'],
            'total_waste': last_week_env['total_waste'] + avg_change_env['total_waste'],
            'total_technology': last_week_env['total_technology'] + avg_change_env['total_technology'],
        }
        next_week_cf = {
            'total_carbon_footprint': last_week_cf['total_carbon_footprint'] + avg_change_cf['total_carbon_footprint'],
            'energy_footprint': last_week_cf['energy_footprint'] + avg_change_cf['energy_footprint'],
            'transport_footprint': last_week_cf['transport_footprint'] + avg_change_cf['transport_footprint'],
            'consumer_goods_footprint': last_week_cf['consumer_goods_footprint'] + avg_change_cf['consumer_goods_footprint'],
            'waste_footprint': last_week_cf['waste_footprint'] + avg_change_cf['waste_footprint'],
            'water_footprint': last_week_cf['water_footprint'] + avg_change_cf['water_footprint'],
            'technology_footprint': last_week_cf['technology_footprint'] + avg_change_cf['technology_footprint'],
        }

        # Add the predictions to the data
        data['next_week_env'] = next_week_env
        data['next_week_cf'] = next_week_cf

        # Render the data in a template
        return render(request, 'data_collection/projection.html', {'data': data})


class DataDisplayView(View):
    """Provides a method that displays the user's selected environmental data and carbon footprint."""
    def get(self, request, environment_data_id):
        """Displays the user's selected environmental data and carbon footprint."""
        if request.user.is_authenticated:
            user = request.user
        else:
            return redirect('login')

        # Get the user's COMPLETE environmental data to display on the table in this new page
        environmental_data = EnvironmentData.objects.filter(user=user)

        # Get the user's total carbon footprint data
        carbon_footprint_data = CarbonFootprintData.objects.get(environment_data_id=environment_data_id)
        total_carbon_footprint = {
                    'total_carbon_footprint': carbon_footprint_data.total_carbon_footprint,
                }

        context = {
            'data_id': environment_data_id,
            'environmental_data': environmental_data,
            'total_carbon_footprint': total_carbon_footprint,
        }        
        return render(request, 'data_collection/display_data.html', context)


class DataDeletionView(View):
    """
    View to delete a user's environmental data record.

    Methods:
        - get(self, request, environment_data_id): Displays a confirmation page for the data deletion.
        - post(self, request, environment_data_id): Deletes a user's environmental data record.

    Attributes:
        None
    """

    def get(self, request, environment_data_id):
        """
        Displays a confirmation page for the data deletion.

        Args:
            request (HttpRequest): The request object passed by Django.
            environment_data_id (int): The id of the environmental data record to delete.

        Returns:
            HttpResponse: The HTTP response containing the confirmation page.
            HttpResponseNotFound: If the specified environmental data record does not exist.
        """
        try:
            env_data_record = EnvironmentData.objects.get(id=environment_data_id, user=request.user)
        except EnvironmentData.DoesNotExist:
            # Handle case where the specified data record does not exist
            return HttpResponseNotFound('The specified data record does not exist.')

        
        return render(request, 'data_collection/confirm_delete.html', {'data_record': env_data_record})
    
    def post(self, request, environment_data_id):
        """
        Deletes a user's environmental data record and its associated carbon footprint data.

        Args:
            request (HttpRequest): The request object passed by Django.
            environment_data_id (int): The id of the environmental data record to delete.

        Returns:
            HttpResponseRedirect: Redirects the user to 'data_collection' page after deletion.
            HttpResponseNotFound: If the specified environmental data record does not exist.
        """
        print("Deleting data...")
        try:
            env_data_record = EnvironmentData.objects.get(id=environment_data_id, user=request.user)
            carbon_footprint_data = CarbonFootprintData.objects.filter(environment_data_id=environment_data_id)

            carbon_footprint_data.delete()
            env_data_record.delete()
            messages.success(request, 'Data deleted successfully.')

        except EnvironmentData.DoesNotExist:
            # Handle case where the specified data record does not exist
            return HttpResponseNotFound('The specified data record does not exist.')

        return redirect('data_collection')