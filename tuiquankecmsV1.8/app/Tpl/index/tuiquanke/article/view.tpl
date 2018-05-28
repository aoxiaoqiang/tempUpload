<!doctype html>
<html>
<head>
<include file="public:head" />
<load href="__STATIC__/tuiquanke/css/article.css" />
<style type="text/css">
.mains,td,th {
	font-family: Tahoma, Helvetica, Arial, "宋体", sans-serif;
}
.content_text h2 {
	padding: 10px 0;
	font-size: 14px;
}
.content_text table td {
	text-indent: 12px;
}
</style>
</head>
<body>
<include file="public:header" />
<div id="dtk_mian">
<div style="padding-top:1px; clear: both;"></div>
<style>
.article_left{ width:860px ; float: left;border-top: 1px solid #e5e5e5; min-height: 700px;}
.article_right{ width:325px; float: left; border-left: 1px solid #e5e5e5; overflow: hidden; padding-left: 10px;}
.article_left ul{ padding: 20px;}
.ad_300{ width: 100%; height: 250px;}
.guide-nav,.guide a,.hotPet .pet-list dt i,.ol-txt li i{}
.guide-nav{height:32px;padding-left:17px;line-height:32px;background-position:-490px 11px;color:#888; margin-top: 15px;padding-top: 10px;}
.guide-nav a{color:#888; font-size: 14px;}
.article_list{ padding-top: 30px; padding-left: 20px;}
.article_list dd{height: 32px; line-height: 32px; overflow: hidden; padding-left: 20px; font-family: simsun; font-size: 14px; white-space:nowrap; text-overflow:ellipsis;}
.article_list dd a{color:#333;}
.article_list dd a:hover{color:#d51324;}
.tab-txt .control{margin-bottom:10px;border-bottom:1px solid #B5B5B5;}
.tab-txt .control .item{margin-bottom:-2px;font-size:20px;}
.tab-txt .control .item.current{border:0;border-bottom:3px solid #1F1F1F;font-weight:normal;font-size:26px;}	
.hot-tags{padding:0px 0;}
.hot-tags h5{font-size:14px; line-height: 22px; height: 22px;}
.hot-tags .box{white-space: nowrap;}
.article_content{ padding: 20px;}
.content_tit{ font-size: 16px; text-align: center; font-weight: bold; padding-bottom: 10px; border-bottom: solid 1px #e1e1e1;}
.content_text{ line-height: 200%; font-size: 14px; padding-top: 10px;}
.content_text a{ color:#8da7cb; text-decoration: underline;}
.hot-tags .box a{display: block; float: left; line-height: 28px; padding:0 8px; color:#313131; background: #f1f1f1; margin-right:8px; margin-top:5px; }
.buy-step .buy-step-first{width:285px;height:58px;padding:0;margin:0;background-color:#F2EBCF;overflow:hidden}
.buy-step .buy-step-first span{float:left;width:200px;height:46px;color:#ed145b;text-align:left}
.buy-step .buy-step-first span i{display:block;font-size:12px;line-height:20px;color:#515151}
.buy-step .buy-step-first span b{display:block;font-size:20px;line-height:26px;text-align:left;font-weight:400}
.buy-step .buy-step-first .coupon-btn{float:right;width:45px;height:38px;line-height:19px;padding:10px 6px 10px 14px;text-align:center;font-size:14px;letter-spacing:.1em;color:#FFF;background:url(/static/images/coupon-btn.png) repeat-y 0 0;transition:font-size .3s}
.buy-step .double-arrow span{position:absolute;top:23px;left:50%;display:block;width:24px;height:11px;margin-left:-12px;background:url(/static/images/arrow-right.png) no-repeat center center}
.buy-step .buy-step-first .coupon-btn:hover{font-size:16px}
</style>
<div style="width:1200px;margin:0 auto; background: #ffffff;">
<div class="guide-nav">
<a href="/">{:C('yh_site_name')}首页</a> &gt; <a href="javascript:;">优惠券头条</a> </div>
<div class="mains">
<div class="article_left">
<div class="article_content" style="width: 790px; overflow: hidden;">
  <div class="piece_box">
			<div class="content_tit" style="margin: auto 20px"><span>{$help.title}</span></div>
            <div class="content_text" style="margin: auto 20px"><div style="text-align: left;">
				<?php echo htmlspecialchars_decode($help['info']);?>
			</div></div>
</div>
<div style="text-align: center; padding-top: 30px;"> <a href="javascript:history.go(-1);">返回>></a></div>
</div>
</div>
<div class="article_right">
		<div class="jiu_shi jiu_item">
 <div class="goods-list main-container">
  <ul class="clearfix" style="width: 300px;">
		
				<volist name="sellers" id="val" >
				<li style="margin-right:8px; clear: both;">
                <a href="{:U('/item/',array('id'=>$val['id']))}" class="img cnzzCounter"  target="_blank" data-cnzz-type="1" data-cnzz="{$val['id']}">
                 <img src="{$val['pic_url']}_400x400" alt="">
                </a>
                <div class="padding">
                    <a target="_blank" href="{:U('/item/',array('id'=>$val['id']))}" class="title clearfix cnzzCounter" data-cnzz-type="1" data-cnzz="{$val['id']}">
                       {$val.title}
                    </a>
                    <div class="coupon-wrap clearfix" >
                    	<p>
                        	<span>券后价<font style="font-size: 18px;">{$val.coupon_price}</font>元</span>
                          <span style="float: right;"><if condition="$val.shop_type eq 'C' ">淘宝</if><if condition="$val.shop_type eq 'B' ">天猫</if><font color="red">{$val.price}</font>元</span>
                        </p>
                        <p>
                            <if condition="$val.shop_type eq 'C' "><i class="taobao"></i></if>
						<if condition="$val.shop_type eq 'B' "><i class="tmall"></i></if>月销量  <span class="num">{$val.volume}</span>,
														<span>优惠券<font color="red">{$val.quan}</font>元</span>
                        </p>        
                    </div>
                </div>
            </li>
										</volist>
								</ul>
								</div>
							</div>

<div style="clear: both;"></div>


	
</div>


</div>
</div>
	<include file="public:footer" />
</div>
</body>
</html>