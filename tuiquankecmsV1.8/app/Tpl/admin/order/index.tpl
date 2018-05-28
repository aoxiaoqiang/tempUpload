<include file="public:header" />
<!--商品列表-->
<div class="pad_10" >
    <form name="searchform" method="get" >
    <table width="100%" cellspacing="0" class="search_form">
        <tbody>
            <tr>
                <td>
                <div class="explain_col">
                    <input type="hidden" name="g" value="admin" />
                    <input type="hidden" name="m" value="order" />
                    <input type="hidden" name="a" value="index" />
                    <input type="hidden" name="menuid" value="{$menuid}" />
                    &nbsp;&nbsp;订单号 :
                    <input name="keyword" type="text" class="input-text" size="25" value="{$search.keyword}" />
                    
                    &nbsp;&nbsp;状态 :
                    <select name="status">
                    <option value="">-{:L('all')}-</option>
                    <option value="0" <if condition="$search.status eq '0'">selected="selected"</if>>待处理</option>
                    <option value="2" <if condition="$search.status eq '2'">selected="selected"</if>>失效订单</option>
                    <option value="1" <if condition="$search.status eq '1'">selected="selected"</if>>待收货</option>
                    <option value="3" <if condition="$search.status eq '3'">selected="selected"</if>>已结算</option>
                    </select>
                    <input type="submit" name="search" class="btn" value="搜索" />
                    <div class="bk8"></div>                
                </div>
                </td>
            </tr>
        </tbody>
    </table>
    </form>
    <div class="J_tablelist table_list" data-acturi="{:U('order/ajax_edit')}">
    <table width="100%" cellspacing="0">
        <thead>
            <tr>
                <th width=25><input type="checkbox" id="checkall_t" class="J_checkall"></th>
                <th width="10"><span data-tdtype="order_by" data-field="id">ID</span></th>
                <th width="80"><span data-tdtype="order_by" data-field="uname">用户手机号</span></th>
                <th><span data-tdtype="order_by" data-field="item_name">订单号</span></th>
                <th width="100"><span data-tdtype="order_by" data-field="item_num">订单金额</span></th>
                <th width="100"><span data-tdtype="order_by" data-field="order_score">获得积分</span></th>
                <th width="120"><span data-tdtype="order_by" data-field="add_time">下单时间</span></th>
                 <th width="120"><span data-tdtype="order_by" data-field="add_time">更新时间</span></th>
                <th width="60"><span data-tdtype="order_by" data-field="status">{:L('status')}</span></th>
                <th width="120">{:L('operations_manage')}</th>
            </tr>
        </thead>
        <tbody>
            <volist name="list" id="val" >
            <tr>
                <td align="center"><input type="checkbox" class="J_checkitem" value="{$val.id}"></td>
                <td align="center">{$val.id}</td>
                <td align="center">{:M('user')->where('id='.$val['uid'])->getField('phone')}</td>
                <td align="center">{$val.orderid}</td>
                <td align="center">
                	<if condition="$val['price']">
                	￥{$val.price}
                	<else/>
                	--
                	</if>
                
                </td>
                <td align="center">
                	 	<if condition="$val['integral']">
                	{$val.integral}
                	<else/>
                	--
                	</if>
               </td>  
                <td align="center">{$val.add_time|frienddate}</td>  
                <td align="center">{$val.up_time|frienddate}</td>    
                <td align="center">
                	<if condition="$val['status'] eq '0'">待处理<elseif condition="$val['status'] eq '1'" />待收货<elseif condition="$val['status'] eq '3'" /><span class="green">已结算</span><else/><span class="red">订单失效</span</if></td>
                
                <td align="center">
				<if condition="$val['status'] eq 2 ">
				 <a href="javascript:;" class="J_showdialog" data-uri="{:u('order/add_score', array('id'=>$val['id'], 'menuid'=>$menuid))}" data-title="手工返积分" data-id="add_score" data-width="320" data-height="130">手工返积分</a> | 
	          </if> <a href="javascript:void(0);" class="J_confirmurl" data-uri="{:u('order/delete', array('id'=>$val['id']))}" data-acttype="ajax" data-msg="{:sprintf(L('confirm_delete_one'),$val['title'])}">{:L('delete')}</a></td>
            </tr>
            </volist>
        </tbody>
    </table>
    </div>
    <div class="btn_wrap_fixed">
        <label class="select_all mr10"><input type="checkbox" name="checkall" class="J_checkall">{:L('select_all')}/{:L('cancel')}</label>
        <input type="button" class="btn" data-tdtype="batch_action" data-acttype="ajax" data-uri="{:U('order/delete')}" data-name="id" data-msg="{:L('confirm_delete')}" value="{:L('delete')}" />
        <div id="pages">{$page}</div>
    </div>
</div>
<include file="public:footer" />
</body>
</html>