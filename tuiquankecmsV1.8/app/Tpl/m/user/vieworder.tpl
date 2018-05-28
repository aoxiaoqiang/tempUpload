<include file="public:top" />
	<body>
		<div id="offCanvasWrapper" class="mui-off-canvas-wrap mui-draggable">
	<include file="public:nav" />
			<div class="mui-inner-wrap">
		<header class="mui-bar mui-bar-nav white-bar">
			<a href="javascript:;" onclick="history.back()" class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left grey"></a>
			<h1 class="mui-title">头条阅读</h1>
			<a id="offCanvasBtn" href="#offCanvasSide" class="mui-icon mui-action-menu mui-icon-bars mui-pull-right"></a>
		</header>
		<!--article-->
		<div class="mui-content">
			<div class="mui-scroll-wrapper" id="article">
				<div class="mui-scroll">
					<div class="article">
						<div class="title">
							<h3 class="mui-ellipsis-2">如何查看商品订单编号</h3>
							<div class="mui-clearfix">
								<a href="{:U('article/index/',array('cateid'=>$info['cate_id']))}"><span class="mark">联盟百科</span></a>
								<p class="time">{:date('Y-m-d',$info['add_time'])}</p>
							</div>
						</div>
						<div class="content">
								<p>
								一、手机淘宝查看订单编号
								</p>
								<p>
								1、打开手机淘宝--&gt;我的淘宝--&gt;我的订单--&gt;查看更多订单
								</p>
								<p>
								选择订单进入订单详情（如下图）并复制订单编号<br/>
								<img alt src="__STATIC__/tqkwap/images/59b6123f8acdd.jpg"/>
								</p>
								<p>
								<img alt src="__STATIC__/tqkwap/images/59b6123f08b45.jpg"/>
								</p>
								<p>
								2、进入用户中心提交复制的订单编号
								</p>
								<p>
								二、电脑淘宝查看订单编号<br/>
								1、登录电脑端淘宝--&gt;我的淘宝下选择已买到的宝贝（如下图）<br/>
								<img alt src="__STATIC__/tqkwap/images/59b61391dbf70.jpg"/>
								</p>
								<p>
								2、订单列表中选择需要提交的商品订单并复制（如下图）
								</p>
								<p>
								<img alt src="__STATIC__/tqkwap/images/59b613917477a.jpg"/>
								</p>
								<p>
								3、进入用户中心提交复制的订单编号
								</p>
						</div>
						<!--更多商品-->
						<if condition="$sellers">
							<div class="recommend">
								<h3>【好物推荐】</h3>
								
								<ul>
									<volist name="sellers" id="val" >
									<li class="item">
										<a  href="<if condition="C('APP_SUB_DOMAIN_DEPLOY') eq false">{:U('/m/detail',array('id'=>$val['id']))}<else/>{:U('/detail',array('id'=>$val['id']))}</if>">
											<img src="{$val.pic_url}_480x480">
											<span>券后价：￥{$val.coupon_price}</span>
										</a>
										<p class="mui-ellipsis-2"><i class="iconfont icon-triangle-arrow-u"></i>{$val.title}</p>
									</li>
									</volist>
								</ul>
							</div>
						</if>
						
						<if condition="$articlelike">
						<div class="relevant">
							<h3>推荐相关文章</h3>
							<ul class="mui-table-view">
							<volist name="articlelike" id="art" >	
							    <li class="mui-table-view-cell mui-media">
							    	<a href="<if condition="C('URL_MODEL') eq 2">/article/view_{$art.id}<else/>{:U('/m/article/read',array('id'=>$art['id']))}</if>">
								    	<img class="mui-media-object mui-pull-left" src="{$art.pic}"/>
								    	<div class="mui-media-body">
							                <h4 class="mui-ellipsis">{$art.title}</h4>
							                <div class="mui-clearfix">
							              <span>{$art.catename}</span>
							                	<p class="time">{:date('Y-m-d',$art['add_time'])}</p>
							                </div>
							            </div>
							        </a>
							    </li>
							 </volist>
							</ul>
						</div>
							</if>
						
					</div>
				</div>
			</div>
		</div>
		<!-- off-canvas backdrop -->
				<div class="mui-off-canvas-backdrop"></div>
		<a id="scrollToTop" class="backTop hide"> <span class="iconfont icon-top"></span> </a>
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
			mui('body').on('tap','a:not(#offCanvasBtn)',function(){
				window.location.href=this.href;
			});
		</script>
		</div>
		</div>  
<include file="public:foot" />
<script type="text/javascript">
	var scrollToTopBox = document.getElementById('scrollToTop');
	scrollToTopBox.addEventListener('tap', function(e) {
	e.stopPropagation();
	mui('#article').scroll().scrollTo(0,0,1000);
	window.scrollTo(0, 1000);
	});
</script>