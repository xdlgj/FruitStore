from django.conf.urls import url
from .views import *

urlpatterns = [
	url(r'^$',index_views,name='index'),
	url(r'^login/$',login_views, name='login'),
	url(r'^register/$',register_views, name='register'),
	url(r'^logout/$',logout_views),
	url(r'^cart/$',cart_views),

]

urlpatterns +=[
	#验证手机号码是否已经存在
	url(r'^check_uphone/$',check_uphone_views),
	#验证用户名是否已经存在
	url(r'^check_uname/$',check_uname_views),
	#动态加载商品
	url(r'^type_goods/$',type_goods_views),
	#向购物车添加商品
	url(r'^add_cart/$',add_cart_views),
	#查看购物侧
	url(r'^cart_count/$',cart_count_views),
	#删除购物车中的商品
	url(r'^del_good_incart/$',del_good_incart_views)
]