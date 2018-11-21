from  django.conf.urls import url
from  cachedemo import views
urlpatterns=[
    url(r'^$',views.index_view)
]