from django.urls import re_path

from python_resources import views

urlpatterns = [
    re_path(r'^$', views.index, name='index'),
]
