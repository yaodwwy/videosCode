from  django.conf.urls import url
from  render import views
urlpatterns=[
    url(r'^$',views.index_view)
]