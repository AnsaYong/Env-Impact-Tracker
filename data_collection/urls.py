from django.urls import path
from . import views


urlpatterns = [
    path('', views.IndexView.as_view(), name='data_collection'),
    path('env_data', views.EnvDataView.as_view(), name='env_data'),
    path('user_data/<int:environment_data_id>/', views.UserDataRetrievalView.as_view(), name='user_data'),  # api
    path('display_data/<int:environment_data_id>/', views.DataDisplayView.as_view(), name='display_data'),
    path('delete_data/<int:environment_data_id>/', views.DataDeletionView.as_view(), name='delete_data'),
    path('confirm_delete/<int:environment_data_id>/', views.DataDeletionView.as_view(), name='confirm_delete'),
    path('analytics', views.AnalyticsView.as_view(), name='analytics'),
    path('analytics_data/<int:user_id>/', views.AggregateDataRetrievalView.as_view(), name='analytics_data'),  # api
    path('projections', views.DataProjectionView.as_view(), name='projections'),
]