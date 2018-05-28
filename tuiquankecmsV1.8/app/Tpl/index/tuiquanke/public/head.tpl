{$yh|yh}
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<title>{$page_seo.title}</title>
<meta name="keywords" content="{$page_seo.keywords}" />
<meta name="description" content="{$page_seo.description}" />
<link rel="icon" href="/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="/static/tuiquanke/css/all.css" />
<script type="text/javascript">
	var system ={win : false,mac : false,xll : false};
	var p = navigator.platform;
	system.win = p.indexOf("Win") == 0;
	system.mac = p.indexOf("Mac") == 0;
	system.x11 = (p == "X11") || (p.indexOf("Linux") == 0);
	var wapurl=window.location.pathname.replace(/index.php\//, "");
	 wapurl=wapurl.replace(/item/, "detail");
	if(system.win||system.mac||system.xll){}else{
	window.location.href="{:C('yh_headerm_html')}" + wapurl}
</script>
{:C('yh_taojindian_html')}
