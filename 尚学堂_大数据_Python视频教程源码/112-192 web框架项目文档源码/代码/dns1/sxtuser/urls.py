from  django.conf.urls import url
from sxtuser import views
urlpatterns=[

    url(r'^$',views.login_view),
    url(r'^login/$',views.login),
]