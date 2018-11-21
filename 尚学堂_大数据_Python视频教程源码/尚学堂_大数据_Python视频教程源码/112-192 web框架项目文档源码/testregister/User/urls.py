from  django.conf.urls import url
from  User import views
urlpatterns =[
    url(r'^$',views.register_view),
    url(r'^register/$',views.register),
    url(r'^online/$',views.online_view),
    url(r'^upload/$',views.upload),
    url(r'^upload_file/$',views.upload_view),
    url(r'^show/cookies$',views.get_cookies),
    url(r'^write/cookies$',views.write_cookies),
    url(r'^show/goods',views.goods),
    url(r'^write/goods/cookies/',views.write_goods_cookies),
]