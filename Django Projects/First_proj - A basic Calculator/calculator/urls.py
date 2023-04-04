from django.urls import path
from . import views
urlpatterns= [ 
    path('',views.index, name='index'),
    path('eq_res_pst',views.eq_res_pst,name='eq'),
    path('delete',views.delete,name='delete'),
    path('erase',views.erase,name='erase'),
    path('input',views.input,name='input'),
    path('fin_val',views.fin_val,name='fin_val')]