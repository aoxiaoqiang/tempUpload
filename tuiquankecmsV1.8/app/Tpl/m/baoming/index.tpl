<include file="public:head" />
<div class="mui-content">
	<div class="am-g" style="padding-top: 20px;">
	  <div class="am-u-md-8 am-u-sm-centered">
	   <form action="/?g=m&m=baoming&a=enroll" method="post" class="am-form" id="enroll-form">
	      <fieldset class="am-form-set">
	        <input name="goods_url" required="required" type="text" id="goods_url" autocomplete="off" class="baominginput" placeholder="报名活动商品的淘宝地址">
	        <input name="goods_price" required="required"  type="text" id="goods_price" autocomplete="off" class="baominginput" placeholder="参加活动的最低价格">
	        <input type="text" id="goods_quan" name="goods_quan" required="required" autocomplete="off" class="baominginput" placeholder="参加活动的专享优惠券金额">
	           <input name="person_name" required="required" id="person_name"  type="text" autocomplete="off" class="baominginput" placeholder="您的称呼">
	              <input type="text" type="text" id="person_qq" name="person_qq" required="required" autocomplete="off" class="baominginput" placeholder="联系QQ">
	              <textarea  id="reason" name="reason" autocomplete="off" placeholder="您还可以在这里从客观的角度评价您的商品优势，将有助于报名审核通过。" cols="30" rows="6"> </textarea>
	      </fieldset>
	      <input type="hidden" name="from" value="{$_SERVER['HTTP_REFERER']}"/>
	      <button type="submit" id="smt" class="am-btn am-btn-primary am-btn-block">提交报名</button>
	    </form>
	  </div>
	</div>
</div>
<script type="text/javascript" src="__STATIC__/mobile/assets/js/base.js"> </script>
<yh:load type="js" href="__STATIC__/tqkwap/layer/layer.js" />
<script>
	$('#enroll-form').submit(function(){
		$.post($(this).attr('action'), $(this).serialize(), function(json){
			if(json.status != 1){
				layer.msg(json.msg, {
					icon: 2
				});
				return false;
			}
			layer.msg(json.msg, {
				icon: 1
			}, function(){
				var index = parent.layer.getFrameIndex(window.name);
				parent.layer.close(index);
			});
		}, 'json');
		return false;
	});		
</script>
<include file="public:foot" />
<script type="text/javascript">
	//侧滑容器父节点
	var offCanvasWrapper = mui('#offCanvasWrapper');
	 //主界面容器
	var offCanvasInner = offCanvasWrapper[0].querySelector('.mui-inner-wrap');
	 //菜单容器
	var offCanvasSide = document.getElementById("offCanvasSide");
	 //侧滑容器的class列表，增加.mui-slide-in即可实现菜单移动、主界面不动的效果；
	var classList = offCanvasWrapper[0].classList;
	classList.add('mui-slide-in');
	offCanvasWrapper.offCanvas().refresh();
	 //主界面和侧滑菜单界面均支持区域滚动；
	mui('#offCanvasSideScroll').scroll();
	mui('#offCanvasContentScroll').scroll();
	offCanvasInner.addEventListener('drag', function(event) {
	    event.stopPropagation();
	});
</script>