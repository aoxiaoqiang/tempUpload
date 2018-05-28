<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>{$page_seo.title}</title>
		<meta name="keywords" content="{$page_seo.keywords}" />
		<meta name="description" content="{$page_seo.description}" />
		<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<meta name="format-detection" content="telephone=no" />
		<meta name="full-screen" content="yes">
        <meta name="x5-fullscreen" content="true">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<link rel="stylesheet" href="__STATIC__/tqkwap/css/mui.min.css">
		<link rel="stylesheet" href="__STATIC__/tqkwap/css/style.css?161" />
		<link rel="stylesheet" href="__STATIC__/tqkwap/fonts/iconfont.css" />
       <yh:load type="js" href="__STATIC__/tqkwap/js/jquery.min.js,__STATIC__/tqkwap/layer/layer.js,__STATIC__/tqkwap/js/mui.js,__STATIC__/tqkwap/js/jquery.SuperSlide.2.1.1.js" />
	</head>
	<body>
		<div id="offCanvasWrapper" class="mui-off-canvas-wrap mui-draggable">
<include file="public:nav" />
			<div class="mui-inner-wrap">
				<header id="header" class="mui-bar mui-bar-nav">
				<form action="{:U('list/index')}"  id="so" method="get">
					<!--<div class="mui-input-row mui-search">
					    <input type="search" value="{$sokey}" name="k" onblur="$('#so').submit()" class="mui-input-clear" placeholder="搜搜看您想要的商品优惠券">
					</div>-->
					<div class="mui-input-row searchtop">
						<span class="mui-icon mui-icon-search"></span>
					    <input type="text" value="{$sokey}" name="k" onblur="$('#so').submit()" placeholder="搜搜看您想要的商品优惠券">
					</div>
				</form>
				<a id="offCanvasBtn" href="#offCanvasSide" class="mui-icon mui-action-menu mui-icon-bars mui-pull-right"></a>
				</header>