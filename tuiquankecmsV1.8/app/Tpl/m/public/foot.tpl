		<!--footer-->
		<div class="footer">
			<div class="footer-top">
				<div class="line"></div>
				<div class="circle"></div>
				<div class="line"></div>
			</div>
			<ul class="mui-clearfix">
				<li><a href="{:C('yh_headerm_html')}"><i class="iconfont icon-shouye"></i><span>首页</span></a></li>
				<li><a href="{:U('jiu/index')}"><i class="iconfont icon-gift"></i><span>9块9包邮</span></a></li>
				<li><a href="{:U('zhibo/index')}"><i class="iconfont icon-live"></i><span>优惠直播</span></a></li>
				<li><a href="{:U('jingxuan/index')}"><i class="iconfont icon-temai"></i><span>优惠特卖</span></a></li>
				<li><a href="{:U('user/ucenter')}"><i class="iconfont icon-wode"></i><span>我的</span></a></li>
			</ul>
		</div>
<div class="foot" style="display: none;">
	{:C('yh_statistics_code')}
</div>
		<div class="mui-off-canvas-backdrop"></div>
	</div>
</div>
<script>
<if condition="$fill eq 'fillphone'">
	layer.open({
	  type: 2, 
	  content: ["{:U('user/fillphone')}", "no"],
	  title: "完善用户信息",
	  area:"90%",
	  closeBtn: 0
	}); 
</if>
	mui.init({
		swipeBack: false,
	});
	mui('body').on('tap','a:not(#offCanvasBtn)',function(){
		window.location.href=this.href;
	});
	mui('.mui-scroll-wrapper').scroll({
		deceleration: 0.002,
		indicators: false
	});		
</script>
</body>
</html>