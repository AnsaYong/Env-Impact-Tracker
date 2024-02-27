from django.db import models

# Create your models here.
from django.contrib.auth.models import AbstractUser
from django.utils.translation import gettext_lazy as _


class User(AbstractUser):
    """Model to create a custom user to store user info.
    Extends AbstractUser. Everything from class Meta is to avoid a
    clash in reverse accessor names (groups and user_permissions)
    between the custom user model (User) and the default Django
    user model (auth.User)
    """
    pass

    class Meta:
        db_table = 'custom_user'

    # Specify unique related names for the groups and user_permissions fields
    groups = models.ManyToManyField(
        'auth.Group',
        related_name='custom_user_groups',
        blank=True,
        verbose_name=_('groups'),
        help_text=_(
            'The groups this user belongs to. A user will get all permissions '
            'granted to each of their groups.'
        ),
    )
    user_permissions = models.ManyToManyField(
        'auth.Permission',
        related_name='custom_user_permissions',
        blank=True,
        verbose_name=_('user permissions'),
        help_text=_('Specific permissions for this user.'),
    )

class EnvironmentalData(models.Model):
    """A model to create environmental data. Inherits from and extends Model"""
    #user = models.ForeignKey(User, on_delete=models.CASCADE)    # Links user
    data_type = models.CharField(max_length=255)                # Type of env data
    value = models.FloatField()                                 # Value of env data
    timestamp = models.DateTimeField(auto_now_add=True)         # Time added

class Recommendations(models.Model):
    """A model to create recommendations based on environmental data"""
    #user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='recommendations')    # Links user
    data = models.ForeignKey(EnvironmentalData, on_delete=models.CASCADE) # Links env data
    recommendation_text = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)        # Time created

class GeoLocation(models.Model):
    """A model to create the geolocation data of users"""
    #user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='geolocations')    # Links user
    latitude = models.FloatField()                              # User's loc
    longitude = models.FloatField()                             # User's loc
    city = models.CharField(max_length=255)                     # User's loc
    country = models.CharField(max_length=255)                  # User's loc
    zipcode = models.CharField(max_length=10)                   # User's loc
