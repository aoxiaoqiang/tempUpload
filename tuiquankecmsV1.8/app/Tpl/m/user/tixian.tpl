<include file="user:head" />
	<body>
		<div class="mui-content mui-scroll-wrapper">
			<div class="mui-scroll">				
				<div class="user-bg">
					<div class="nav">
						<a href="javascript:;" onclick="javascript:history.back()" class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left grey" ></a>
						<h3>我要提现</h3>
					</div>
					<div class="panel">
						<h4><span>{$user.money}</span>元</h4>
						<p>账户余额</p>
					</div>
				</div>
				<div class="user-bot">
					<!--tixian-->				
					<form method="post" action="{:U('user/tixian')}" id="mloginbox">
						<div class="input-box">
							<div class="mui-input-group">
								<div class="mui-input-row">
							        <label>提现金额</label>
							    	<input type="text" class="mui-input-clear" name="money" placeholder="请输入提现金额" />
							    </div>	
							    <div class="mui-input-row">
							        <label>真实姓名</label>
							    	<input type="text" class="mui-input-clear" name="name" placeholder="请输入真实姓名（很重要）" />
							    </div>								    
								<div class="tixian mui-clearfix">
									<label>提现方式</label>
									<span class="select-box">
										<select name="method">
											<option>请选择提现方式...</option> 
											<option value="1">微信</option>
											<option value="2">支付宝</option>
										</select>
									</span>
								</div>							    
							    <div class="mui-input-row">
							        <label>账号</label>
							    	<input type="text" class="mui-input-clear" name="allpay" datatype="m|e" placeholder="请输入支付宝/微信账号">
								</div>	
								<div class="mui-input-row">
									<label>备注</label>
									<textarea class="mui-input-clear" name="content"></textarea>
								</div>
							</div>
						</div>
						<button type="submit" class="mui-btn mui-btn-danger btn-center">立即申请</button>
					</form>								
				</div>
			</div>
		</div>
		<include file="public:foot" />
	<script>
		$(function(){
			$("#mloginbox").validate({
				rules:{
					name:{
						required:true,
					},
					money:{
						required:true,
					},
					allpay:{
						required:true,
					},
					method:{
						required:true,
					},
				},
			submitHandler: function(form) 
			{
				$(form).ajaxSubmit({
					success: function(json) {
						if(json.status == 1){
							layer.msg(json.msg, {icon:6});
			                 setTimeout(function(){
				             window.location.href="{:U('user/record')}";
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
