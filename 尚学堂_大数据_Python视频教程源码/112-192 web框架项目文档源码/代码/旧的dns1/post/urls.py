from  django.conf.urls import url
from  post import views
urlpatterns=[
    #abccd

    url(r'^page/(\d+)$',views.index),
    url(r'^page/$',views.index,kwargs={'num':'10'}),
    url(r'^archive/(\d{4})/(\d{1,2})/(\d{1,2})',views.get_archive),
    url(r'^category/(?P<categoryId>\d+)',views.get_post_by_category),
]