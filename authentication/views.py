from django.shortcuts import render, redirect
from django.views import View
import json
from django.http import JsonResponse
from django.contrib.auth.models import User
from validate_email import validate_email
from django.contrib import messages
from django.contrib.auth import logout, login, authenticate
from impact.views import UserDataRetrievalView
from django.http import HttpResponse


class EmailValidationView(View):
    """Provides a method that validates the email provided by the user"""
    def post(self, request):
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
    """Provides a method that validates the username provided by the user"""
    def post(self, request):
        data = json.loads(request.body)
        username = data['username']
        # Check if username is valid
        if not str(username).isalnum():
            return JsonResponse({'username_error':'Username should only contain alphanumeric characters'}, status=400)
        # Check if username is taken
        if User.objects.filter(username=username).exists():
            return JsonResponse({'username_error':'Sorry username in use. Please choose another one'}, status=409)
        return JsonResponse({'username_valid': True})

class RegistrationView(View):
    def get(self, request):
        return render(request, 'authentication/register.html')
    
    def post(self, request):
        # Get user data
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

                # Store user data in the session
                request.session['new_user_username'] = username
                request.session['new_user_email'] = email

                # Redirect to a page for environmental data input
                return redirect('energy_consumption')
            else:
                messages.error(request, 'Email is already in use')
                return render(request, 'authentication/register.html')

        # Validate user data
        
        # Create user account
        
        return render(request, 'authentication/register.html')

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

        # Get user data
        user_data_retrieval_view = UserDataRetrievalView(user)
        user_data = user_data_retrieval_view.store_user_data()  # Store user's data and retrieve it
        return render(request, 'pages/dashboard.html', {'user_data': user_data})
    

class LoginView(View):
    def get(self, request):
        return render(request, 'authentication/login.html')
    
    def post(self, request):
        username = request.POST['username']
        password = request.POST['password']

        # Validate user data
        if username and password:
            user = authenticate(username=username, password=password)
            if user:
                login(request, user)
                messages.success(request, 'Welcome, ' + username + ' you are now logged in')
                return redirect('dashboard')    # update this to redirect to the user's account
            messages.error(request, 'Invalid login credentials')
        return render(request, 'authentication/login.html', {'error_message': 'Invalid login'})
    
class LogoutView(View):
    def get(self, request):
        logout(request)
        messages.success(request, 'You have been logged out successfully.')
        # Redirect to the landing page after logout
        return redirect('landing')