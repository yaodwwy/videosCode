from  django.conf.urls import url
from  serssiondemo import views
urlpatterns=[
url(r'^testsession.html/$',views.testsession_view),
url(r'^testsession/$',views.testsession),
]