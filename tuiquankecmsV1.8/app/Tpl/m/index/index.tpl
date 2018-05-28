<include file="public:head" />
	<div id="offCanvasContentScroll" class="mui-content mui-scroll-wrapper">
		<div class="mui-scroll">
			<!--banner-->
			<div id="slider" class="mui-slider banner">
				<div class="mui-slider-group">
<volist name="ad_list" id="ad">
					<div class="mui-slider-item">
						<a href="{$ad.url}">
							<img src="{$ad.img}">
						</a>
					</div>
</volist>
				</div>
<div class="mui-slider-indicator">
<volist name="ad_list" id="ad">
<div class="mui-indicator"></div>
</volist>  
				</div>
			</div>
			<!--nav-->
			<div class="nav mui-clearfix">
				<ul>
					<li><a href="{:U('list/index')}"><img src="__STATIC__/tqkwap/images/icon01.png"><p>全部商品</p></a></li>
					<li><a href="{:U('list/index',array('cid'=>'1'))}"><img src="__STATIC__/tqkwap/images/icon02.png"><p>时尚女装</p></a></li>
					<li><a href="{:U('list/index',array('cid'=>'2'))}"><img src="__STATIC__/tqkwap/images/icon03.png"><p>精品男装</p></a></li>
					<li><a href="{:U('list/index',array('cid'=>'3'))}"><img src="__STATIC__/tqkwap/images/icon04.png"><p>鞋包配饰</p></a></li>
					<li><a href="{:U('list/index',array('cid'=>'6'))}"><img src="__STATIC__/tqkwap/images/icon05.png"><p>美妆洗护</p></a></li>
					<li><a href="{:U('list/index',array('cid'=>'8'))}"><img src="__STATIC__/tqkwap/images/icon06.png"><p>美食小吃</p></a></li>
					<li><a href="{:U('list/index',array('cid'=>'9'))}"><img src="__STATIC__/tqkwap/images/icon07.png"><p>内衣裤袜</p></a></li>
					<li><a href="{:U('list/index',array('cid'=>'10'))}"><img src="__STATIC__/tqkwap/images/icon08.png"><p>数码家电</p></a></li>
					<li><a href="{:U('list/index',array('cid'=>'12'))}"><img src="__STATIC__/tqkwap/images/icon09.png"><p>家居用品</p></a></li>
					<li><a href="{:U('list/index',array('cid'=>'17'))}"><img src="__STATIC__/tqkwap/images/icon10.png"><p>宠物盆景</p></a></li>
				</ul>
			</div>
			<!--toutiao-->
			<div class="toutiao mui-clearfix">
				<a href="{:U('article/index')}"><img src="__STATIC__/tqkwap/images/toutiao.png" class="mui-pull-left"></a>
				<div class="notice mui-pull-right">
					<div class="notes mui-clearfix">
						<div class="bd">
							<ul>
								<volist name="article_list" id="article">
								<li><a href="<if condition="C('URL_MODEL') eq 2">/article/view_{$article.id}<else/>{:U('/m/article/read',array('id'=>$article['id']))}</if>">{$article.title}</a></li>
								</volist>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<!--polular-->
			<div class="popular">

			<!--main-->

<form action="/?g=m&m=jump" id="jump" method="post" >	
	<div style="clear: both;"></div>
		<div id="refreshContainer">
<div class="goods-list am-cf list-wrapper" style="padding-top: 10px;">
<volist name='list' id="vo">
<if condition="$vo['coupon_click_url'] neq '' ">
<div class="goods-item">
<div class="tqk_pic"><a data-transition="slide" rel="{$vo.quan}" data-cnzz="{$vo.num_iid}"  quanurl="{$vo.coupon_click_url}" href="javascript:;" class="img QtkSelfClick jump">
<if condition="$vo['is_new'] eq 1"><span class="today-wrapper"><span>今日</span><span>新品</span></span></if>
<img src="{$vo.pic_url}_400x400"></a></div><a data-transition="slide" href="javascript:;" class="title QtkSelfClick"><div class="text" style=" color:#777777;">{$vo.title}</div></a><div class="tqkprice"><span class="text">券后:￥{$vo.coupon_price}</span><label>领券省{$vo.quan}元</label></div><div class="price-wrapper"><span class="text tqkico" style="padding-top: 4px;">
<if condition="$vo.shop_type eq 'B'">天猫<else/>淘宝</if>在售
</span><span class="price">{$vo.price}元</span><div class="sold-wrapper"><span class="sold-num" style="font-size: 10px;">{$vo.volume}</span><span class="text" style="font-size: 10px;">人已买</span></div></div>
</div>
<else/>
<div class="goods-item">
<div class="tqk_pic"><a data-transition="slide" href="{$vo.linkurl}" class="img QtkSelfClick">
<if condition="$vo['is_new'] eq 1"><span class="today-wrapper"><span>今日</span><span>新品</span></span></if>
<img src="{$vo.pic_url}_400x400"></a></div><a data-transition="slide" href="{$vo.linkurl}" class="title QtkSelfClick"><div class="text" style=" color:#777777;">{$vo.title}</div></a><div class="tqkprice"><span class="text">券后:￥{$vo.coupon_price}</span><label>领券省{$vo.quan}元</label></div><div class="price-wrapper"><span class="text tqkico" style="padding-top: 4px;">
<if condition="$vo.shop_type eq 'B'">天猫<else/>淘宝</if>在售
</span><span class="price">{$vo.price}元</span><div class="sold-wrapper"><span class="sold-num" style="font-size: 10px;">{$vo.volume}</span><span class="text" style="font-size: 10px;">人已买</span></div></div>
</div>
</if>

</volist>	

<div class="mui-text-center">
				<a href="{:U('list/index',array('p'=>2))}" class="mui-btn">查看更多优惠商品</a>
			</div>
			</div>
<input type="hidden" id="item" name="item" value=""/>
<input type="hidden" id="quan" name="quan" value=""/>
<input type="hidden" id="quanurl" name="quanurl" value=""/>
	
		</div>
			</form>
			
		
			</div>
			<!--add-->
		
		</div>
		<a id="scrollToTop" class="backTop hide"> <span class="iconfont icon-top"></span> </a>
	</div>
<include file="public:foot" />
<script>	
mui('.mui-scroll-wrapper').scroll({
deceleration: 0.002,
indicators: false
});	
	var offCanvasWrapper = mui('#offCanvasWrapper');
	var offCanvasInner = offCanvasWrapper[0].querySelector('.mui-inner-wrap');
	var offCanvasSide = document.getElementById("offCanvasSide");
	var classList = offCanvasWrapper[0].classList;
	classList.add('mui-slide-in');
	offCanvasWrapper.offCanvas().refresh();
	 //主界面和侧滑菜单界面均支持区域滚动；
	mui('#offCanvasSideScroll').scroll();
	mui('#offCanvasContentScroll').scroll({
	deceleration: 0.5,
    indicators: false});
	var slider = mui("#slider");
	   slider.slider({
						interval: 3000
				});
	offCanvasInner.addEventListener('drag', function(event) {
	    event.stopPropagation();
	});
	jQuery(".notes").slide({mainCell:".bd ul",autoPage:true,effect:"top",autoPlay:true});
	var scrollToTopBox = document.getElementById('scrollToTop');
	scrollToTopBox.addEventListener('tap', function(e) {
	e.stopPropagation();
	mui('#offCanvasContentScroll').scroll().scrollTo(0,0,1000);
	window.scrollTo(0, 1000);
	});
</script>
