from  django.conf.urls import url
from  testcache import views
urlpatterns=[
    url(r'^$',views.cache_view)
]