<!DOCTYPE HTML>
<html lang="zh-CN" xml:lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no" />
<title>直播间</title>
<style>
	*{margin: 0;padding:0;}
	iframe{display: block;}
</style>
<yh:load type="js" href="__STATIC__/mobile/assets/js/jquery.js" />
</head>
<body>
	<div id="wrapper">
		<div id="scroller">
 			<iframe id="js_iframe" src="{$zhibourl}/?openid={$openid}"  marginwidth="0" marginheight="0" scrolling="no" frameborder="0" width="100%" height="500"></iframe>
 		</div>
	</div>
<script>
	var doc=$(document).height();
	var bod=$('body').height();
	$("#js_iframe").attr("height",doc);
</script>
</body>
</html>