from  django.conf.urls import url
from  cachemode import views
urlpatterns=[
    url(r'^$',views.index_view)
]