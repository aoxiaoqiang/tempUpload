<include file="public:top" />
<yh:load type="js" href="__STATIC__/tqkwap/js/jquery.validate.js,__STATIC__/tqkwap/js/validate-methods.js,__STATIC__/tqkwap/js/messages_zh.min.js,__STATIC__/tqkwap/js/jquery.form.min.js"/>
	<body>
		<div class="form">
			<h3>会员登录</h3>
			<form action="{:U('login/login')}" method="post" id="login">
				<div class="inputbox">
					<span class="iconfont icon-my4"></span>
					<input type="tel" name="username" id="phone" placeholder="请输入您的手机号" />
				</div>
				<div class="inputbox">
					<span class="iconfont icon-lock"></span>
					<input type="password" name="password" id="password" placeholder="请输入您的密码" />
				</div>
				<label><input type="checkbox" value="1" checked="" />记住密码</label>
				<input type="submit" value="登录"/>
				<input type="hidden" name="callback" value="{$_SERVER['HTTP_REFERER']}"/>
				<div class="flexbox">
					<div class="flex line"></div>
					<div class="flex"><a href="{:U('login/register')}">新用户注册</a></div>
					<div class="flex line"></div>
				</div>
			</form>
		</div>
		<script type="text/javascript">
			$("#login").validate({
				rules:{
					username:{
						required: true,
						isMobile:true,
					},
					password:{
						required: true,
					}
				},
				messages:{
					username:{
						required: "请输入手机号",
						isMobile:"请输入正确格式的手机号",
					},
					password:{
						required: "请输入密码",
					}
				},
				submitHandler: function(form) 
			    {
					$(form).ajaxSubmit({
						success: function(json) {
							if(json.status == 1){
								layer.msg(json.msg, {icon:6});
								setTimeout(function(){
									location.href = json.data;
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
