	<nav data-am-widget="menu" class="am-menu am-menu-offcanvas1" data-am-menu-offcanvas>
		  <a href="javascript: void(0)" class="am-menu-toggle">
		    <i class="am-menu-toggle-icon am-icon-bars am-text-xl"></i>
		  </a>
		  <div class="am-offcanvas">
		    <div class="am-offcanvas-bar am-offcanvas-bar-flip">
		      <div class="series">
				<h4>商品分类</h4>
				<div class="am-g">
					<div class="am-u-sm-4 am-u-end"><a href="{:U('list/index')}" >全部商品</a></div>
					<volist name="catetree" id="tree">
					 <div class="am-u-sm-4 am-u-end"><a href="{:U('list/index',array('cid'=>$tree['id']))}" >{$tree.name}</a></div>
					</volist>
					</div>
					<h4>导航索引</h4>
					<div class="am-g">
						<div class="am-u-sm-4 am-u-end"><a href="{:C('yh_headerm_html')}" >首页</a></div>
						<div class="am-u-sm-4 am-u-end"><a href="{:U('xinping/index')}" >今日新品</a></div>
						<div class="am-u-sm-4 am-u-end"><a href="{:U('jiu/index')}" >9块9包邮</a></div>
						<div class="am-u-sm-4 am-u-end"><a href="{:U('ershi/index')}" >20元封顶</a></div>
						<div class="am-u-sm-4 am-u-end"><a href="{:U('jingxuan/index')}" >特卖精选</a></div>
						<div class="am-u-sm-4 am-u-end"><a href="{:U('top100/index')}" >超级人气榜</a></div>
						<div class="am-u-sm-4 am-u-end"><a href="{:U('article/index')}" >今日头条</a></div>
					</div>
				</div>
		    </div>
		  </div>
		</nav>