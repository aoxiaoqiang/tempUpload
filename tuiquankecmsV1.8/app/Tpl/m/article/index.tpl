<include file="public:amz_head" />
		<header data-am-widget="header" class="am-header am-header-default am-header-fixed">
	      	<div class="am-header-left am-header-nav">
			    <a href="javascript:;" onclick="history.back()" class="am-icon-angle-left am-text-xl"></a>
			</div>
			<h1 class="am-header-title">今日头条</h1>
 		</header>
 		
<include file="public:amz_nav" />
		<!--headlines-->
		<div class="headlines">
			<div class="am-tabs am-slider am-slider-default"  data-am-widget="slider" data-am-slider='{&quot;animation&quot;:&quot;slide&quot;,&quot;animationLoop&quot;:false,&quot;itemWidth&quot;:80,&quot;itemMargin&quot;:10}'>
				<ul class="am-tabs-nav am-nav am-nav-tabs am-slides">
				    <li class="<if condition="$cateid eq ''"> am-active</if>"><a href="{:U('article/index')}">全部</a></li>
				    <volist name="article_cate" id="cate">
						<li class="<if condition="$cateid eq $cate['id']"> am-active</if>"><a href="{:U('article/index/',array('cateid'=>$cate['id']))}">{$cate.name}</a></li>
					</volist>
				</ul>
				<div class="am-tabs-bd">
					<div class="am-tab-panel am-fade am-in am-active">
						
						<ul>
							<volist name='list' id="cateid">
								<li>
									<a href="{$cateid.linkurl}">
										<img src="{$cateid.pic}">
										<h3 class="ellipsis-2">{$cateid.title}</h3>
										<p class="ellipsis-2">{$cateid.into}</p>
										<div class="am-cf">
											<span class="mark">{$cateid.catename}</span>
											<p class="time">{$cateid.add_time}</p>
										</div>
									</a>
								</li>
							</volist>
						</ul>
						<div class="page am-margin-bottom-lg">
							<if condition="$total_item gt $size">
							{$page}
							</if>
						</div>
					</div>
					
				</div>
			</div>
 		</div>
 		
<include file="public:amz_foot" />
		<script language="JavaScript">
		jQuery(function($){
			var backTop=jQuery(".backTop");
			$(window).scroll(function(){
				if($(window).scrollTop()>150){
					backTop.css("display","block");
				}else{
					backTop.css("display","none");
				}
			})
			$('#scrollToTop').click(function(){
				$('body,html').animate({scrollTop:0},500);
				return false;
			})
			$('#scrollToTop').click(function() {
				$('body,html').animate({ scrollTop: 0 }, 500);
				return false;
			})
		});
		
		
		</script>
	</body>
</html>