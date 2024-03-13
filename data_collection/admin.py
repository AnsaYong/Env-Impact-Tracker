from django.contrib import admin
from .models import EnvironmentData, CarbonFootprintData

admin.site.register(EnvironmentData)
admin.site.register(CarbonFootprintData)