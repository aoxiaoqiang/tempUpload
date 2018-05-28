<include file="public:top" />
	<body>
		<div class="wrap">
		<div class="detail">
			<div class="pic">
				<img src="{$item.pic_url}_480x480">
				<a href="javascript:;" class="back mui-action-back"><i class="mui-icon mui-icon-arrowleft"></i></a>
			</div>			
			<div class="tit">
				<p class="mui-ellipsis-2">
				<if condition="$item['shop_type'] eq 'B'">
				<img src="__STATIC__/tqkwap/images/tmall.png">
				</if>
				<if condition="$item['shop_type'] eq 'C'">
				<img src="__STATIC__/tqkwap/images/taobao.png">
				</if>	
					{$item.title}</p>
			</div>
			<div class="price flexbox mui-clearfix">
				<div class="txt mui-pull-left flex">
					<h4 class="c-main">券后价：￥<span>{$item.coupon_price}</span><em>（包邮）</em></h4>
					<p><if condition="$item['shop_type'] eq 'B'">天猫</if><if condition="$item['shop_type'] eq 'C'">淘宝</if>在售:￥{$item.price}    月销 {$item.volume} 件</p>
				</div>	
				<div class="tag tag-violet mui-pull-right">
					<p>RMB</p>
					<h4>{$item.quan}元</h4>
					<p>领券立省</p>
				</div>
			</div>			
			<div class="report mui-clearfix">
				<ul>
					<li><a href="/?g=m&m=baoming&a=index"><i class="iconfont icon-jia"></i>卖家报名</a></li>
					<li><a href="/?g=m&m=baoming&a=jubao&num_iid={$item.num_iid}"><i class="iconfont icon-jubao"></i>举报此商品</a></li>
				</ul>
			</div>
		</div>
		<input type="hidden" id="Pid" value="{$item.id}" />
        <input type="hidden" id="up_time" value="{$item.up_time}" />  
		<ul class="mui-table-view">
			<li class="mui-table-view-cell mui-collapse">
				<a href="javascript:;" class="mui-navigate-right product-info" data-itemid="{$item.num_iid}">
					商品图文详情 <span class="mui-badge mui-badge-primary mui-badge-inverted">(点击展开)</span>
				</a>
				<div class="mui-collapse-content">
					
				</div>
			</li>
		</ul>
		
		<div class="like">
			<div class="mui-text-center mui-content-padded">
				<i class="iconfont icon-heart c-main"></i>猜你喜欢
			</div>
			<ul class="mui-clearfix">
<volist name="orlike" id="val">
				<li>
					<a href="{:U('detail/index',array('id'=>$val['id']))}">
						<img src="{$val.pic_url}_300x300"/>
						<p class="mui-ellipsis">{$val.title}</p>
						<span class="c-main">券后价：￥{$val.coupon_price}</span>
					</a>
				</li>
</volist>

			</ul>
		</div>
		
		</div>
		<nav class="mui-bar mui-bar-tab mui-row buy-nav">
			<a href="{:C('yh_headerm_html')}" class="mui-col-xs-2 icon"><i class="iconfont icon-home"></i><span>首页</span></a>
			<a href="javascript:;" class="mui-col-xs-2 icon" id="kefu"><i class="iconfont icon-tel"></i><span>客服</span></a>
			
<if condition="$item['que'] eq 1 || $item['tk'] eq 0">
<a href="<if condition="C('URL_MODEL') eq 2 and C('APP_SUB_DOMAIN_DEPLOY') eq true">{:U('/out/index',array('id'=>$item['id']))}<else/>{:U('/m/out/index',array('id'=>$item['id']))}</if>" class="mui-col-xs-4 browser" >
<else/> <a id="coupon" href="javascript:;"  class="mui-col-xs-4 browser" >
    </if> 领券下单</a>
			<a href="javascript:;" 
			<if condition="$item['que'] eq 1 || $item['tk'] eq 0">
		 class="mui-col-xs-4 taobao" id="kouling" 
			<else/>	
		class="mui-col-xs-4 taobao"	id="couponkouling"
			</if>
				>用淘口令领券</a>
		</nav>
		
		<div class="modal-dialog mui-text-center" id="modal">
			<div class="modal-hd">点击二维码放大后长按关注<a href="javascript: void(0)" class="close">×</a></div>
			<img src="{:C('yh_site_background')}" alt=""/>
			<span>客服微信</span>
		</div>
		
		<div class="modal-dialog mui-text-center" id="amoybuy">
			<div class="modal-hd">淘口令购买<a href="javascript: void(0)" class="close">×</a></div>
			<div class="fq-goods-border">
				<div class="fq-explain">长按框内 &gt; 拷贝</div>
				<div class="copy_key" id="copy_key_ios">复制这条信息{$item.quankouling}打开【手机淘宝】即可领取优惠券购买！</div>
				<textarea id="copy_key_android">复制这条信息{$item.quankouling}打开【手机淘宝】即可领取优惠券购买！</textarea>
				<button class="copy" data-clipboard-action="copy" data-clipboard-text="复制这条信息{$item.quankouling}打开【手机淘宝】即可领取优惠券购买！" >一键复制</button>
			</div>
			<div class="fq-instructions">
				<span>
					<span>温馨提示：</span>
					手机无【手机淘宝】者，可选择浏览器购买方式哦~
				</span>
			</div>
		</div>
