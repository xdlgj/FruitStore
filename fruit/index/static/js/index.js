/**
 * Created by tarena on 18-8-24.
 *
 */
function loadGoods(){
    /**
	 * 加载所有的商品分类以及对应的商品
     */
	$.get('/type_goods/',function(data){
		var html = "";
		//循环遍历data，得到类别以及对应的商品json
		$.each(data,function (i,dic) {
			html+="<div class='item'>";
			//取出type所对应的值
			var type = dic.type;
			//将出去的数据转换为json对象
			var typeObj = JSON.parse(type);
				html+='<p class="title">';
					html+='<a href="#">更多</a>';
					html+="<img src='/"+typeObj.picture+"'>";
				html+='</p>';
				html+="<ul>";
			//获取商品列表，并转化为json对象
			var g_listObj = JSON.parse(dic.goods);
			//循环遍历商品列表,获取单个商品对象(good)，并判断i+1是否为5的倍数，如果是则给li添加一个类选择器<li class="no-margin">
			$.each(g_listObj,function(i,good){
				//console.log(good.fields.picture)
				if ((i+1)%5==0){
					html+="<li class='no-margin'>";
				}else {
					html+="<li>"
				}
						html+="<p>";
							html+="<img src='/"+ good.fields.picture +"'>"
						html+="</p>";
						html+="<div class='content'>";

							html+="<a href='javascript:add_cart("+ good.pk +")' class='cart'>";
								//加载购物车标记
								html+="<img src='/static/images/cart.png' title='添加购物车'>";
							html+="</a>";
							html+="<p>"+good.fields.title+"</p>";

							html+="<span>&yen"+ good.fields.price+ "/"+ good.fields.spec +"</span>";
						html+="</div>"
					html+="</li>";
			});
				html+="</ul>";

			html+="</div>"

        });
		$("#main").html(html)
	},'json')
	//console.log("异步请求发送成功")
}
/**
 * 将指定的商品添加至购物车
 * 参数：good_id,表示的是要加入购物车的商品id
 */
function add_cart(good_id){
	$.get('/add_cart/', 'good_id='+good_id,
		function(data){
			if(data.status == 1){
				alert(data.text)
				//加载当前用户购物车内商品的数量
				load_count()
			}else if(data.status == 0){
				//用户还没有登录
				alert(data.text)
				//自动跳转至登录页面
				location.href = '/login/';

			}else {
				alert('添加失败')
			}
		},
		'json'
	)
}
/**
 * 加载当前用户的购物车数量
 */
function load_count(){
	$.get('/cart_count/',function(data){
		var total_count = 0;
		$.each(data.count_list,function(i,count){
			total_count +=count
		})
		$('#myCart>a').html('我的购物车('+ total_count +')<img src="/static/images/cart.png" title="查看购物车">');
	},'json');

}
$(function(event){
	/*$("#banner").unslider();此函数或给ul和li添加相应的样式*/
	/*
	*轮播图的实现
	 */
	var $unslider04 = $('#banner').unslider({
		dots:true/*是否显示指示器(图片上面的小圆点)，取值true / false*/
	});
	data04 = $unslider04.data('unslider');
    //console.log(data04)
    $('.unslider-arrow04').click(function() {
    	console.log(this.className)
        var fn = this.className.split(' ')[1];
        data04[fn]();
    });
	//加载所有类别以及所有商品
    loadGoods()
	//加载当前用户购物车内商品的数量
	load_count()

})