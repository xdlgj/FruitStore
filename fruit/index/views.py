
from django.contrib.auth.hashers import make_password, check_password
from django.core import serializers
from django.http import HttpResponse
from django.shortcuts import render,redirect,reverse

from .forms import *
from .models import *
import json
# Create your views here.

auth_check = 'MarcelArhut'


def index_views(request):
	'''首页'''
	# if 'uname' in request.COOKIES:
	# 	uname = json.loads(request.COOKIES['uname'])
	# elif 'uname' in request.session:
	# 	uname = request.session['uname']
	if 'uid' in request.session and 'uname' in request.session:
		uname = request.session['uname']
	elif 'uid' in  request.COOKIES and 'uname' in request.COOKIES:
		uname = json.loads(request.COOKIES['uname'])
		uid = request.COOKIES['uid']
		request.session['uid'] = uid
		request.session['uname'] = uname
	else:
		uname = None
	return render(request,'index.html',locals())


def login_views(requset):
	URL = '/'
	if requset.method =="GET":
		#判断是否存在session
		if 'uid' in requset.session and 'uname' in requset.session:
			#seeion中有值，重定向到首页或原路径
			return redirect(URL)
		else:
			#判断是cookie中是否有uid 和 uname
			if 'uid' in requset.COOKIES and 'uname' in requset.COOKIES:
				#从cookie中取出数据，保存在session中
				uid = requset.COOKIES['uid']
				uname = json.loads(requset.COOKIES['uname'])
				requset.session['uid'] = uid
				requset.session['uname'] = uname
				#重定向到首页或原路径
				return redirect(URL)
			else:
				#去往登录页面
				return render(requset,'login.html',locals())
	else:
		# 登录验证
		uphone = requset.POST["uphone"]
		upwd = requset.POST['upwd']
		try:
			find_user = Users.objects.get(uphone=uphone)
			if check_password(upwd, find_user.upwd):
				#登录成功
				uid = find_user.id
				uname = find_user.uname
				requset.session['uid'] = uid
				requset.session['uname'] = uname
				#判断是否有记住密码
				resp = redirect(URL)
				if 'isSaved' in requset.POST:
					#记住密码，保存进cookie
					uname = json.dumps(uname)#解决cookie中不能存储中文的问题
					expires = 60 * 60 * 24 * 336
					resp.set_cookie('uid',uid,expires)
					resp.set_cookie('uname',uname,expires)
				if 'errMsg' in requset.session:
					del requset.session['errMsg']
				return resp
			else:
				# 登录失败：回登陆
				requset.session['errMsg'] = "密码不正确"
				# errMsg = "用户名或密码不正确"
				return redirect(reverse('login'))
		except Exception:
			#登录失败：回登陆
			requset.session['errMsg'] = "用户名不存在"
			#errMsg = "用户名或密码不正确"
			return redirect(reverse('login'))


def register_views(requset):
	if requset.method == "GET":
		#如果是get请求则返回注册页面
		return render(requset,'register.html')
	else:
		#实现注册功能
		uname = requset.POST["uname"].strip()
		dic = {
			'uphone': requset.POST['uphone'].strip(),
			'upwd': make_password(requset.POST['upwd'].strip(), auth_check, 'pbkdf2_sha1'),
			'uemail': requset.POST["uemail"].strip(),
			'uname': uname
		}
		user = Users(**dic)
		user.save()

		uid = Users.objects.get(uname = uname).id
		requset.session['uid'] = uid
		requset.session['uname'] = uname
		#通过url反向解析出
		#print(reverse("index"))# /
		return redirect(reverse("index"))


def check_uphone_views(request):
	'''验证手机号码是否已经存在'''
	if request.method=='POST':
		uphone = request.POST['uphone']
		uList = Users.objects.filter(uphone=uphone)
		if uList:
			#如果条件为真，则表示手机号码已经存在
			#响应status值为0，表示手机号码已经存在
			dic = {
				'status':'0',
				'text':'手机号码已经存在'
			}
			return HttpResponse(json.dumps(dic))
		else:
			dic = {
				'status':'1',
				'text':'可以注册'
			}
			return  HttpResponse(json.dumps(dic))


def check_uname_views(request):
	'''验证用户名是否已经存在'''
	if request.method=='POST':
		uname = request.POST['uname']
		uList = Users.objects.filter(uname=uname)
		if uList:
			#如果条件为真，则表示用户名已经存在
			#响应status值为0，表示手机号码已经存在
			dic = {
				'status':'0',
				'text':'用户名已经存在'
			}
			return HttpResponse(json.dumps(dic))
		else:
			dic = {
				'status':'1',
				'text':'可以注册'
			}
			return  HttpResponse(json.dumps(dic))


def logout_views(request):
	'''注销'''
	#获取请求原地址，如果没有，则返回/(首页)，在地址栏输入logout时没有原地址
	url = request.META.get("HTTP_REFERER",'/')
	resp = redirect(url)
	if 'uid' in request.session and 'uname' in request.session:
		del request.session["uid"]
		del request.session['uname']
	if 'uid' in request.COOKIES and 'uname' in request.COOKIES:
		resp.delete_cookie('uid')
		resp.delete_cookie('uname')
	return resp


