<!DOCTYPE html>
<html lang="zh-CN">
	<head>
		<meta charset="utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no" />
		<meta name="format-detection" content="telephone=no" />
		<meta name="format-detection" content="email=no" />
		<meta name="x5-orientation" content="portrait">
		<meta name="apple-mobile-web-app-capable" content="yes" />
		<meta name="apple-mobile-web-app-status-bar-style" content="black" />
		<title>直播间</title>
		<link rel="stylesheet" href="__STATIC__/tqkwap/css/mui.min.css">
		<link rel="stylesheet" href="__STATIC__/tqkwap/css/style.css?111" />
		<link rel="stylesheet" href="__STATIC__/tqkwap/fonts/iconfont.css" />
		<link rel="stylesheet" href="__STATIC__/zhibo/css/reset.css?v=2343" />
		<link rel="stylesheet" href="__STATIC__/zhibo/css/common.css?v=233" />
		<link rel="stylesheet" href="__STATIC__/zhibo/css/live.css?v=204" />
		<link rel="stylesheet" href="__STATIC__/zhibo/css/updown-loading.css?v=233" />
		<link rel="stylesheet" href="__STATIC__/zhibo/css/hongbao.css?v=32" />
		<link rel="stylesheet" href="__STATIC__/zhibo/css/sweet-alert.css?v=2343" />
		<link rel="stylesheet" href="__STATIC__/zhibo/css/flexible.css?v=320032" />
		<yh:load type="js" href="__STATIC__/tqkwap/js/jquery.min.js,__STATIC__/tqkwap/js/mui.js,__STATIC__/zhibo/js/iscroll.js,__STATIC__/zhibo/js/live-updown-loading.js,__STATIC__/zhibo/js/live.js,__STATIC__/zhibo/js/flexible.js" />
        <script src='http://cdn.bootcss.com/socket.io/1.3.7/socket.io.js'></script>
	</head>
	<body>
	<div id="offCanvasWrapper" class="mui-off-canvas-wrap mui-draggable">
	<div class="mui-inner-wrap">
	<div id="full" class="clearfix">
	<div class="header">
	</div>
	<div class="hongbao">
	<p><span>距离下次红包雨还有</span><span id="push_time_0"></span></p>
	</div>
			<div class="bg-xuhua"></div>
			<div class="viewport">
				<div class="live-box">
					<!--头像在线导航-->
					<div class="live-nav">
						<div class="live-total"><span id="person">{$person}</span>人</div>
						<div class="live-person">
							<div class="overflow-div">
								<ul id="avatar">
									<li style="display:none"></li>
								</ul>
								<div class="icon_own"></div>
							</div>
						</div>
						<div class="live-right-arrow"></div>
					</div>
					<!--余额显示-->
					
					<a href="{:U('user/ucenter')}" ><div class="live-balance fr">余额：<span id="money">{$money}</span><label>元</label></div></a>
				</div>
				<!--商品内容-->
				<div id="wrapper">
					<div class="live-product-content" id="scroller">
				 <div class="live-main-box" id="content">
				  <div class="pullDownLabel"></div>
	<div class="live-product-box">
	</div>
<volist id="val" name="list">
							<div class="live-product-box">
								<div class="live-prod-time"><span>{:date('H:i',$val['push_time'])}</span></div>
								<div class="live-prod-pic">
									<img class="user-icon" src="{$avatar}" />
									<div class="lpi-desc">
										<div class="ltxjiao"></div>
										<a target="_top" href="{$mdomain}/?g=m&m=detail&id={$val.id}">
											<img src="{$val.pic_url}_220x220.jpg" />
										</a>
									</div>
								</div>

								<div class="live-prod-text">
									<img class="user-icon" src="{$avatar}" />
									<a target="_top" href="{$mdomain}/?g=m&m=detail&id={$val.id}">
									<div class="lpt-desc">
										<div class="ltxjiao"></div>
										<p class="lpt-desc-con">原价{$val.price}元,【券后只要{$val.coupon_price}元】<br/>{$val.title}</p>
										<div class="lpt-desc-buy">
											<div class="lpt-desc-num"><label></label>领券省{$val.coupon}元</div>
												<div class="lpt-desc-buynow"><span>领券购买</span></div>
										</div>
									</div>
								</a>
								</div>

							</div>


