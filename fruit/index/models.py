from django.db import models

# Create your models here.

class Users(models.Model):
	'''用户表'''
	uphone = models.CharField(max_length=20,verbose_name='电话号码')
	upwd = models.CharField(max_length=200,verbose_name='密码')
	uemail = models.EmailField(verbose_name='邮箱')
	uname = models.CharField(max_length=20,null=True,verbose_name='用户名')
	isActive = models.BooleanField(default=True,verbose_name='是否激活')

	def __str__(self):
		return self.uphone

	class Meta:
		db_table = "user"
		verbose_name = '用户表'
		verbose_name_plural = verbose_name
		ordering = ["-uphone"]

class GoodsType(models.Model):
	'''商品类型'''
	title = models.CharField(max_length=50,verbose_name='类型名称')
	#商品类型图片
	picture = models.ImageField(upload_to='static/upload/goodsType',null=True,verbose_name='类型图片')
	#商品类型描述
	desc = models.TextField(verbose_name='商品描述')

	def __str__(self):
		return self.title

	def to_dict(self):
		dic = {
			'title':self.title,
			#<ImageFieldFile: static/upload/goodsType/t4.png> is not JSON serializable
			#ImageFieldFile.不能序列化，需要转化为字符串
			'picture':self.picture.__str__(),
			'desc':self.desc
		}
		return dic

	class Meta:
		db_table = 'GoodsType'
		verbose_name = '商品类型'
		verbose_name_plural = verbose_name

class Goods(models.Model):
	'''商品'''
	title = models.CharField(max_length=50,verbose_name='商品名称')
	price = models.DecimalField(max_digits=7,decimal_places=2,verbose_name='商品价格')
	#商品规格
	spec = models.CharField(max_length=30,verbose_name="规格")
	#如果null=True，只要修改一个字段就需要上传图片
	picture = models.ImageField(upload_to='static/upload/goods',null=True,verbose_name='商品图片')
	goodsType = models.ForeignKey(GoodsType,verbose_name='商品类型')
	isActive = models.BooleanField(default=True,verbose_name='是否上架')
	def __str__(self):
		return self.title
	class Meta:
		db_table ='Goods'
		verbose_name='商品'
		verbose_name_plural=verbose_name

class CartInfo(models.Model):
	'''购物车'''
	users = models.ForeignKey(Users,db_column='user_id',verbose_name='用户')
	goods = models.ForeignKey(Goods,db_column='goods_id',verbose_name='商品')
	count = models.IntegerField(verbose_name='购买数量')
	def __str__(self):
		return self.count
	class Meta:
		db_table="CartInfo"
		verbose_name='购物车'
		verbose_name_plural=verbose_name

class Address(models.Model):
	'''收货地址'''
	user = models.ForeignKey(Users,on_delete=models.CASCADE)
	address = models.CharField('地址',max_length=200)
	aname = models.CharField('收货人姓名',max_length=20)
	aphone = models.CharField('收货人电话',max_length=20)

	def __str__(self):
		return self.aname

	def get_absolute_url(self):
		return '???'

	class Meta():
		db_table = 'address'

ORDERSTATUS = (
	(1,'未支付'),
	(2,'已支付'),
	(3,'已取消'),
	(4,'已完成'),
)
class Order(models.Model):
	'''订单表'''
	user = models.ForeignKey(Users)
	orderNo = models.CharField('订单号',max_length=50,null=False)
	cals = models.TextField('订单商品描述')
	orderStatus = models.IntegerField('订单状态', choices=ORDERSTATUS, default=1)

	def __str__(self):
		return self.orderNo