def type_goods_views(request):
	'''查询出所有的商品类型以及每一个类型下的前10个商品'''
	all_list = []
	#查询所有的商品类型
	goodsType = GoodsType.objects.all()
	#循环遍历商品类型，并查询每个类型对应的商品
	for type in goodsType:
		#将单个对象转换为json对象，需要在modles中定义to_dict()方法
		type_json = json.dumps(type.to_dict())
		#反向查询通过1来查询多,type表示商品类型，goods表示所有的商品
		g_lsit = type.goods_set.order_by('-id')[0:10]
		#将Querset转化为json对象
		g_lsit_json = serializers.serialize('json',g_lsit)

		dic = {'type':type_json,'goods':g_lsit_json}
		all_list.append(dic)
	jsonStr = json.dumps(all_list)
	return HttpResponse(jsonStr)


def add_cart_views(request):
	'''向购物车添加商品，首先要判断用户是否已经登录（判断session）'''
	if 'uid' in request.session and 'uname' in request.session:
		#接收数据
		user_id = request.session['uid']
		good_id = request.GET['good_id']
		#接收购买数量，如果没有的话，则默认为1
		count = request.GET.get('count',1)
		#查看购物车中是否有相同用户购买过相同商品，如果有则更新数量，如果没有则插入数据
		cart_list = CartInfo.objects.filter(users_id=user_id,goods_id=good_id)
		if cart_list:
			#已经有商品，更新购买数量
			cart_info = cart_list[0]
			#判断是在首页添加购物车，还是在购物车页面修改商品数量
			if request.GET.get('count'):#在购物车页面修改
				cart_info.count = int(count)
				print('在购物车页面修改')
			else:#在首页添加购物车
				cart_info.count = cart_info.count + int(count)
			cart_info.save()
			dic = {
				'status':'1',
				'text':'更新数据成功',
			}
			return HttpResponse(json.dumps(dic))
		else:
			#没有商品，则创建商品并保存如数据库
			cart_info = CartInfo()
			cart_info.users_id = user_id
			cart_info.goods_id = good_id
			cart_info.count = int(count)
			cart_info.save()
			dic = {
				'status':'1',
				'text':'添加商品至购物车'
			}
			return HttpResponse(json.dumps(dic))
	else:
		dic = {
			'status':'0',
			'text':'你还没有登录！'
		}
		return HttpResponse(json.dumps(dic))

def del_good_incart_views(requset):
	'''删除购物车中的商品，首先要判断用户是否已经登录（判断session）'''
	if 'uid' in requset.session and 'uname' in requset.session:
		#接收数据
		user_id = requset.session['uid']
		good_id = requset.GET['good_id']
		cart_list = CartInfo.objects.filter(users_id=user_id, goods_id=good_id)
		if cart_list:
			cart_list.delete()
			dic = {
				'status': '1',
				'text': '删除成功！'
			}
			return HttpResponse(json.dumps(dic))
	else:
		dic = {
			'status':'0',
			'text':'你还没有登录！'
		}
		return HttpResponse(json.dumps(dic))



def update_cart_count_views(request):
	'''修改购物车数量，首先要判断用户是否已经登录（判断session）'''
	if 'uid' in request.session and 'uname' in request.session:
		# 接收数据
		user_id = request.session['uid']
		good_id = request.GET['good_id']

		# 接收购买数量，如果没有的话，则默认为1
		count = request.GET.get('count', 1)
		# 查看购物车中是否有相同用户购买过相同商品，如果有则更新数量，如果没有则插入数据
		cart_list = CartInfo.objects.filter(users_id=user_id, goods_id=good_id)
		if cart_list:
			# 已经有商品，跟新购买数量
			cart_info = cart_list[0]
			cart_info.count = cart_info.count + int(count)
			cart_info.save()
			dic = {
				'status': '1',
				'text': '更新数据成功',
			}
			return HttpResponse(json.dumps(dic))
		else:
			# 没有商品，则创建商品并保存如数据库
			cart_info = CartInfo()
			cart_info.users_id = user_id
			cart_info.goods_id = good_id
			cart_info.count = int(count)
			cart_info.save()
			dic = {
				'status': '1',
				'text': '添加商品至购物车'
			}
			return HttpResponse(json.dumps(dic))
	else:
		dic = {
			'status': '0',
			'text': '你还没有登录！'
		}
		return HttpResponse(json.dumps(dic))


def cart_count_views(request):
	'''查询某用户购物车内的商品数量'''
	if 'uid' not in request.session:
		dic={
			'count':0
		}
		return HttpResponse(json.dumps(dic))
	else:
		uid = request.session['uid']
		all_cart = CartInfo.objects.filter(users_id=uid)
		count_list = []
		# 创建一个列表，保存购物车中的商品对象
		cart_good_list = []
		for cart in all_cart:
			#获取每种商品购买的数量
			count_list.append(cart.count)
			#获取购买商品的对象
			cart_good = cart.goods
			cart_good_list.append(cart_good)
		dic ={
			"count_list":count_list,
			"cart_good_list": serializers.serialize('json',cart_good_list)
		}
		return HttpResponse(json.dumps(dic))


def cart_views(request):
	'''购物车'''
	if 'uid' in request.session and 'uname' in request.session:
		uname = request.session['uname']
	elif 'uid' in  request.COOKIES and 'uname' in request.COOKIES:
		uname = json.loads(request.COOKIES['uname'])
		uid = request.COOKIES['uid']
		request.session['uid'] = uid
		request.session['uname'] = uname
	else:
		uname = None
	return render(request,'cart.html',locals())