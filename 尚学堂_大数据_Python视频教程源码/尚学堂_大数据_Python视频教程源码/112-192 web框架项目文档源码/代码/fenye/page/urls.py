from  django.conf.urls import url
from page import views
urlpatterns=[
    url(r'^$',views.post_list_view,name='post_list_view'),
    url(r'^page/(\d+)$',views.post_list_view,name='post_list_view')
]