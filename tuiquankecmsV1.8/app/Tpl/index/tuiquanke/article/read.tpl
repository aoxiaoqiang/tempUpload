<!doctype html>
<html>
<head>
<title>淘宝、天猫最新优惠券头条,内部优惠券播报_{:C('yh_site_name')}</title>
<meta name="keywords" content="淘宝内部优惠券播报,优惠券直播" />
<meta name="description" content="{:C('yh_site_name')}是免费淘宝、天猫内部优惠券直播平台，提供最新天猫优惠券，淘宝网优惠券，天猫、淘宝红包免费领取。" />
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
.article_left{ width:860px ; float: left; border-top: 1px solid #e5e5e5;   padding-bottom: 30px;}
.article_right{ width:325px; float: left; border-left: 1px solid #e5e5e5; overflow: hidden; padding-left: 10px;}
.article_left ul{ padding: 20px;}
.ad_300{ width: 100%; height: 250px;}
.guide-nav,.guide a,.hotPet .pet-list dt i,.ol-txt li i{}
.guide-nav{height:32px;padding-left:17px;line-height:32px;background-position:-490px 11px;color:#888; margin-top: 15px;padding-top: 10px;}
.guide-nav a{color:#888; font-size: 14px;}
.article_list{ padding-top: 30px; padding-left: 20px;clear: both;height: 160px;}
.article_list dd{width: 160px;height: 160px;float: left;overflow: hidden;}
.article_list dt{overflow: hidden; padding: 0 20px;  }
.article_list dt a{color:#333;height: 32px; line-height: 32px; font-family: simsun; font-size: 16px; font-weight: bold; white-space:nowrap; text-overflow:ellipsis; }
.article_list dt p{font-size: 12px;line-height: 24px;color: #888;}
.article_list dt a:hover{color:#FF472B;}
.tab-txt .control{margin-bottom:10px;border-bottom:1px solid #B5B5B5;}
.tab-txt .control .item{margin-bottom:-2px;font-size:20px;}
.tab-txt .control .item.current{border:0;border-bottom:3px solid #1F1F1F;font-weight:normal;font-size:26px;}	
.modBoxB{margin-top: 20px;}
.hot-tags{padding:0px 0;}
.hot-tags h5{font-size:14px; line-height: 22px; height: 22px;}
.hot-tags .box{white-space: nowrap;padding-top: 10px;}
.hot-tags .box a{display: block; float: left; line-height: 28px; padding:0 8px; color:#313131; background: #f1f1f1; margin-right:8px; margin-top:5px; }
</style>

 
<div style="width:1200px;margin:0 auto; background: #ffffff;">
<div class="guide-nav">
<a href="/">{:C('yh_site_name')}首页</a> &gt; <a href="javascript:;">优惠券头条</a> </div>
<div class="mains">

<div class="article_left">

		
<volist name="items_list" id="list">
<dl class="article_list">
	
<dd><a href="<if condition="C('URL_MODEL') eq 2">/article/view_{$list.id}<else/>{:U('/article/read/',array('id'=>$list['id']))}</if>" title="{$list.title}"><img src="{$list.pic}" alt="" height="140"></a></dd>
<dt>
	<a href="<if condition="C('URL_MODEL') eq 2">/article/view_{$list.id}<else/>{:U('/article/read/',array('id'=>$list['id']))}</if>" title="{$list.title}">{$list.title}</a>
	<p style="height: 120px; overflow: hidden;">{:cut_html_str($list['info'],356,'...')}</p>
</dt>
</dl>	
</volist>

		
<div style="padding-top: 30px; clear: both;"></div>
    <div id="yw0" class="pager">
				{$page}
</div>
	
</div>

<div class="article_right">



<div class="side_item tj_hot">
    <div class="side_item_tit">
        <i></i>热门推荐
    </div>
    <div class="side_item_content tj_hot_cot clearfix">
        <ul>
<volist name="sellers" id="val" >
			<li>
                <a target="_blank" class="tj_hot_img" href="{:U('/item/',array('id'=>$val['id']))}"><img src="{$val['pic_url']}_400x400" height="100" width="100" alt=""></a>
                <div class="hot_info">
                    <div class="hot_info_tit">
                        <a target="_blank" href="{:U('/item/',array('id'=>$val['id']))}">{$val.title}</a>
                    <div style="font-size: 14px;"> 券后价：<label style="color: #E73121;"> {$val.coupon_price} </label>元<br/> 已有<span class="num" style="color: #E73121;">{$val.volume}</span>人购买</div> 
                    </div>
                </div>
            </li>
	</volist>	
        </ul>
    </div>
</div>
</div>


</div>
</div>
	<include file="public:footer" />
</div>
</body>
</html>