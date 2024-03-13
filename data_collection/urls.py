from django.urls import path
from . import views


urlpatterns = [
    path('', views.IndexView.as_view(), name='data_collection'),
    path('env_data', views.EnvDataView.as_view(), name='env_data'),
    path('user_data', views.UserDataRetrievalView.as_view(), name='user_data'),
]