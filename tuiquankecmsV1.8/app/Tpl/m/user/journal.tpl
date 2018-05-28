<include file="user:head" />
	<body>
		<div class="mui-content mui-scroll-wrapper">
			<div class="mui-scroll">				
				<div class="user-bg">
					<div class="nav">
						<a href="javascript:;" onclick="javascript:history.back()" class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left grey" ></a>
						<h3>财务日志</h3>
					</div>
					<div class="panel">
						<ul>
							<li>
								<h4><span>{$user.money}</span>元</h4>
								<p>账户余额</p>
							</li>
							<li>
								<h4><span>{$balance}</span>元</h4>
								<p>累计提现金额</p>
							</li>
						</ul>
					</div>
				</div>
				<!--list-->
				<div class="list">
					<div class="fix mui-clearfix">
						<span>时间</span>
						<span>
							项目
						</span>
						<span>金额</span>
					</div>
					<table>
						<volist name="info" id="vo">
						<tr>
								<td width="30">{$vo.create_time|frienddate}</td>
								<td width="50">{$vo.type}</td>
								<td width="20"><span class="mui-badge mui-badge-primary mui-badge-inverted">{$vo.money}</span></td>
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
