from django.shortcuts import render
from django.shortcuts import redirect
from django.contrib.auth import authenticate,login,logout
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from .forms import SelectFoodForm,AddFoodForm,CreateUserForm,ProfileForm
from .models import *
from datetime import timedelta
from django.utils import timezone
from datetime import date
from datetime import datetime
from .filters import FoodFilter
@login_required(login_url='login')
def HomePageView(request):
	calories = Profile.objects.filter(person_of=request.user).last()
	calorie_goal = calories.calorie_goal
	if date.today() > calories.date:
		profile=Profile.objects.create(person_of=request.user)
		profile.save()
	calories = Profile.objects.filter(person_of=request.user).last()
	all_food_today=PostFood.objects.filter(profile=calories)
	calorie_goal_status = calorie_goal -calories.total_calorie
	over_calorie = 0
	if calorie_goal_status < 0 :
		over_calorie = abs(calorie_goal_status)
	context = {
	'total_calorie':calories.total_calorie,
	'calorie_goal':calorie_goal,
	'calorie_goal_status':calorie_goal_status,
	'over_calorie' : over_calorie,
	'food_selected_today':all_food_today
	}
	return render(request, 'home.html',context)
def RegisterPage(request):
	if request.user.is_authenticated:
		return redirect('home')
	else:
		form = CreateUserForm()
		if request.method == 'POST':
			form = CreateUserForm(request.POST)
			if form.is_valid():
				form.save()
				user = form.cleaned_data.get('username')
				messages.success(request,"Account was created for "+ user)
				return redirect('login')
		context = {'form':form}
		return render(request,'register.html',context)
def LoginPage(request):
	if request.user.is_authenticated:
		return redirect('home')
	else:
		if request.method == 'POST':
			username = request.POST.get('username')
			password = request.POST.get('password')
			user = authenticate(request,username=username,password=password)
			if user is not None:
				login(request,user)
				return redirect('home')
			else:
				messages.info(request,'Username or password is incorrect')
		context = {}
		return render(request,'login.html',context)
def LogOutPage(request):
	logout(request)
	return redirect('login')
@login_required
def select_food(request):
	person = Profile.objects.filter(person_of=request.user).last()
	food_items = Food.objects.filter(person_of=request.user)
	form = SelectFoodForm(request.user,instance=person)
	if request.method == 'POST':
		form = SelectFoodForm(request.user,request.POST,instance=person)
		if form.is_valid():	
			form.save()
			return redirect('home')
	else:
		form = SelectFoodForm(request.user)
	context = {'form':form,'food_items':food_items}
	return render(request, 'sel_food.html',context)
def add_food(request):
	food_items = Food.objects.filter(person_of=request.user)
	form = AddFoodForm(request.POST) 
	if request.method == 'POST':
		form = AddFoodForm(request.POST)
		if form.is_valid():
			profile = form.save(commit=False)
			profile.person_of = request.user
			profile.save()
			return redirect('addfood')
	else:
		form = AddFoodForm()
	myFilter = FoodFilter(request.GET,queryset=food_items)
	food_items = myFilter.qs
	context = {'form':form,'food_items':food_items,'myFilter':myFilter}
	return render(request,'addfood.html',context)
@login_required
def update_food(request,pk):
	food_items = Food.objects.filter(person_of=request.user)
	food_item = Food.objects.get(id=pk)
	form =  AddFoodForm(instance=food_item)
	if request.method == 'POST':
		form = AddFoodForm(request.POST,instance=food_item)
		if form.is_valid():
			form.save()
			return redirect('profile')
	myFilter = FoodFilter(request.GET,queryset=food_items)
	context = {'form':form,'food_items':food_items,'myFilter':myFilter}

	return render(request,'addfood.html',context)
@login_required
def delete_food(request,pk):
	food_item = Food.objects.get(id=pk)
	if request.method == "POST":
		food_item.delete()
		return redirect('profile')
	context = {'food':food_item,}
	return render(request,'delfood.html',context)
@login_required
def ProfilePage(request):
	person = Profile.objects.filter(person_of=request.user).last()
	food_items = Food.objects.filter(person_of=request.user)
	form = ProfileForm(instance=person)
	if request.method == 'POST':
		form = ProfileForm(request.POST,instance=person)
		if form.is_valid():	
			form.save()
			return redirect('profile')
	else:
		form = ProfileForm(instance=person)
	some_day_last_week = timezone.now().date() -timedelta(days=7)
	records=Profile.objects.filter(date__gte=some_day_last_week,date__lt=timezone.now().date(),person_of=request.user)
	context = {'form':form,'food_items':food_items,'records':records}
	return render(request, 'profile.html',context)