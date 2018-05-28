<include file="public:top" />
<yh:load type="js" href="__STATIC__/tqkwap/js/jquery.validate.js,__STATIC__/tqkwap/js/validate-methods.js,__STATIC__/tqkwap/js/messages_zh.min.js,__STATIC__/tqkwap/js/jquery.form.min.js"/>
	<body>
		<div class="form">
			<h3>新用户注册</h3>
			<form action="{:U('login/register')}"  method="post" id="register">
				<div class="inputbox">
					<span class="iconfont icon-my4"></span>
					<input type="tel" name="phone" autocomplete="off" id="phone" placeholder="请输入您的手机号" />
				</div>
				<div class="inputbox">
					<span class="iconfont icon-lock"></span>
					<input type="password" autocomplete="off" name="password" id="password" placeholder="请输入您的密码" />
				</div>
				<div class="inputbox">
					<span class="iconfont icon-lock"></span>
					<input type="password" autocomplete="off" name="repassword" id="repassword" placeholder="请重复输入您的密码" />
				</div>
				<input type="submit" value="登录"/>
				<div class="flexbox">
					<div class="flex line"></div>
					<div class="flex"><a href="{:U('login/index')}">返回登录</a></div>
					<div class="flex line"></div>
				</div>
			</form>
		</div>
		<script type="text/javascript">
			$("#register").validate({
				rules:{
					phone:{
						required: true,
						isMobile:true,
					},
					password:{
						required: true,
					},
					repassword:{
						required: true,
						equalTo:"#password"
					}
				},
				messages:{
					phone:{
						required: "请输入手机号",
						isMobile:"请输入正确格式的手机号",
					},
					password:{
						required: "请输入密码",
					},
					password2:{
						required: "请重复输入密码",
						equalTo:"两次密码输入不一致"
					}
				},
				submitHandler: function(form) 
			    {
					$(form).ajaxSubmit({
						success: function(json) {
							if(json.status == 1){
								layer.msg(json.msg, {icon:6});
								setTimeout(function(){
									location.href = "{:U('user/ucenter')}";
								},1000);
							}else{
								layer.msg(json.msg, {icon:5});
							}
			            }
					});     
			    }
			})
		</script>
	</body>
</html>
