from django.urls import path
from . import views

urlpatterns = [
    path('user_env_data/', views.UserDataRetrievalView.as_view(), name='user_data'),
]