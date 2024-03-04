# Generated by Django 5.0.2 on 2024-02-29 09:56

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='EnergyConsumption',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('source', models.CharField(max_length=255)),
                ('amount_used', models.FloatField()),
            ],
        ),
        migrations.CreateModel(
            name='FoodConsumption',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('dietary_choices', models.TextField()),
            ],
        ),
        migrations.CreateModel(
            name='Housing',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('home_size', models.FloatField()),
                ('energy_efficiency', models.BooleanField()),
                ('heating_method', models.CharField(max_length=255)),
                ('cooling_method', models.CharField(max_length=255)),
            ],
        ),
        migrations.CreateModel(
            name='ShoppingHabits',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('purchasing_decisions', models.TextField()),
            ],
        ),
        migrations.CreateModel(
            name='Transportation',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('mode', models.CharField(max_length=255)),
            ],
        ),
        migrations.CreateModel(
            name='WasteGeneration',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('amount_produced', models.FloatField()),
                ('recycling_habits', models.BooleanField()),
                ('composting_habits', models.BooleanField()),
            ],
        ),
        migrations.CreateModel(
            name='WaterUsage',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('consumption', models.FloatField()),
            ],
        ),
    ]
