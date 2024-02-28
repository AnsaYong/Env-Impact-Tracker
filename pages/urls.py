from django.urls import path
from . import views


urlpatterns = [
    path('about/', views.AboutPageView.as_view(), name='about'),
    path('', views.HomePageView.as_view(), name='home'),
    path('api/user', views.UserAPIView.as_view(), name='user_api'),
    path('api/environmental_data', views.EnvironmentalDataAPIView.as_view(), name='environmental_data_api'),
    path('api/recommendations', views.RecommendationsAPIView.as_view(), name='recommendations_api'),
]