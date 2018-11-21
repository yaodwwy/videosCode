from  django.conf.urls import url
from  User import views
urlpatterns=[
    url(r'^login.html/$',views.login_view),
    url(r'^login/$',views.login),
    url(r'^user.html/$',views.user_view),
    url(r'^logout/$',views.logout),
    url(r'^session.html/$',views.session_view),
    url(r'^clearsession/$',views.clearsession),
    url(r'^deletesession/$',views.deletesession),
]