<div class="dialog_content">
	<form id="info_form" action="{:u('order/add_score')}" method="post">
	<table width="100%" class="table_form">
        <tr>
			<th>赠送积分 :</th>
			<td><input type="text" name="score" class="input-text" size="20"></td>
		</tr>
		 <tr>
			<th>订单金额 :</th>
			<td><input type="text" name="price" class="input-text" size="20"> 元 </td>
		</tr>
	</table>
	<input type="hidden" name="id" value="{:I('id')}" />
	</form>
</div>
<script>
  
$(function(){
	$.formValidator.initConfig({formid:"info_form",autotip:true});
	 
	$('#info_form').ajaxForm({success:complate,dataType:'json'});
	function complate(result){
		if(result.status == 1){
			//$.dialog.get(result.dialog).close();
            $.yhxia.tip({content:result.msg});
            window.location.reload();
		} else {
			$.yhxia.tip({content:result.msg, icon:'alert'});
		}
	}
	 
});
</script>