</volist>	 

							</div>

						</div>
					</div>
				</div>
					
				<!--hongbao-->

				<div id="petalbox">

				</div>
				<div class="mo">
					<div class="sen">
						<div class="red">
							<span style="background-image: url(__STATIC__/zhibo/img/red-w.png);"></span>
							<button class="redbutton" type="领取红包">拆红包</button>
							<div class="red-jg">
								<h1>恭喜您</h1>
								<h5>获得红包<label id="hb_price">0</label>元,已存入账户余额。</h5>
								<a href="javascript:;" rel="" id="hb_id">确定</a>
							</div>
						</div>
					</div>
				</div>
				<div class="mo2">
					<div class="sen2">
						<div class="red2">
							<span style="background-image: url(__STATIC__/zhibo/img/red-w.png);"></span>
							<label id="lb2"></label>
						</div>
					</div>
				</div>
	</div>
	<script type="text/javascript" src="__STATIC__/zhibo/js/hb.js?v=3330">
	</script>
	<script language="JavaScript">
		var cf=0;
		function show_date_time(end,hbid,style, id) {
			today = new Date();
			timeold = ((end) * 1000 - today.getTime());
		if(timeold < 0 && cf==0){
		 $(".hongbao").css("display", "none");
		 cf=1;
	       var hb = $.ajax({
					type: 'post',
					url: '{:U("zhibo/push_hongbao")}',
					data: {
						token: hbid,
						t: Date.parse(new Date())
					},
					cache: false,
					dataType: 'json',
					success: function(pdata) {
					if(pdata.status=='ok') {
					var hb_count = pdata.count;
					if(hb_count > 0) {
						init(hb_count, pdata.hid);
						$("#petalbox").css("display", "block");
						$(".mo").css("display", "none");
						$("#petalbox div").on("tap", "img", function() {
							$("#petalbox").css("display", "none"); 
							var hid = $(this).attr('rel');
							if(hid > 0) {
								var sa = $.ajax({
									type: 'post',
									url: '{:U("zhibo/zhibo_save_hid")}',
									cache: false,
									data: {
										id: hid,
										openid:"{$openid}",
										t: Date.parse(new Date())
									},
									dataType: 'json',
									success: function(data) {
									if(data.status == "ok") {
												$('#hb_price').html(data.price);
												$('#money').html(data.money);
												$(".mo").css("display", "block");
												$('#hb_id').on("tap",function() {
												$(".mo").css("display", "none");
												})
											} else if(data.status == 'no') {
												$("#lb2").html("<p>" + data.msg + "</p><a href=\"javascript:;\" rel=\"\" id=\"hb_id2\">确定</a>");
												$(".mo2").css("display", "block");
												$('#money').html(data.money);
												$('#hb_id2').on("tap",function() {
													$(".mo2").css("display", "none");

												})
											} else {

											}
											cf = 0;
											$("#petalbox").empty();

									},

									error: function() {}
								});

							}

						});

					}

				}
						
					},
					error: function() {}
		});
				return;
		}
		if(timeold >= 0){
			setTimeout("show_date_time(" + end + ','+ hbid +',' + style + ',' + id + ")", 1000);
			sectimeold = timeold / 1000;
			secondsold = Math.floor(sectimeold);
			msPerDay = 24 * 60 * 60 * 1000;
			e_daysold = timeold / msPerDay;
			daysold = Math.floor(e_daysold);
			e_hrsold = (e_daysold - daysold) * 24;
			hrsold = Math.floor(e_hrsold);
			e_minsold = (e_hrsold - hrsold) * 60;
			minsold = Math.floor((e_hrsold - hrsold) * 60);
			e_seconds = (e_minsold - minsold) * 60;
			seconds = Math.floor((e_minsold - minsold) * 60);
			ms = e_seconds - seconds;
			ms = new String(ms);
			ms1 = ms.substr(2, 1);
			ms2 = ms.substr(2, 2);
			hrsold1 = daysold * 24 + hrsold;
			if(style == 1) {
				$("#push_time_" + id).html('<em>' + (hrsold1 < 10 ? '0' + hrsold1 : hrsold1) + "</em>时<em>" + (minsold < 10 ? '0' + minsold : minsold) + "</em>分<em>" + (seconds < 10 ? '0' + seconds : seconds) + "</em>秒");
			} else if(style == 2) {
				$("#push_time_" + id).html('<em>' + daysold + "</em>天<em>" + (hrsold < 10 ? '0' + hrsold : hrsold) + "</em>时<em>" + (minsold < 10 ? '0' + minsold : minsold) + "</em>分<em>" + (seconds < 10 ? '0' + seconds : seconds) + "</em>秒");
			} else if(style == 3) {
				$("#push_time_" + id).html("<em>" + (hrsold1 < 10 ? '0' + hrsold1 : hrsold1) + "</em>时<em>" + (minsold < 10 ? '0' + minsold : minsold) + "</em>分<em>" + (seconds < 10 ? '0' + seconds : seconds) + "." + ms1 + "</em>秒");
			} else {
				$("#push_time_" + id).html(daysold + "天" + (hrsold < 10 ? '0' + hrsold : hrsold) + " 时" + (minsold < 10 ? '0' + minsold : minsold) + "分" + (seconds < 10 ? '0' + seconds : seconds) + "秒." + ms2);
			}
			
			}
		
		}
		
		$(document).ready(function() {
			// 点击redbutton按钮时执行以下全部
			$('.redbutton').on("tap",function() {
				// 在带有red样式的div中添加shake-chunk样式
				$('.red').addClass('shake-chunk');
				// 点击按钮2000毫秒后执行以下操作
				setTimeout(function() {
					// 在带有red样式的div中删除shake-chunk样式
					$('.red').removeClass('shake-chunk');
					// 将redbutton按钮隐藏
					$('.redbutton').css("display", "none");
					// 修改red 下 span   背景图
					$('.red > span').css("background-image", "url(__STATIC__/zhibo/img/red-y.png)");
					// 修改red-jg的css显示方式为块
					$('.red-jg').css("display", "block");
				}, 0);
			});
			var socket = io('http://push.tuiquanke.com:2120');
			var uid = "{$keyuid}";
			socket.on('connect', function() {
			socket.emit('login', uid);
			});
			
socket.on('product', function(msg){
if(typeof msg === 'string') {
var info = JSON.parse(msg);
var prohtml='<div class="live-product-box"><div class="live-prod-time"><span>'+info['push_time']+'</span></div><div class="live-prod-pic"><img class="user-icon"src="{$avatar}"/><div class="lpi-desc"><div class="ltxjiao"></div><a target="_top"href="{$mdomain}/?g=m&m=detail&id='+ info['id'] +'"><img src="'+info['pic_url']+'_220x220.jpg"/></a></div></div><div class="live-prod-text"><img class="user-icon"src="{$avatar}"/><a target="_top"href="{$mdomain}/?g=m&m=detail&id='+info['id']+'"><div class="lpt-desc"><div class="ltxjiao"></div><p class="lpt-desc-con">原价'+info['price']+'元,【券后只要'+info['coupon_price']+'元】<br/>'+info['title']+'</p><div class="lpt-desc-buy"><div class="lpt-desc-num"><label></label>领券省'+info['coupon']+'元</div><div class="lpt-desc-buynow"><span>领券购买</span></div></div></div></a></div></div>';
$('#content .live-product-box:last').after(prohtml);
myScroll.refresh();
myScroll.scrollToElement(document.querySelector('#content .live-product-box:last-child'),0);

}	
});

socket.on('update_online_count', function(msg) {
				var pe = $.ajax({
					type: 'post',
					url: '{:U("zhibo/userlist")}',
					data: {
						openid:"{$openid}",
						t: Date.parse(new Date())
					},
					cache: false,
					dataType: 'json',
					success: function(data) {
						if(data.status == "ok") {
							$('#person').html(Number(data.count)+Number(msg));
							$('#money').html(data.money);
							var jsontoarray = data.result;
							var avatar = '';
							jsontoarray.forEach(function(value, index, arr) {
								avatar = avatar + '<li><img class="headPics" src="' + arr[index]['avatar'] + '"></li>';
							});
							$("#avatar").html(avatar);
							var hongbao_time=data.hongbao_time;
							var hongbao_id=data.hongbao_id;
							var timestamp = Math.round($.now()/1000).toString();
							if(Number(hongbao_time)-Number(timestamp)>0){
							$(".hongbao").css("display","block");
							 $(".hongbao span").html(function() {
								var reg = /^[0-9]+$/;
								if(reg.test(hongbao_time)) {
									show_date_time(hongbao_time,hongbao_id, 1, 0);
									$('.hongbao p span').html( show_date_time(hongbao_time,hongbao_id,1, 0) );
								}
							});	
								
							}else{
							$(".hongbao").css("display", "none");	
							}

						} else {

						}
						
						
					},
					error: function() {}
				});
			});

			socket.on('hongbao', function(msg) {
				$(".hongbao").css("display", "none"); //隐藏红包倒计时
				
				if(typeof msg === 'string') {
					var jsontoarray = JSON.parse(msg);
					var hb_count = jsontoarray['count'];
					if(hb_count > 0) {
						init(hb_count, jsontoarray['hid']);
						$("#petalbox").css("display", "block");
						$(".mo").css("display", "none");
						$("#petalbox div").on("tap", "img", function() {
							$("#petalbox").css("display", "none"); //马上隐藏
							var hid = $(this).attr('rel');
							if(hid > 0) {
								var sa = $.ajax({
									type: 'post',
									url: '{:U("zhibo/zhibo_save_hid")}',
									cache: false,
									data: {
										id: hid,
										openid:"{$openid}",
										t: Date.parse(new Date())
									},
									dataType: 'json',
									success: function(data) {
									 if(data.status == "ok") {
												$('#hb_price').html(data.price);
												$('#money').html(data.money);
												$(".mo").css("display", "block");
												$('#hb_id').on("tap",function() {
												$(".mo").css("display", "none");
												})
											} else if(data.status == 'no') {
												$("#lb2").html("<p>" + data.msg + "</p><a href=\"javascript:;\" rel=\"\" id=\"hb_id2\">确定</a>");
												$(".mo2").css("display", "block");
												$('#money').html(data.money);
												$('#hb_id2').on("tap",function() {
													$(".mo2").css("display", "none");

												})
											} else {

											}
											$("#petalbox").empty();

									},

									error: function() {}
								});

							}

						});

					}

				}

			});

		});
	</script>

<include file="public:foot" />