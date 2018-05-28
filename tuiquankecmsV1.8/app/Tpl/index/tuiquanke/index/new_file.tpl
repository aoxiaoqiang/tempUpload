<!doctype html>
<html lang="zh-CN">
<head>
<include file="public:head" />
</head>
<body>
<include file="public:header" />
<div id="dtk_mian">
<!--
	作者：chkk520@qq.com
	时间：2016-11-03
	描述：banner
-->
<div id="banner">
    <div class="banner_con clearfix">
        <!--列表   -->
        <div class="list fl">
            <ul>
<volist name="cate_list" id="cate"> 
                <li><i class="iconfont {$cate[cateimg]}"></i><a class="cnzzCounter" href="{:U('/cate/',array('cid'=>$cate['id']))}">{$cate[name]}</a>
                </li>
</volist>
        </ul>
        </div>
        <!-- 轮播-->
 <div class="unslider fl">

<div class="focusBox" style="margin:0 auto">			
<div class="tempWrap" style="overflow:hidden; position:relative; width:720px">
<ul class="pic" style="width: 3200px; left: 0px; position: relative; overflow: hidden; padding: 0px; margin: 0px;">					
<volist name="ad_list" id="ad">   	
<li style="float: left; width: 720px;">
<a href="{$ad.url}" target="_blank"><img src="{$ad.img}"></a>
</li>					
</volist>

</ul></div>			
		
<ul class="hd">	
<volist name="ad_list" id="ad">  		
<li class=""></li>
</volist>
</ul></div>
        </div>
        <!--右边大图 -->
 <div class="rightPic fr" style="position: relative">
	    
		        <div class="banner_r">
			        <dl>
			            <dd>
			                <a href="#"   class="right">
			                    <img src="__STATIC__/tuiquanke/images/r-1.jpg">
			                    <div class="txt"><span class="title">直播数量</span> <span>当前优惠<em>{$total_item}</em>款</span>  </div>
			                </a>
			            </dd>
			            <dd>
			                <a href="#"   class="right">
			                    <img src="__STATIC__/tuiquanke/images/r-2.jpg">
			                    <div class="txt other"><span class="title">待审数量</span> <span>当前待审<em>{$waitcount}</em>款</span> </div>
			                </a>
			            </dd>
			        </dl>
			    </div>		        		   



       
        </div>
    </div>
</div>
<!--recommend-->
<div class="recommend cf">
	<div class="rec_horm fl" _hover-ignore="1">
		<i class="ico_horm"></i> 头条阅读
	</div>
	<div class="rec_list fl">
		<ul>
 <volist name="article_list" id="list">   
 <li><a  title="{$list.title}" target="_blank" href="<if condition="C('URL_MODEL') eq 2">/article/view_{$list.id}<else/>{:U('/article/read/',array('id'=>$list['id']))}</if>" >{$list.title}
<i class="headline_new"></i></a>
</li>
</volist>
		</ul>
	</div>	
