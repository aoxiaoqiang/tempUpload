<div id="footer" style="background-color: #444;height: 190px;width: 100%;border-top: 3px solid #FF472B;">
	<div class="footer-wrapper " style="width: 1200px;margin: 0 auto;position: relative;text-align: center">
		<img src="__STATIC__/tuiquanke/images/bottom_text.png" alt="" style="border: 0;margin-top: 50px;">
		<div class="author" style="    position: absolute;
    top: 67px;
    left: 990px;
    color: #FFFFFF;
    font-size: 18px;">by &nbsp;&nbsp;{:C('yh_site_name')}
	</div>
	<div class="text" style="color: #ffffff; font-size: 16px;margin-top: 33px;"> CopyRight&nbsp;2017 &nbsp;{:C('yh_site_name')}@ 天猫、<a href="{:C('yh_site_url')}" style="color: #ffffff;">淘宝优惠券</a> &nbsp;&nbsp;&nbsp;{:C('yh_site_icp')} &nbsp;&nbsp;
		<a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin={:C('yh_qq')}&site=qq&menu=yes" style="color: #8da7cb" title="联系我帮你解答">^_^亲遇到问题，联系我帮你处理哈</a>
	</div>
</div>
<div class="foot" style="display: none;">
	{:C('yh_statistics_code')}
</div>
</div>
<div id="back_top" class="back_top">
	<if condition="strlen($request_url) elt 1">
	<img id="wechat" src="{:C('yh_site_flogo')}" />	
	</if>
	<a href="javascript:;" class="call-top" title="返回顶部"></a>
	<a id="checkTrap" class="checkTrap" target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin={:C('yh_qq')}&site=qq&menu=yes"><span class="call-check" title="联系客服"></span>
	</a>
	<div class="hide">
	</div>
</div>
<a id="checkTrap" class="checkTrap" target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin={:C('yh_qq')}&site=qq&menu=yes"></a>
<if condition="C('yh_site_secret') eq '1'">
<yh:load type="js" href="__STATIC__/tuiquanke/js/jquery.js,__STATIC__/tuiquanke/js/slider.js,__STATIC__/tuiquanke/js/layer/layer.js,__STATIC__/tuiquanke/js/clipboard.min.js,__STATIC__/tuiquanke/js/base.js,__STATIC__/tuiquanke/js/jquery.scrollLoading.js" />
<script type="text/javascript">
		$(".scrollLoading").scrollLoading(); 
</script>
<else/>
<yh:load type="js" href="__STATIC__/tuiquanke/js/jquery.js,__STATIC__/tuiquanke/js/slider.js,__STATIC__/tuiquanke/js/layer/layer.js,__STATIC__/tuiquanke/js/clipboard.min.js,__STATIC__/tuiquanke/js/base.js" />
</if>