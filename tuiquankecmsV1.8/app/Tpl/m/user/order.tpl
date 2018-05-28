<include file="user:head" />
	<body>
		<div class="mui-content mui-scroll-wrapper">
			<div class="mui-scroll">
				<div class="user-bg">
					<div class="nav">
						<a href="javascript:;" onclick="javascript:history.back()" class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left grey" ></a>
						<h3>我的订单</h3>
					</div>
					<div class="panel">
						<ul>
							<li>
								<h4><span>{$user.score}</span></h4>
								<p>可用积分</p>
							</li>
							<li>	
								<h4><span>{$integral}</span></h4>
								<p>待返积分</p>
							</li>
						</ul>
					</div>
					<a href="{:U('user/jifen')}" class="btn-white">我要兑换</a>
				</div>
				<!--list-->
				<div class="wallet">
					<ul>
						<volist name="list" id="vo">
							<li>
								<div class="mui-clearfix">
									<if condition="$vo['price']">
									<p class="mui-pull-left"><em>订单金额</em><span class="c-main">￥{$vo.price}</span></p>
									</if>
									<p class="mui-pull-right"><em>状态</em><span class="c-primary">{$vo.status}</span></p>
								</div>
								<p><em>提交时间</em>{$vo.add_time|frienddate}</p>
								<p><em>订单编号</em>{$vo.orderid}</p>
								<if condition="$vo['integral']">
								<p><em>获得积分</em>{$vo.integral}</p>
								</if>
								<if condition="$vo['up_time']">
								<p><em>更新时间</em> {$vo.up_time|frienddate}</p>
								</if>
							</li>
						</volist>	
							
					</ul>
					
					<div class="page">
						<if condition="$total_item gt $page_size">
						{$page}
						</if>
					</div>
				</div>
				
				
				
			</div>
		</div>
		<include file="public:foot" />
	</body>
</html>