</div>
		
		<div class="category-box clear">
			<ul>
				<li>
					<a href="" target="_blank" class="qg-item qg-ing">
					    <div class="qg-img">
					        <img src="__STATIC__/tuiquanke/images/mm.jpg">
					    </div>
					    <div class="qg-detail">
					        <div class="name">
					            <p class="des">珂卡芙罗马凉鞋女夏2017新款韩</p>
		                        <p class="subtitle">品牌直供全国包邮</p>
		                   	</div>			
					        <div class="link">
					            <div class="price">
					                <span class="original-price">¥<i>273</i></span>
					                <span class="promo-price">¥<em>99</em></span>
					            </div>
					            <div class="link-btn">
					                             立即抢购
					            </div>
					        </div>
						</div>
					</a>
				</li>
				<li>
					<a href="" target="_blank" class="qg-item qg-ing">
					    <div class="qg-img">
					        <img src="__STATIC__/tuiquanke/images/mm.jpg">
					    </div>
					    <div class="qg-detail">
					        <div class="name">
					            <p class="des">珂卡芙罗马凉鞋女夏2017新款韩</p>
		                        <p class="subtitle">品牌直供全国包邮</p>
		                   	</div>			
					        <div class="link">
					            <div class="price">
					                <span class="original-price">¥<i>273</i></span>
					                <span class="promo-price">¥<em>99</em></span>
					            </div>
					            <div class="link-btn">
					                             立即抢购
					            </div>
					        </div>
						</div>
					</a>
				</li>
				<li class="no-right">
					<a href="" target="_blank" class="qg-item qg-ing">
					    <div class="qg-img">
					        <img src="__STATIC__/tuiquanke/images/mm.jpg">
					    </div>
					    <div class="qg-detail">
					        <div class="name">
					            <p class="des">珂卡芙罗马凉鞋女夏2017新款韩</p>
		                        <p class="subtitle">品牌直供全国包邮</p>
		                   	</div>			
					        <div class="link">
					            <div class="price">
					                <span class="original-price">¥<i>273</i></span>
					                <span class="promo-price">¥<em>99</em></span>
					            </div>
					            <div class="link-btn">
					                             立即抢购
					            </div>
					        </div>
						</div>
					</a>
				</li>
				<li>
					<a href="" target="_blank" class="qg-item qg-ing">
					    <div class="qg-img">
					        <img src="__STATIC__/tuiquanke/images/mm.jpg">
					    </div>
					    <div class="qg-detail">
					        <div class="name">
					            <p class="des">珂卡芙罗马凉鞋女夏2017新款韩</p>
		                        <p class="subtitle">品牌直供全国包邮</p>
		                   	</div>			
					        <div class="link">
					            <div class="price">
					                <span class="original-price">¥<i>273</i></span>
					                <span class="promo-price">¥<em>99</em></span>
					            </div>
					            <div class="link-btn">
					                             立即抢购
					            </div>
					        </div>
						</div>
					</a>
				</li>
				<li>
					<a href="" target="_blank" class="qg-item qg-ing">
					    <div class="qg-img">
					        <img src="__STATIC__/tuiquanke/images/mm.jpg">
					    </div>
					    <div class="qg-detail">
					        <div class="name">
					            <p class="des">珂卡芙罗马凉鞋女夏2017新款韩</p>
		                        <p class="subtitle">品牌直供全国包邮</p>
		                   	</div>			
					        <div class="link">
					            <div class="price">
					                <span class="original-price">¥<i>273</i></span>
					                <span class="promo-price">¥<em>99</em></span>
					            </div>
					            <div class="link-btn">
					                             立即抢购
					            </div>
					        </div>
						</div>
					</a>
				</li>
				<li class="no-right">
					<a href="" target="_blank" class="qg-item qg-ing">
					    <div class="qg-img">
					        <img src="__STATIC__/tuiquanke/images/mm.jpg">
					    </div>
					    <div class="qg-detail">
					        <div class="name">
					            <p class="des">珂卡芙罗马凉鞋女夏2017新款韩</p>
		                        <p class="subtitle">品牌直供全国包邮</p>
		                   	</div>			
					        <div class="link">
					            <div class="price">
					                <span class="original-price">¥<i>273</i></span>
					                <span class="promo-price">¥<em>99</em></span>
					            </div>
					            <div class="link-btn">
					                             立即抢购
					            </div>
					        </div>
						</div>
					</a>
				</li>
			</ul>
		</div>
	
	<!--content-->
<div id="content" style="padding-bottom: 58px;">
    <!--领券优惠直播-->
    <div class="live">
        <!-- 领券优惠头部-->
<div class="discount_head clearfix"></div>
        <!-- 领券优惠商品-->
       <div class="area" id="contentA">
			<include file="public:automatic_list" />
	<div class="mainbody_6" style="margin: 0 auto;margin-bottom: 0px;margin-top: 26px;">
    <div id="yw0" class="pager">
				{$page}
			</div>
		</div>
</div>
		</div>
</div>
<div class="foot">
<div class="links"><span>友情链接：</span>
					<div class="links_list_box">
			    		<yh:link type="lists" status="1">
								<li>
						<volist name="data" id="val">
							<eq name="mod" value="10"></li><li></eq>
			    			<a href="{$val.url}" target="_blank">{$val.name}</a>
						</volist>
						</li>
						</yh:link>	
							
						</ul>
					</div>
	</div>
</div>

		<div class="clearfix"></div>
		<include file="public:footer" />
		
</div>		
	
	</body>
</html>
