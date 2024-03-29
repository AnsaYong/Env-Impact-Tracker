# Generated by Django 5.0.2 on 2024-03-11 21:35

import django.db.models.deletion
import django.utils.timezone
from django.conf import settings
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='CarbonFootprintData',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('date_calculated', models.DateTimeField(auto_now_add=True)),
                ('total_carbon_footprint', models.FloatField(default=0.0)),
                ('energy_footprint', models.FloatField(default=0.0)),
                ('transport_footprint', models.FloatField(default=0.0)),
                ('consumer_goods_footprint', models.FloatField(default=0.0)),
                ('waste_footprint', models.FloatField(default=0.0)),
                ('water_footprint', models.FloatField(default=0.0)),
                ('technology_footprint', models.FloatField(default=0.0)),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='EnvironmentData',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('date_entered', models.DateTimeField(default=django.utils.timezone.now, editable=False)),
                ('energy_source', models.CharField(choices=[('electricity', 'Electricity'), ('natural_gas', 'Natural Gas'), ('fuel', 'Fuel')], max_length=20)),
                ('energy_amount', models.FloatField(default=0.0)),
                ('energy_unit', models.CharField(default='kWh', max_length=20)),
                ('transport_mode', models.CharField(choices=[('air_travel', 'Air Travel'), ('rail_travel', 'Rail Travel'), ('vehicle', 'Vehicle'), ('freight', 'Freight')], max_length=20)),
                ('transport_passengers', models.PositiveIntegerField(default=0)),
                ('transport_distance', models.FloatField(default=0.0)),
                ('transport_unit', models.CharField(default='km', max_length=50)),
                ('transport_amount_spent', models.FloatField(default=0.0)),
                ('transport_amount_unit', models.CharField(default='USD', max_length=50)),
                ('transport_weight', models.FloatField(default=0.0)),
                ('transport_weight_unit', models.CharField(default='kg', max_length=50)),
                ('clothing_type', models.CharField(choices=[('fur', 'Fur'), ('leather', 'Leather')], max_length=20)),
                ('clothing_spent', models.FloatField(default=0.0)),
                ('clothing_unit', models.CharField(default='USD', max_length=50)),
                ('food_bev_tob_type', models.CharField(choices=[('dairy', 'Dairy'), ('fish', 'Fish'), ('meat', 'Meat'), ('vegetables', 'Vegetables'), ('fruits', 'Fruits'), ('beverages', 'Beverages'), ('tobacco', 'Tobacco'), ('sugar', 'Sugar'), ('other', 'Other')], max_length=20)),
                ('food_bev_tob_spent', models.FloatField(default=0.0)),
                ('food_bev_tob_unit', models.CharField(default='USD', max_length=50)),
                ('paper_products_type', models.CharField(choices=[('paper', 'Paper'), ('cardboard', 'Cardboard'), ('pulp', 'Pulp'), ('paper_bag', 'Paper Bag'), ('other', 'Other')], max_length=20)),
                ('paper_products_spent', models.FloatField(default=0.0)),
                ('paper_products_unit', models.CharField(default='USD', max_length=50)),
                ('waste_type', models.CharField(choices=[('construction_waste', 'Construction Waste'), ('electrical_waste', 'Electrical Waste'), ('food_organic_waste', 'Food and Organic Waste'), ('glass_waste', 'Glass Waste'), ('metal_waste', 'Metal Waste'), ('plastic_waste', 'Plastic Waste')], max_length=255)),
                ('waste_weight', models.FloatField(default=0.0)),
                ('waste_unit', models.CharField(default='kg', max_length=50)),
                ('water_supply_weight', models.FloatField(default=0.0)),
                ('water_supply_unit', models.CharField(default='kg', max_length=50)),
                ('water_treatment_volume', models.FloatField(default=0.0)),
                ('water_treatment_unit', models.CharField(default='l', max_length=50)),
                ('cloud_computing_unit', models.CharField(choices=[('hours', 'Hours'), ('days', 'Days'), ('months', 'Months'), ('years', 'Years')], default='hours', max_length=50)),
                ('cloud_computing_number', models.IntegerField(default=0)),
                ('cloud_computing_time', models.FloatField(default=0)),
                ('networking_data_transferred', models.FloatField(default=0)),
                ('networking_unit', models.CharField(choices=[('GB', 'Gigabytes'), ('TB', 'Terabytes'), ('PB', 'Petabytes')], default='GB', max_length=50)),
                ('personal_computing_time_spent', models.FloatField(default=0)),
                ('personal_computing_unit', models.CharField(choices=[('hours', 'Hours'), ('days', 'Days'), ('months', 'Months'), ('years', 'Years')], default='hours', max_length=50)),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'db_table': 'env_data',
                'ordering': ['-date_entered'],
            },
        ),
    ]
