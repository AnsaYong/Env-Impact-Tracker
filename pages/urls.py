from django.urls import path
from . import views


urlpatterns = [
    path('api/user', views.user_api, name='user_api'),
    path('api/environmental_data', views.environmental_data_api, name='environmental_data_api'),
    path('api/recommendations', views.recommendations_api, name='recommendations_api'),
]