from  django.conf.urls import url
from  myview import views
urlpatterns=[
    url(r'^$',views.MyView.as_view()),
    url(r'^center/$',views.center_view),
    url(r'^list/$',views.MyListView.as_view()),

]
# views.center_view(request)
# # views.MyView.as_view()(request)
# views.MyView.as_view()(request)