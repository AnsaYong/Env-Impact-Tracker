from django.test import TestCase
from django.contrib.auth.models import Permission, Group
from .models import User, EnvironmentalData, Recommendations, GeoLocation
from django.test import SimpleTestCase
from django.urls import reverse

######## Tests for models ########
class UserModelTestCase(TestCase):
    """Test cases for the User model."""
    
    #def setUp(self):
     #   """Set up a test user."""
     #   self.user = User.objects.create(username='testuser')
    
    def setUp(self):
        # Create a user
        self.user = User.objects.create_user(
            username='testuser',
            email='test@example.com',
            password='testpassword'
        )

        # Create a group
        self.group = Group.objects.create(name='Test Group')

        # Create a permission
        self.permission = Permission.objects.create(
            codename='test_permission',
            name='Test Permission',
            content_type_id=1  # Replace with the correct content type ID
        )

    def test_user_creation(self):
        """Test user creation."""
        self.assertEqual(self.user.username, 'testuser')

    def test_user_groups(self):
        """Test adding and retrieving groups for a user."""
        group = self.user.groups.create(name='TestGroup')
        self.assertIn(group, self.user.groups.all())

    def test_user_deletion_cascade_groups(self):
        """Test cascading deletion of user's groups."""
        group = self.user.groups.create(name='TestGroup')
        self.user.delete()
        self.assertFalse(User.objects.filter(groups=group).exists())

class EnvironmentalDataModelTestCase(TestCase):
    """Test cases for the EnvironmentalData model."""
    
    def setUp(self):
        """Set up a test EnvironmentalData instance."""
        self.data = EnvironmentalData.objects.create(data_type='TestType', value=42.0)

    def test_data_creation(self):
        """Test EnvironmentalData creation."""
        self.assertEqual(self.data.data_type, 'TestType')
        self.assertEqual(self.data.value, 42.0)

    def test_data_timestamp_auto_add(self):
        """Test that timestamp is automatically added."""
        self.assertIsNotNone(self.data.timestamp)

class RecommendationsModelTestCase(TestCase):
    """Test cases for the Recommendations model."""
    
    def setUp(self):
        """Set up a test Recommendations instance."""
        self.data = EnvironmentalData.objects.create(data_type='TestType', value=42.0)
        self.recommendation = Recommendations.objects.create(data=self.data, recommendation_text='Test recommendation')

    def test_recommendation_creation(self):
        """Test Recommendations creation."""
        self.assertEqual(self.recommendation.data, self.data)
        self.assertEqual(self.recommendation.recommendation_text, 'Test recommendation')

class GeoLocationModelTestCase(TestCase):
    """Test cases for the GeoLocation model."""
    
    def setUp(self):
        """Set up a test GeoLocation instance."""
        self.location = GeoLocation.objects.create(latitude=0.0, longitude=0.0, city='TestCity', country='TestCountry', zipcode='12345')

    def test_location_creation(self):
        """Test GeoLocation creation."""
        self.assertEqual(self.location.latitude, 0.0)
        self.assertEqual(self.location.longitude, 0.0)
        self.assertEqual(self.location.city, 'TestCity')
        self.assertEqual(self.location.country, 'TestCountry')
        self.assertEqual(self.location.zipcode, '12345')


######## Tests for home and about pages ########
