<include file="user:head" />
<body>
		<div class="mui-content mui-scroll-wrapper">
			<div class="mui-scroll">				
				<form method="post" action="{:U('user/jifen')}" id="jifen">
					<div class="user-bg">
						<div class="nav">
							<a href="javascript:;" onclick="javascript:history.back()" class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left grey" ></a>
							<h3>积分兑换</h3>
						</div>
						<div class="panel">
							<h4><span>{$user.score}</span></h4>
							<p>可用积分</p>
						</div>
					</div>
					<div class="user-bot">
						<!--jifen-->				
						<div class="input-box">
							<div class="mui-input-group">
								<div class="mui-input-row">
							        <label>积分兑换</label>
							    	<input type="text" class="mui-input-clear" name="count" id="count" placeholder="请输入您要兑换的数量" />
							    </div>	
							    <div class="mui-input-row money">
							        <label>金额</label>
							    	<input readonly="readonly" type="text" name="money" id="money" value="0" /><em>元红包</em>
							    </div>	
							</div>
						</div>
						<button type="submit" class="mui-btn mui-btn-danger btn-center" id="duihuan">立即兑换</button>
						<p><span class="c-main">注：</span>100积分 = <span id="calc">{:(C('yh_fanxian')/100)*100}</span>元红包</p>
					</div>
				</form>	
			</div>
		</div>
		<include file="public:foot" />
	<script>
		$(function(){
			jQuery.validator.addMethod("amount",function(value,element,params){  
		        var amount = /^\+?(?!0+(\d|(\.00?)?$))\d+(\.\d\d?)?$/;  
		        return this.optional(element)||(amount.test(value));  
		    },"请正确输入充值金额！");  
			$("#jifen").validate({
				rules:{
					count:{
						required:true,
						amount:true,
					}
				},
				messages:{
					count:{
						required:"不能为空"
					}
				},
			submitHandler: function(form) 
			{
				$(form).ajaxSubmit({
					success: function(json) {
						if(json.status == 1){
							layer.msg(json.msg, {icon:6});
			                 setTimeout(function(){
				             window.location.href="{:U('user/journal')}";
							},1000);
						}else{
							layer.msg(json.msg, {icon:5,time:1000});
						}
			        }
				});     
			}
			});
			
			$('#count').on('input propertychange', function(){
				if($(this).val() == ''){
					$("#money").val(0);
				}
				calc_money();
			});
			
			function calc_money()
			{
				var count = parseFloat($('#count').val());
				var calc = parseFloat($('#calc').text());
				var money = (calc/100)*count || 0;
				$('#money').val(money.toFixed(2));
			}
		});		
		
	</script>
	</body>
</html>
