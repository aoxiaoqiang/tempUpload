<include file="user:head" />
	<body>
		<div class="mui-content mui-scroll-wrapper">
			<div class="mui-scroll">
				<form method="post" action="{:U('user/modify')}" id="mloginbox" enctype="multipart/form-data" >
					<div class="user-bg">
						<div class="nav">
							<a href="javascript:;" onclick="javascript:history.back()" class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left grey" ></a>
							<h3>个人设置</h3>
						</div>
						<div class="panel">
							<div class="avatar">
								<p>头像</p>
								<div class="am-form-group am-form-file" id="clipArea">
									<img src="{$info.avatar|default="__STATIC__/images/default_photo.gif"}" id="input-image">
									<i class="mui-icon mui-icon-arrowright"></i>
									<input type="file" name="avatar" class="input-file">
								</div>
							</div>
						</div>
					</div>
					<div class="user-bot" style="margin-top: -70px;">
						<div class="input-box">
							<div class="mui-input-group">
								
								<div class="mui-input-row">
							        <label>手机号</label>
							   <label>{$info.phone}</label>
							    </div>	
								<div class="mui-input-row">
							        <label>昵称</label>
							    	<input type="text" class="mui-input-clear" name="nickname" value="{$info.nickname}">
							    </div>	
							    <div class="mui-input-row">
							        <label>QQ</label>
							    	<input type="text" class="mui-input-clear" name="qq" value="{$info.qq}">
							    </div>	
							    <div class="mui-input-row">
							        <label>微信号</label>
							    	<input type="text" class="mui-input-clear" name="wechat" value="{$info.wechat}">
							    </div>	
							</div>
						</div>
						<div class="input-box">
							<div class="mui-input-group">
							    <div class="mui-input-row">
							        <label>新密码</label>
							    	<input type="password" name="password" class="mui-input-password" >
							    </div>	
							    <div class="mui-input-row">
							        <label>确认密码</label>
							    	<input type="password" name="password2" class="mui-input-password" >
							    </div>	
							</div>
						</div>
						<button type="submit" id='btn' class="mycopy mui-btn mui-btn-danger btn-center">确认提交</button>
					</div>				
				</form>
			</div>
		</div>
		<include file="public:foot" />
		<script type="text/javascript" src="__STATIC__/tqkwap/js/preview.js"></script>
		<script>
			$(function(){
				$('input[name=avatar]').uploadPreview({ Img: "input-image", Width: 20, Height: 20 });
				$('#password').validate({
					rules:{
						password2:{
							equalTo:"#password",
						}
					}
				})
				$("#mloginbox").validate({
					rules:{
					},
					submitHandler: function(form) 
					{
						$("#btn").html('数据保存中...');
						$('#btn').attr('disabled',"true");
						
						$(form).ajaxSubmit({
							success: function(json) {
								$("#btn").html('确认提交');
								$('#btn').removeAttr("disabled");
								if(json.status == 1){
										layer.msg(json.msg, {icon:6});
					             	    setTimeout(function(){
										location.reload()
									},1000);
								}else{
								layer.msg(json.msg, {icon:5,time:1000});
								}
					    	   }
						});     
					}
				});
			});

		</script>
	</body>
</html>
