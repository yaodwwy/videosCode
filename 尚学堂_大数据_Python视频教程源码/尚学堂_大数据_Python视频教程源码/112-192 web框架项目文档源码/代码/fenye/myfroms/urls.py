from  django.conf.urls import url
from myfroms import views
urlpatterns=[
    url(r'^$',views.index_view)
]