from  django.conf.urls import url
from movie import views
urlpatterns=[
    url(r'^$',views.index),
    url(r'^page/(\d+)$',views.index),
]