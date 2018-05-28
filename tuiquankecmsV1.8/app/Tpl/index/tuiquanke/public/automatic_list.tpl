  <div class="goods-list main-container">
  <ul class="clearfix">
<volist name="items_list" id="item" key="i" mod="4">	
<li class="<eq name="mod" value="3">no-right</eq>">

<if condition="$item['coupon_click_url'] neq ''">
	
<a style="display: block;" href="javascript:;" rel="{$item.quan}"  quanurl="{$item.coupon_click_url}" class="img cnzzCounter jump" data-cnzz-type="1" data-cnzz="{$item.num_iid}">
<img <if condition="C('yh_site_secret') eq '1'"> class="scrollLoading" data-url="{$item.pic_url}_400x400" data-original="{$item.pic_url}_400x400"  src="__STATIC__/tuiquanke/images/pixel.gif" <else/> src="{$item.pic_url}_400x400"  </if> />
  <div class="lq">
				<div class="lq-t">
					<p class="lq-t-d1">领优惠券</p>
					<p class="lq-t-d2">省<span>{:floor($item['quan'])}</span>元</p>
				</div>
				<div class="lq-b"></div>
  </div>
  </a>
            <div class="padding">
                            <a quanurl="{$item.coupon_click_url}"
                               href="javascript:;"
                               rel="{$item.quan}"  
                               class="title clearfix cnzzCounter jump" data-cnzz-type="1"
                               data-cnzz="{$item.num_iid}">
                              
                                {$item.title}
                            </a>
                            <div class="coupon-wrap clearfix" >
                            	<p>
	                            	<span><font style="font-size: 26px;">{$item.coupon_price}</font>元<i class="quanhou"></i></span>
	                              <span style="float: right;"><if condition="$item.shop_type eq 'C' ">淘宝</if><if condition="$item.shop_type eq 'B' ">天猫</if><font color="red">{$item.price}</font>元</span>
	                            </p>
	                            <p>
	                                <if condition="$item.shop_type eq 'C' "><i class="taobao"></i></if>
									<if condition="$item.shop_type eq 'B' "><i class="tmall"></i></if>月销量  <span class="num">{$item.volume}</span>,
																<span>优惠券<font color="red">{:floor($item['quan'])}</font>元</span>
	                            </p>        
                            </div>
                        </div>
	
	
<else/>

 <a style="display: block;" <if condition="$item.isq neq '1'">rel="nofollow" isconvert="1" data-itemid="{$item.num_iid}" href="<if condition="$item.click_url neq '0'">{$item.click_url}</if>"<else/>href="{:U('/item/',array('id'=>$item['id']))}"</if> target="_blank" class="img cnzzCounter" data-cnzz-type="1" data-cnzz="{$item.num_iid}">
<img <if condition="C('yh_site_secret') eq '1'"> class="scrollLoading" data-url="{$item.pic_url}_400x400" data-original="{$item.pic_url}_400x400"  src="__STATIC__/tuiquanke/images/pixel.gif" <else/> src="{$item.pic_url}_400x400"  </if> />
  <div class="lq">
				<div class="lq-t">
					<p class="lq-t-d1">领优惠券</p>
					<p class="lq-t-d2">省<span>{:floor($item['quan'])}</span>元</p>
				</div>
				<div class="lq-b"></div>
  </div>
  </a>
            <div class="padding">
                            <a target="_blank"
                               href="{:U('/item/',array('id'=>$item['id']))}"
                               class="title clearfix cnzzCounter" data-cnzz-type="1"
                               data-cnzz="{$item.num_iid}">
                              
                                {$item.title}
                            </a>
                            <div class="coupon-wrap clearfix" >
                            	<p>
	                            	<span><font style="font-size: 26px;">{$item.coupon_price}</font>元<i class="quanhou"></i></span>
	                              <span style="float: right;"><if condition="$item.shop_type eq 'C' ">淘宝</if><if condition="$item.shop_type eq 'B' ">天猫</if><font color="red">{$item.price}</font>元</span>
	                            </p>
	                            <p>
	                                <if condition="$item.shop_type eq 'C' "><i class="taobao"></i></if>
									<if condition="$item.shop_type eq 'B' "><i class="tmall"></i></if>月销量  <span class="num">{$item.volume}</span>,
																<span>优惠券<font color="red">{:floor($item['quan'])}</font>元</span>
	                            </p>        
                            </div>
                        </div>
 </if>     
                        
                        
                        
                    </li>
                    
                    
	</volist>
	</ul>
	<div style="clear:both;"></div>
 </div>		
