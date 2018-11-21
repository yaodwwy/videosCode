from  django.conf.urls import url
from  User import views
urlpatterns=[
    url(r'^register.html/$',views.register_view),
    url(r'^register/$',views.register_control),
    url(r'^user.html/$',views.user_view),
    url(r'^login.html/$',views.login_view),
    url(r'^login/$',views.login_control),
]