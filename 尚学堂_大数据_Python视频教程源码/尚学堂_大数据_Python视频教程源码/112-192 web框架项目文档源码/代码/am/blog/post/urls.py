from  django.conf.urls import url
from post import views
urlpatterns=[
    url(r'^$',views.index),
    url(r'category/(\d+)',views.handle_category)
]
