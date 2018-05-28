<include file="user:head" />
	<body>
		<div class="mui-content mui-scroll-wrapper">
			<div class="mui-scroll">
				<div class="user-bg">
					<div class="nav">
						<a href="javascript:;" onclick="javascript:history.back()" class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left grey" ></a>
						<h3>我的钱包</h3>
					</div>
					<div class="panel">
						<ul>
							<li>
								<h4><span>{$user.money}</span>元</h4>
								<p>现金余额</p>
							</li>
							<li>
								<h4><span>{$user.frozen}</span>元</h4>
								<p>冻结资金</p>
							</li>
						</ul>
					</div>
					<a href="{:U('user/tixian')}" class="btn-white">我要提现</a>
				</div>
				<!--list-->
				<div class="list journal">
					<div class="fix clearfix">
						<span>时间</span>
						<span>项目</span>
						<span>金额</span>
						<span>状态</span>
					</div>
					<table>
						<volist name="info" id="vo">
							<tr>
								<td>{$vo.create_time|frienddate}</td>
								<td>提现</td>
								<td><span class="mui-badge mui-badge-primary mui-badge-inverted">-￥{$vo.money}</span></td>
								<if condition="$vo['status'] eq 0">
								<td style="color: red;">处理中</td>
								<else/>
								<td>已处理</td>
								</if>
							</tr>
						</volist>
					</table>
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
