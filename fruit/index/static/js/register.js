
/**验证手机号码
 * 返回值：true,表示通过验证，false，表示为通过
 * **/
function checkUphone(){
    //电话号码正则表达式
    var num_regex = /^[1][3,4,5,7,8,9][0-9]{9}$/;
	var phoneNumber = $("[name='uphone']").val().trim();
	//向window对象中增加一个变量flag，默认值为false
	window.flag = false;
	//如果号码不符合正则表达式，在返回false
	if (!num_regex.test(phoneNumber)){
	    $('#uphone-show').html("格式不正确！");
    }else{
	    $.ajax({
            url:"/check_uphone/",
            type:"post",
            dataType:'json',
            async:false,
            data :{
                uphone:phoneNumber,
                csrfmiddlewaretoken:$("[name='csrfmiddlewaretoken']").val()
            },
            success:function(data){
                if(data.status == 1){
                    window.flag =  true;
                }else{
                    $('#uphone-show').html(data.text);
                    window.flag = false;
                }
            },
        });
    }
    return window.flag
}
/**
 * 验证密码
 *返回值，
 *true:表示通过
 *false:表示未通过
 */
function checkUpwd(){
    var upwd = $("[name='upwd']").val().trim();
    //console.log(upwd.length)
    if (upwd.length <6){
        $('#upwd-show').html("密码不能少于6位数");
        return false
    }else {
        return true
    }
}
/**
 * 验证两次输入的密码是否一致
 */
function checkUpwd_again(){
    var upwd = $("[name='upwd']").val().trim();
    var upwd_again = $("[name='reupwd']").val().trim();
    if(upwd != upwd_again){
        $('#upwd-again-show').html("两次密码不一致");
        return false;
    }
    return true;
}
/**
 * 验证邮箱格式是否正确
 */
function checkUemail() {
    var email_regex =/^[\w!#$%&'*+/=?^_`{|}~-]+(?:\.[\w!#$%&'*+/=?^_`{|}~-]+)*@(?:[\w](?:[\w-]*[\w])?\.)+[\w](?:[\w-]*[\w])?$/ ;

    var uemail = $("[name='uemail']").val().trim();
    console.log(email_regex.test(uemail));
    if(!email_regex.test(uemail)){
        $('#uemail-show').html("邮箱格式不正确");
        return false
    }
    return true
}
/**
 * 验证用户名
 * 不能为空，
 * 已经存在的不能注册
 */
function checkUname(){
    var uname = $("[name='uname']").val().trim();
    window.flag = false;
    if(!uname){
        $('#uname-show').html("用户名不能为空")
    }else {
        $.ajax({
            url:'/check_uname/',
            type:'post',
            dataType:'json',
            async:false,
            data :{
                uname:uname,
                csrfmiddlewaretoken:$("[name='csrfmiddlewaretoken']").val()
            },
            success:function(data){
                if(data.status == 1){
                    window.flag =  true;
                }else {
                    $('#uname-show').html(data.text);
                }
            },
        })
    }
    return window.flag
}
/**
 * DOM树加载完毕时要执行的操作
 * 包含初始化的行为操作，比如：事件绑定
 * **/
$(function(){
    //验证手机号码
    $("#phone_num").blur(function(event){
		checkUphone();
	});
	$("#phone_num").focus(function(event) {
        $('#uphone-show').html("");
    });

    //验证密码
    $("[name='upwd']").blur(function () {
        checkUpwd();
    });
    $("[name='upwd']").focus(function () {
        $('#upwd-show').html("");
    });
    //验证两次密码是否一致
    $("[name='reupwd']").blur(function () {
        checkUpwd_again();
    });
    $("[name='reupwd']").focus(function () {
        $('#upwd-again-show').html("");
    });
    //验证邮箱格式是否正确
    $("[name='uemail']").blur(function(){
        checkUemail();
    });
    $("[name='uemail']").focus(function(){
        $('#uemail-show').html("");
    });
    //验证用户名
     $("[name='uname']").blur(function(){
        checkUname();
    });
    $("[name='uname']").focus(function(){
        $('#uname-show').html("");
    });

    //为表单绑定submit事件
    $('#frmRegister').submit(function () {
        return checkUphone() && checkUpwd() && checkUpwd_again() && checkUemail() && checkUname()
    })

});



