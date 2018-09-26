
/**验证手机号码格式
 * 返回值：true,表示通过验证，false，表示为通过
 * **/
function checkUphone(){
	var num_regex = /^((13[0-9])|(14[5|7])|(15([0-3]|[5-9]))|(1[8,9][0,5-9]))\d{8}$/
	var phoneNumber = $("[name='uphone']").val().trim();
	if(!num_regex.test(phoneNumber)){
		$('#phone-show').html("手机号码格式错误！");
		return false;
	}
	return true
}

$(function(){
	$("#phone_num").blur(function(event){
		checkUphone();
	});
	$("#phone_num").focus(function(event){
		$('#phone-show').html("");
	});
	//为表单绑定submit事件
	$('#frmLogin').submit(function(){
		return checkUphone();
	});
})