<include file="public:head" />
<div class="mui-content">
	<div class="am-g" style="padding-top: 20px;">
	    <div class="am-u-md-8 am-u-sm-centered">
		<form action="/?g=m&m=baoming&a=report" method="post" id="report-form">
			<div class="am-alert am-alert-secondary" >如果发现优惠券失效，或者有其它违规行为，欢迎在这里举报给我们。</div>
		      <fieldset class="am-form-set">
		 		<textarea style="width: 100%;" required="required" name="reason"  placeholder="" rows="7"></textarea>
		      </fieldset>
		      <input type="hidden" name="from" value="{$_SERVER['HTTP_REFERER']}"/>
		      <input type="hidden" name="url" value="https://item.taobao.com/item.htm?id={:I('num_iid')}"/>
			  <input type="hidden" name="num_iid" value="{:I('num_iid')}"/>
			  <input type="hidden" name="from" value="{$_SERVER['HTTP_REFERER']}"/>
		      <button type="submit" id="smt" class="am-btn am-btn-primary am-btn-block">提交举报</button>
		</form>
	  </div>
	</div>
</div>
<script type="text/javascript" src="__STATIC__/mobile/assets/js/base.js"> </script>
<yh:load type="js" href="__STATIC__/tqkwap/layer/layer.js" />
<script>
	$('#report-form').submit(function(){
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