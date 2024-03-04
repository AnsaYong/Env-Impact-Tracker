from django.urls import path
from . import views


urlpatterns = [
    path('', views.LandingView.as_view(), name="landing"),
    #path('', views.IndexView.as_view(), name="page"),
    #path('add-expense/', views.AddExpenseView.as_view(), name="add-expense"),
]