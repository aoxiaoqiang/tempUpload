<div class="cat-wrap main-container">
    <div class="cat-list clearfix">
        <ul class="clearfix">
<li > <a class="cnzzCounter" data-cnzz-type="51" data-cnzz="100" href="/">全部优惠</a></li>
<empty name="cate_list['s'][$cid]">
<empty name="cate_list['s'][$cinfo['pid']]">
<volist name="cate_list['p']" id="bcate">
 <li <if condition="$cid eq $bcate['id']">class="active"</if> ><a class="cnzzCounter" data-cnzz-type="{$bcate['id']}" data-cnzz="1"  href="{:U('/cate', array('cid'=>$bcate['id']))}">{$bcate.name}</a>
 	
 </li>
</volist>
<else />
<volist name="cate_list['s'][$cinfo['pid']]" id="bcate">
<li <if condition="$cid eq $bcate['id']">class="active"</if> >
<a class="cnzzCounter"  href="{:U('/cate', array('cid'=>$bcate['id']))}">{$bcate.name}</a>
</li>
</volist>
</empty>
<else />
<empty name="cate_list['s'][$cinfo['pid']]">
<volist name="cate_list['s'][$cid]" id="bcate">
<li <if condition="$cid eq $bcate['id']">class="active"</if>>
	<a class="cnzzCounter" href="{:U('/cate', array('cid'=>$bcate['id']))}">{$bcate.name}</a>
</li>
</volist>
<else />
<volist name="cate_list['s'][$cinfo['pid']]" id="bcate">
<li <if condition="$cid eq $bcate['id']">class="active"</if> >
<a class="cnzzCounter" href="{:U('/cate', array('cid'=>$bcate['id']))}">{$bcate.name}</a>
</li>	
</volist>
</empty>
</empty>	
   </ul>
  
    </div>
    <div class="sort-wrap">
        <span class="sort-text">排序：</span>
        
	<if condition="($nav_curr neq 'cid') AND ($nav_curr neq 'index')">
		
	            <a href="{:U("$nav_curr/index",array('sort'=>'new'))}" style="margin-left:5px;" class="ju_nav <if condition="$index_info['sort'] eq 'new'"> on </if>">最新</a>            
	            <a href="{:U("$nav_curr/index",array('sort'=>'hot'))}" style="margin-left:5px;" class="ju_nav <if condition="$index_info['sort'] eq 'hot'"> on </if>">最热</a>
				<a href="{:U("$nav_curr/index",array('sort'=>'price'))}" style="margin-left:5px;" class="ju_nav <if condition="$index_info['sort'] eq 'price'"> on </if>">价格</a>            
	            <a href="{:U("$nav_curr/index",array('sort'=>'rate'))}" style="margin-left:5px;" class="ju_nav <if condition="$index_info['sort'] eq 'rate'"> on </if>">折扣</a>
			<else/>
		       <notempty name="cid">           
	            <a href="{:U('/cate',array('cid'=>$cid,'sort'=>'new'))}" style="margin-left:5px;" class="ju_nav <if condition="$index_info['sort'] eq 'new'"> on </if>">最新</a>            
	            <a href="{:U('/cate',array('cid'=>$cid,'sort'=>'hot'))}" style="margin-left:5px;" class="ju_nav <if condition="$index_info['sort'] eq 'hot'"> on </if>">最热</a>
				<a href="{:U('/cate',array('cid'=>$cid,'sort'=>'price'))}" style="margin-left:5px;" class="ju_nav <if condition="$index_info['sort'] eq 'price'"> on </if>">价格</a>            
	            <a href="{:U('/cate',array('cid'=>$cid,'sort'=>'rate'))}" style="margin-left:5px;" class="ju_nav <if condition="$index_info['sort'] eq 'rate'"> on </if>">折扣</a>
				<else />            
	            <a href="{:U('index/index',array('sort'=>'new'))}" style="margin-left:5px;" class="ju_nav <if condition="$index_info['sort'] eq 'new'"> on </if>">最新</a>
	            <a href="{:U('index/index',array('sort'=>'hot'))}" style="margin-left:5px;" class="ju_nav <if condition="$index_info['sort'] eq 'hot'"> on </if>">最热</a>
				<a href="{:U('index/index',array('sort'=>'price'))}" style="margin-left:5px;" class="ju_nav <if condition="$index_info['sort'] eq 'price'"> on </if>">价格</a>
	            <a href="{:U('index/index',array('sort'=>'rate'))}" style="margin-left:5px;" class="ju_nav <if condition="$index_info['sort'] eq 'rate'"> on </if>">折扣</a>
              </notempty>
			</if>
        
        
        
      

    </div>
</div>


