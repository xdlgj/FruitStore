// /**
//  * Created by tarena on 18-8-3.
//  */

// $(function(){
//   //检查登录状态
//   check_login();
// });

/**
 * 异步向服务器发送请求，检查用户是否处于登录状态
 *
function check_login(){
  $.get('/check_login/',function(data){
    var html = "";
    if(data.loginStatus == 0){
      html += "<a href='/login/'>[登录]</a>,";
      html += "<a href='/register/'>[注册有惊喜]</a>";
    }else{
      html += "欢迎："+data.uname;
      html += "<a href='/logout/'>退出</a>";
    }
    $("#login").html(html);
  },'json');
}
 */

/**
 * Created by tarena on 18-8-24.
 *
 */
// function loadGoods(){
//     /**
// 	 * 加载所有的商品分类以及对应的商品
//      */
// 	$.get('/type_goods/',function(data){
// 		var html = "";
// 		//循环遍历data，得到类别以及对应的商品json
// 		$.each(data,function (i,dic) {
// 			html+="<div class='item'>";
// 			//取出type所对应的值
// 			var type = dic.type;
// 			//将出去的数据转换为json对象
// 			var typeObj = JSON.parse(type);
// 				html+='<p class="title">';
// 					html+='<a href="#">更多</a>';
// 					html+="<img src='/"+typeObj.picture+"'>";
// 				html+='</p>';
// 				html+="<ul>";
// 			//获取商品列表，并转化为json对象
// 			var g_listObj = JSON.parse(dic.goods);
// 			//循环遍历商品列表,获取单个商品对象(good)，并判断i+1是否为5的倍数，如果是则给li添加一个类选择器<li class="no-margin">
// 			$.each(g_listObj,function(i,good){
// 				//console.log(good.fields.picture)
// 				if ((i+1)%5==0){
// 					html+="<li class='no-margin'>";
// 				}else {
// 					html+="<li>"
// 				}
// 						html+="<p>";
// 							html+="<img src='/"+ good.fields.picture +"'>"
// 						html+="</p>";
// 						html+="<div class='content'>";
//
// 							html+="<a href='javascript:add_cart("+ good.pk +")' class='cart'>";
// 								//加载购物车标记
// 								html+="<img src='/static/images/cart.png' title='添加购物车'>";
// 							html+="</a>";
// 							html+="<p>"+good.fields.title+"</p>";
//
// 							html+="<span>&yen"+ good.fields.price+ "/"+ good.fields.spec +"</span>";
// 						html+="</div>"
// 					html+="</li>";
// 			});
// 				html+="</ul>";
//
// 			html+="</div>"
//
//         });
// 		$("#main").html(html)
// 	},'json')
// 	//console.log("异步请求发送成功")
// }
/**
 * 将指定的商品添加至购物车
 * 参数：good_id,表示的是要加入购物车的商品id
 */
// function add_cart(good_id){
// 	$.get('/add_cart/', 'good_id='+good_id,
// 		function(data){
// 			if(data.status == 1){
// 				alert(data.text)
// 				//加载当前用户购物车内商品的数量
// 				load_count()
// 			}else if(data.status == 0){
// 				//用户还没有登录
// 				alert(data.text)
// 				//自动跳转至登录页面
// 				location.href = '/login/';
//
// 			}else {
// 				alert('添加失败')
// 			}
// 		},
// 		'json'
// 	)
// }

/**
 * 修改购物车中商品数量
 */
function update(btn,good_id){
	//console.log(good_id)
	if($(btn).val() == "-" ){
		var total_count = Number($(btn).next().val())
		if (total_count >=2) {
			total_count -= 1
			$(btn).next().val(total_count)
			save_to_db($(btn).next(),good_id)
		}
	}
	else{
		var total_count = Number($(btn).prev().val())
		total_count +=1
		$(btn).prev().val(total_count)
		save_to_db($(btn).prev(),good_id)
	}
	checkbox()
}
/**
 * 输入框中的数据发生变化时，将新的数据更新到数据库中
 */
function save_to_db(input,good_id){
	var val = $(input).val()
	if(val == ''){
		$(input).val(1)
	}
	var val = $(input).val()
	$.get('/add_cart/','good_id='+good_id+'&count='+val,
		function(data){
			if(data.status == 1){
				//alert(data.text)
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
	checkbox()
}
/**
 * 加载当前用户的购物车数量,以及购物车中商品的信息
 */
function load_count(){
	$.get('/cart_count/',function(data){
		var total_count = 0;
		$.each(data.count_list,function(i,count){
			total_count +=count
		})

		$('#myCart>a').html('我的购物车('+ total_count +')<img src="/static/images/cart.png" title="查看购物车">');
		//获取查询集合
		html = ""
		var cart_good_list = JSON.parse(data.cart_good_list)
		$.each(cart_good_list,function(i,cart_good){
			html +='<div class="g-item">';
				html +='<p class="check-box">';
					html +='<input type="checkbox">';
					html +="<img src='/"+cart_good.fields.picture+"' width=80>";
				html +='</p>';
				html +="<p class='goods'>"+cart_good.fields.title+"</p>";
				html +="<p class='price'>&yen;"+cart_good.fields.price+"</p>";
				html +="<p class='quantity'>";
					html +='<input class="sub_btn" type="button" value="-" onclick="update(this,'+cart_good.pk+')">';
					html +="<input class=\"total_count\" type=\"text\" value="+ data.count_list[i] +" oninput=\"value=value.replace(/[^\\d]|^[0]/g,'')\""+"onchange='save_to_db(this,"+cart_good.pk+")'>";
					html +='<input class="add_btn" type="button" value="+" onclick="update(this,'+cart_good.pk+')">';
				html +="</p>"
				html +="<p class='t-sum'><b>&yen;"+(cart_good.fields.price*data.count_list[i]).toFixed(2)+"</b></p>";
				html +="<p class='action'><a href='javascript:del_good_incart("+cart_good.pk+")'>移除</a></p>"
			html +="</div>"
			$("#good-content").html(html)


		});
		//实现全选功能和非全选
		checkbox()

	},'json');
}

/**
 * 删除购物车中的商品
 */
function del_good_incart(good_id){
	$.get('/del_good_incart/','good_id='+good_id,
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
 * 给checkbox设置全选和反选,
 */
function checkbox(){
	$("#checkall").click(function(){
		$('#good-content input:checkbox').prop('checked',$(this).prop('checked'));
		total_price()
	})
	$("#good-content input:checkbox").click(function(){
		checkboxAll()
		total_price()
	})
	checkboxAll()
	total_price()
}
/**
 * 根据每一个复选框的状态，判断总复选框的状态
 */
function checkboxAll(){
	if($("#good-content input:checkbox").length == $("#good-content input:checked").length){
		$("#checkall").prop('checked',true);
	}else{
		$("#checkall").prop('checked',false);
	};

}
/**
 * 将选中的复选框后面的小计求和
 */
function total_price(){
	var t_sum = 0
	$.each($("#good-content input:checkbox"),function(i,checkbox){
		if(checkbox.checked == true){
			//取出被选中的复选框的小计
			t_sum += Number($(checkbox).parent().siblings('.t-sum').find('b').text().substring(1))
		}
	})
	$("#main .foot b").html('合计:&yen'+t_sum.toFixed(2))

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
	//加载当前用户购物车内商品的数量以及商品的详细信息
	load_count()

})
