from django.contrib import admin

# Register your models here.
from .models import User, EnvironmentalData, Recommendations, GeoLocation

admin.site.register(User)
admin.site.register(EnvironmentalData)
admin.site.register(Recommendations)
admin.site.register(GeoLocation)