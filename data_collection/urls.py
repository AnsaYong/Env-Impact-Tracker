from django.urls import path
from . import views


urlpatterns = [
    path('', views.IndexView.as_view(), name='data_collection'),
    path('env_data', views.EnvDataView.as_view(), name='env_data'),
    path('user_data/<int:environment_data_id>/', views.UserDataRetrievalView.as_view(), name='user_data'),
    path('analytics', views.AnalyticsView.as_view(), name='analytics'),
]