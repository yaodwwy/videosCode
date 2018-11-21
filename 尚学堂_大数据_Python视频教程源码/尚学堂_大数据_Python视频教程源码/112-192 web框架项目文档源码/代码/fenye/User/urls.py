from  django.conf.urls import url
from User import views
urlpatterns=[
    url(r'^$',views.index_view),
    url(r'^usercenter/$',views.user_center_view),
]