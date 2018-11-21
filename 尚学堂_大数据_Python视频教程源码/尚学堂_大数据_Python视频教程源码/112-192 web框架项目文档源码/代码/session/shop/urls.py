from  django.conf.urls import url
from  shop import views
urlpatterns=[
    url(r'^$',views.goods_view),
    url(r'^addcart/$',views.add_cart),
    url(r'^cart.html/$',views.cart_view),
    url(r'^show/$',views.show_view),
]