<script>
		
mui.init({
		swipeBack: false,
	});
	
	mui('body').on('tap','a:not(#offCanvasBtn)',function(){
		window.location.href=this.href;
	});
			var clipboard = new Clipboard('.copy');
			 clipboard.on('success', function(e) {
	         console.info('Action:', e.action);
             console.info('Text:', e.text);
             console.info('Trigger:', e.trigger);
             e.clearSelection();
			});
			$('.copy').on('tap',function(){
			  layer.msg('复制成功', {icon: 1,time:2000});	
			})
			 
			mui('body').on('tap','a',function(){
				window.location.href=this.href;
			});
			$("#kefu").on("tap",function(){
				layer.open({
					type:1,
					content:$("#modal"),
					skin:'modal',
					title:false,
					scrollbar:false,
					success:function(layero, index){
						$(".close").on("tap",function(){
							layer.close(index)
						})
					},
					shade:0.5,
					shadeClose:true,
				})
			})
			$("#kouling").on("tap",function(){
				layer.open({
					type:1,
					content:$("#amoybuy"),
					skin:'amoybuy',
					title:false,
					scrollbar:false,
					success:function(layero, index){
						$(".close").on("tap",function(){
							layer.close(index)
						})
					},
					shade:0.5,
					shadeClose:true,
					area:"80%"
				})
			})
	$('mui-action-back').on('tap',function(){
	window.history.go(-1);
	})
	
			function back() {
				var last_page_url = (document.referrer);
				if (last_page_url) {
					window.history.back(-1)
				} else {
					window.location.href = '/'
				}
			}
<if condition="$uptime gt 2000 ">
$(document).ready(function(){
var Pid=$('#Pid').val();
var up_time=$("#up_time").val();	
$.ajax({ 
        url: "/?m=min&a=checkcoupon",  
        type:'get',
        dataType: "text",
        timeout :5000,
        data: { id: Pid, uptime: up_time },
        async: true,  
        success: function(data){  
        if(data=='no'){	
			loiMsg("抱歉！此商品优惠券已失效请看看其它商品吧");
		}
        }  
    });
});
</if>
<if condition="$item['tk'] eq 1 && $item['que'] eq 0">
$("#coupon,#couponkouling").on("tap",function(){
var runcount = 0;
layer.msg('优惠券生成中，请稍等！', {
  icon: 16
  ,shade: 0.01,
  time:10000
});	
autoplay = setInterval(function(){
$.ajax({ 
        url: "/?g=m&m=min&a=checkque",  
        type:'get',
        dataType: "json",
        timeout :5000,
        data: { id: {$item.num_iid}, uptime: {:time()} },
        async: true,  
        success: function(data){
        if(data.status=='ok'){
		layer.closeAll('loading');
		clearInterval(autoplay);
	  layer.msg('生成成功，现在可以领券下单啦！', {icon: 1,time:2000});
	   setTimeout(function(){
	   window.location.reload();
	   },2000);
		}
       if(data.status=='no'){
       	runcount=runcount+1
       if(runcount>0){
       layer.closeAll('loading');
       clearInterval(autoplay);
       layer.msg('生成成功，现在可以领券下单啦！', {icon: 1,time:2000});
	   setTimeout(function(){
	   window.location.reload();
	   },2000);
       }
       }

        }  
});	
},3000);

});
</if>

$(".product-info").on("tap",function(){
$.ajax({ 
        url: "{:U('detail/productinfo',array('numiid'=>$item['num_iid']))}",  
        type:'get',
        dataType: "json",
        timeout :5000,
        async: true,  
        success: function(data){
        if(data.status=='ok'){
        	$('.mui-collapse-content').html(data.content);
        }
        }
     });
        	
});
</script>
	</body>
</html>
