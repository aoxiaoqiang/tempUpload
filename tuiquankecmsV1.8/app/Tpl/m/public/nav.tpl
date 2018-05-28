		<aside id="offCanvasSide" class="mui-off-canvas-right">
				<div id="offCanvasSideScroll" class="mui-scroll-wrapper">
					<!--slide-->
					<div class="mui-scroll">
						<div class="series">
							<h4>商品分类</h4>
							<div class="mui-row">
								<div class="mui-col-xs-4"><a href="{:U('list/index')}" >全部商品</a></div>
					<volist name="catetree" id="tree">
					 <div class="mui-col-xs-4"><a href="{:U('list/index',array('cid'=>$tree['id']))}" >{$tree.name}</a></div>
					</volist>
							</div>
							<h4>导航索引</h4>
							<div class="mui-row">
								<div class="mui-col-xs-4"><a href="{:C('yh_headerm_html')}" >首页</a></div>
								<div class="mui-col-xs-4"><a href="{:U('xinping/index')}" >今日新品</a></div>
								<div class="mui-col-xs-4"><a href="{:U('jiu/index')}" >9块9包邮</a></div>
								<div class="mui-col-xs-4"><a href="{:U('ershi/index')}" >20元封顶</a></div>
								<div class="mui-col-xs-4"><a href="{:U('jingxuan/index')}" >特卖精选</a></div>
								<div class="mui-col-xs-4"><a href="{:U('top100/index')}" >超级人气榜</a></div>
								<div class="mui-col-xs-4"><a href="{:U('article/index')}" >今日头条</a></div>
							</div>
						</div>
					</div>
				</div>
			</aside>