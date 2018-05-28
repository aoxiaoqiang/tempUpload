<include file="user:head" />
<yh:load type="js" href="__STATIC__/tqkwap/js/jquery.SuperSlide.2.1.1.js" />
<link rel="stylesheet" href="__STATIC__/tqkwap/ucenter/iconfont.css">
<div class="mui-content mui-scroll-wrapper">
	<div class="mui-scroll">			
		<div class="user-bg">
			<div class="user">
				<div class="user-l">
					<a href="{:U('user/modify')}"><img src="{$user.avatar}"></a>
					<p>{$user.nickname}</p>
				</div>
				<!--<div class="user-r">
					<a href=""><i class="iconfont icon-qiandao"></i>签到</a>
				</div>-->
			</div>
			<div class="jifen">
				<ul>
					<li><p>{$user.money}<br><span>账户余额</span></p><span class="pipe">|</span></li>
					<li><p>{$user.score}<br><span>可用积分</span></p><span class="pipe">|</span></li>
					<li><p>{$integral}<br><span>待返积分</span></p></li>
				</ul>
			</div>
		</div>
		<div class="laba mui-clearfix">
			<i class="iconfont icon-laba"></i>
			<div class="bd">
				<ul>
<volist name="article" id="art">
<li><a href="<if condition="C('URL_MODEL') eq 2">/article/view_{$art.id}<else/>{:U('/m/article/read',array('id'=>$art['id']))}</if>">{$art.title}</a></li>
</volist>	
				</ul>
			</div>
		</div>
		<div class="mod user-bot">
			<table>
				<tr>
					<td>
						<a href="{:U('user/record')}"><i class="iconfont icon-tixianshenqing" style="color: #72aefd;"></i><br>我的钱包</a>
					</td>
					<td>
						<a href="{:U('user/modify')}"><i class="iconfont icon-xiangqing" style="color: #a283f6;"></i><br>修改资料</a>
					</td>
					<td>
						<a href="{:U('user/journal')}"><i class="iconfont icon-jifenshangcheng" style="color: #fec832;"></i><br>财务日志</a>
					</td>
				</tr>
				<tr>
					<td>
						<a href="{:U('user/order')}"><i class="iconfont icon-wodedingdan" style="color: #ff8746;"></i><br>我的订单</a>
					</td>
					<td>
						<a href="{:U('user/suborder')}" id="tijiao"><i class="iconfont icon-tijiao" style="color: #38be9a;"></i><br>提交订单</a>
					</td>
					<td>
						<a href="{:U('login/logout')}"><i class="iconfont icon-tuichu" style="color: #f75c5c;"></i><br>退出登录</a>
					</td>
				</tr>
			</table>
		</div>
	</div>
</div>	
<include file="public:foot" />
<script type="text/javascript">
	jQuery(".laba").slide({mainCell:".bd ul",autoPage:true,effect:"top",autoPlay:true});
</script>
	
