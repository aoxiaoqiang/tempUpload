<include file="public:amz_head" />
		<header data-am-widget="header" class="am-header am-header-default am-header-fixed">
	      	<form action="{:U('list/index')}" id="so" method="get">
				<div class="searchtop">
					<span class="am-icon-search"></span>
					<input type="text" class="am-form-field am-round" value="{$k}" name="k" onblur="$('#so').submit()" placeholder="搜搜看您想要的商品优惠券">
				</div>
			</form>
 		</header>
<include file="public:amz_nav" /> 	
		<div class="white-bar">
			<div class="sort">
				<div class="am-g">
					<div class="am-u-sm-4 am-text-center">
						<input type="radio" id="syn" name="syn" class="am-hide"<if condition='$txt_sort eq "new"'> checked="checked"</if>/>
						<label for="syn"><a href="{:U("top100/index",array('sort'=>'new','cid'=>$cid))}">综合排序</a></label>
					</div>
					<div class="am-u-sm-4 am-text-center">
						<input type="radio" id="hots" name="sort" value="" class="am-hide"  <if condition='$txt_sort eq "hot"'> checked="checked"</if> />
						<label id="btn_hot" for="sale"><a href="{:U("top100/index",array('sort'=>'hot','cid'=>$cid))}">销量排序</a></label>
					</div>
					<div class="am-u-sm-4 am-text-center">
						<input type="radio" id="rates" name="sort" value="" class="am-hide" <if condition='$txt_sort eq "rate"'> checked="checked"</if> />
					<label id="btn_rate" for="money"><a href="{:U("top100/index",array('sort'=>'rate','cid'=>$cid))}">优惠金额</a></label>
					</div>
				</div>
				
			</div>
	
			<form action="/?g=m&m=jump" id="jump" method="post" >	
	
		
				<div class="goods-list am-cf list-wrapper">
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
</div>
<input type="hidden" id="item" name="item" value=""/>
<input type="hidden" id="quan" name="quan" value=""/>
<input type="hidden" id="quanurl" name="quanurl" value=""/>

	<div class="page am-margin-bottom-lg">
						<if condition="$total_item gt 60">
						{$page}
						</if>
					</div>
			</form>
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


$('.jump').on('click',function(){
					$("#item").val($(this).attr('data-cnzz'));
					$("#quan").val($(this).attr('rel'));
					$("#quanurl").val($(this).attr('quanurl'));
					$("#jump").submit(); 
})

});

</script>
</body>
</html>