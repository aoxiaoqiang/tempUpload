<div id="navTop">
    <div id="top">
        <div id="topleft" style="margin: 0;line-height: 25px;">
        	{:C('yh_app_key')}
        </div>
        <ul id="topright" style="line-height: 25px;">
            <li style=" margin-right: 8px;"><a  href="http://wpa.qq.com/msgrd?v=3&uin={:C('yh_qq')}&site=qq&menu=yes" style="color: #757575">联系客服</a>
            </li>
            <li style="margin-right: 8px;"><a  href="javascript:;" id="btn_baoming" msg="请不要修改“卖家报名”否则将无法享受推券客免费产品服务">卖家报名</a>
            </li>

        </ul>
        <div class="clear"></div>
    </div>
</div>

<div id="headNav">
    <div id="header" style="padding-bottom: 10px;">
        <a href="{:C('yh_site_url')}"  title="{:C('yh_site_name')}"  style="height: 80px;display: inline-block;float: left;" class="cnzzCounter" >
           <img src="{:C('yh_site_logo')}" width="250" height="70" alt="{:C('yh_site_name')}淘宝优惠券网站">
        </a>
        <div id="showList">
            <div id="search">   <form id="query_form" method="get" action="__ROOT__/index.php">
                   <input type="hidden" name="m" value="index">
					<input type="hidden" name="a" value="so">
                    <input type="text" value="{$key}" name="k" id="k" autocomplete="off" placeholder="请输入您要查找的商品名称"/>
                    <button type="button" class="cnzzCounter" onclick="document.getElementById('query_form').submit()" data-cnzz-type="54" data-cnzz="1">搜索</button>
                </form>
            </div>
            <dl>
                <dt class="rg"></dt>
            </dl>
            <dl>
                <dt class="zy"></dt>
            </dl>
            <dl>
                <dt class="qc"></dt>
            </dl>
        </div>
        <div class="clear"></div>
    </div>
</div>
<div id="baner">
    <div id="nav" style="font-size: 15px;">
        <a href="/" class="cnzzCounter iconM <if condition="strlen($request_url) elt 1 || stripos($request_url,'item') || stripos($request_url,'article') || stripos($request_url,'cate')">active</if>" style="padding:8px 0px;width:240px; text-align: left;" data-cnzz-type="50" data-cnzz="0"><i class="iconfont">&#xe60d;</i><span style="padding-left: 80px; text-align: left;">今日新品</span></a>
         <yh:nav type="lists" style="main">
	<volist name="data" id="val"> 
     <a class="cnzzCounter<if condition="$nav_curr eq $val['alias']"> iconM active</if> "  href="{$val.link}" style="padding:8px 15px;"  data-cnzz-type="51" data-cnzz="0">{$val.name}
	<if condition="$val.target eq 1"><div style="position:absolute; width:24px; height:32px; background:#FFCC00;margin-left: 107px; margin-top: -25px; background:url(__STATIC__/tuiquanke/images/HOTT_qeu.gif)"></div>
	</if> </a> 
	</volist>
		</yh:nav>       
    </div>
</div>
<div style="clear: both;"></div>
