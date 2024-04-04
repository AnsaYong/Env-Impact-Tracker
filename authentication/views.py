from django.shortcuts import render, redirect
from django.views import View
import json
from django.http import JsonResponse
from django.contrib.auth.models import User
from validate_email import validate_email
from django.contrib import messages
from django.contrib.auth import logout, login, authenticate
from django.http import HttpResponse


from django.contrib.auth import authenticate, login

class RegistrationView(View):
    """
    View for handling user registration.

    Methods:
    - get(self, request): Renders the registration page.
    - post(self, request): Handles the registration form submission.
    """

    def get(self, request):
        """
        Renders the registration page.

        Args:
        - request: The HTTP request object.

        Returns:
        - HttpResponse: The rendered registration page.
        """
        return render(request, 'authentication/register.html')
    
    def post(self, request):
        """
        Handles the registration form submission.

        Args:
        - request: The HTTP request object.

        Returns:
        - HttpResponse: Redirects to 'data_collection' if registration is successful,
                        otherwise renders the registration page with appropriate error messages.
        """
        username = request.POST['username']
        email = request.POST['email']
        password = request.POST['password']

        context = {
            'fieldValues': request.POST
        }

        if not User.objects.filter(username=username).exists():
            if not User.objects.filter(email=email).exists():

                if len(password) < 6:
                    messages.error(request, 'Password too short')
                    return render(request, 'authentication/register.html', context)
                
                # Create user account
                user = User.objects.create_user(username=username, email=email)
                user.set_password(password)
                user.save()

                messages.success(request, 'Account successfully created')

                # Log in the user
                user = authenticate(username=username, password=password)
                if user:
                    login(request, user)
                    messages.success(request, 'You are now logged in.')
                    return redirect('data_collection')
                else:
                    messages.error(request, 'Failed to log in. Please try again.')
                    return redirect('login')
            else:
                messages.error(request, 'Email is already in use')
                return render(request, 'authentication/register.html')

        # Username already exists
        messages.error(request, 'Username is already taken')
        return render(request, 'authentication/register.html')


class EmailValidationView(View):
    """
    View for validating the email provided by the user.

    Methods:
    - post(self, request): Validates the email provided by the user and returns a JsonResponse.
    """

    def post(self, request):
        """
        Validates the email provided by the user and returns a JsonResponse.

        Args:
        - request: The HTTP request object containing the email to be validated.

        Returns:
        - JsonResponse: JSON response indicating the result of the email validation.
        """
        data = json.loads(request.body)
        email = data['email']
        # Check if email is valid
        if not validate_email(email):
            return JsonResponse({'email_error':'Email is invalid'}, status=400)
        # Check if email is taken
        if User.objects.filter(email=email).exists():
            return JsonResponse({'email_error':'Sorry email in use. Please choose another one'}, status=409)
        return JsonResponse({'email_valid': True})


class UsernameValidationView(View):
    """
    View for validating the username provided by the user.

    Methods:
    - post(self, request): Validates the username provided by the user and returns a JsonResponse.
    """

    def post(self, request):
        """
        Validates the username provided by the user and returns a JsonResponse.

        Args:
        - request: The HTTP request object containing the username to be validated.

        Returns:
        - JsonResponse: JSON response indicating the result of the username validation.
        """
        data = json.loads(request.body)
        username = data['username']
        # Check if username is valid
        if not str(username).isalnum():
            return JsonResponse({'username_error':'Username should only contain alphanumeric characters'}, status=400)
        # Check if username is taken
        if User.objects.filter(username=username).exists():
            return JsonResponse({'username_error':'Sorry username in use. Please choose another one'}, status=409)
        return JsonResponse({'username_valid': True})


class LoginView(View):
    """
    View for handling user login. If login is successfull, the user is redirected to
    the data collection page.

    Methods:
    - get(self, request): Renders the login page.
    - post(self, request): Handles the login form submission.
    """

    def get(self, request):
        """
        Renders the login page.

        Args:
        - request: The HTTP request object.

        Returns:
        - HttpResponse: The rendered login page.
        """
        return render(request, 'authentication/login.html')

    def post(self, request):
        """
        Handles the login form submission.

        Args:
        - request: The HTTP request object.

        Returns:
        - HttpResponse: Redirects to 'data_collection' if login is successful,
                        otherwise renders the login page with an error message.
        """
        username = request.POST['username']
        password = request.POST['password']

        # Validate user data
        if username and password:
            user = authenticate(username=username, password=password)
            if user:
                login(request, user)
                messages.success(request, 'Welcome, ' + username + '. You are now logged in.')
                return redirect('data_collection')
        messages.error(request, 'Invalid login credentials')
        return render(request, 'authentication/login.html', {'error_message': 'Invalid login'})


class LogoutView(View):
    """
    View for handling user logout.

    Methods:
    - get(self, request): Logs out the user and redirects to the landing page.
    """

    def get(self, request):
        """
        Logs out the user and redirects to the landing page.

        Args:
        - request: The HTTP request object.

        Returns:
        - HttpResponseRedirect: Redirects to the landing page.
        """
        logout(request)
        messages.success(request, 'You have been logged out successfully.')
        # Redirect to the landing page after logout
        return redirect('landing')


class DashboardView(View):
    def get(self, request):
        # Check if the user is new (registered in the current session)
        new_user_username = request.session.get('new_user_username')
        new_user_email = request.session.get('new_user_email')

        if new_user_username and new_user_email:
            # Check if the user exists in the database
            if User.objects.filter(username=new_user_username, email=new_user_email).exists():
                # Use the newly created user's information
                user = User.objects.get(username=new_user_username, email=new_user_email)
            else:
                # User not found in the database, handle this case accordingly
                return HttpResponse("User not found in the database.")
        else:
            # Use the authenticated user
            user = request.user

        return render(request, 'pages/dashboard.html')
    