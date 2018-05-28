<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" /><link href="__STATIC__/css/admin/style.css" rel="stylesheet"/><title><?php echo L('website_manage');?></title><script>	var URL = '__URL__';
	var SELF = '__SELF__';
	var PAGE = '__SELF__';
	var ROOT_PATH = '__ROOT__';
	var APP	 =	 '__APP__';
	//语言项目
	var lang = new Object();
	<?php $_result=L('js_lang');if(is_array($_result)): $i = 0; $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$val): $mod = ($i % 2 );++$i;?>lang.<?php echo ($key); ?> = "<?php echo ($val); ?>";<?php endforeach; endif; else: echo "" ;endif; ?></script></head><body><div id="J_ajax_loading" class="ajax_loading"><?php echo L('ajax_loading');?></div><?php if(($sub_menu != '') OR ($big_menu != '')): ?><div class="subnav"><div class="content_menu ib_a blue line_x"><?php if(!empty($big_menu)): ?><a class="add fb J_showdialog" href="javascript:void(0);" data-uri="<?php echo ($big_menu["iframe"]); ?>" data-title="<?php echo ($big_menu["title"]); ?>" data-id="<?php echo ($big_menu["id"]); ?>" data-width="<?php echo ($big_menu["width"]); ?>" data-height="<?php echo ($big_menu["height"]); ?>"><em><?php echo ($big_menu["title"]); ?></em></a>　<?php endif; if(!empty($sub_menu)): if(is_array($sub_menu)): $key = 0; $__LIST__ = $sub_menu;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$val): $mod = ($key % 2 );++$key; if($key != 1): ?><span>|</span><?php endif; ?><a href="<?php echo U($val['module_name'].'/'.$val['action_name'],array('menuid'=>$menuid)); echo ($val["data"]); ?>" class="<?php echo ($val["class"]); ?>"><em><?php echo ($val['name']); ?></em></a><?php endforeach; endif; else: echo "" ;endif; endif; ?></div></div><?php endif; ?><!--其他设置--><div class="pad_lr_10"><form id="info_form" action="<?php echo u('setting/edit');?>" method="post"><table width="100%" class="table_form contentWrap"><tr><th>电脑站Logo图片 :</th><td><input type="text" name="setting[site_logo]" id="J_logo_img" class="input-text fl mr10" size="50" value="<?php echo C('yh_site_logo');?>"><div id="J_logo_upload_img" class="upload_btn"><span><?php echo L('upload');?></span></div><span class="gray ml10">建议宽:300  高:50  </span><br><br><img src="<?php echo C('yh_site_logo');?>" height="100" id="show_logo_J_img" /><span class="attachment_icon J_attachment_icon" file-type="image" ></span></td></tr><tr><th>电脑站首页二维码:</th><td><input type="text" name="setting[site_flogo]" id="J_flogo_img" class="input-text fl mr10" size="50" value="<?php echo C('yh_site_flogo');?>"><div id="J_flogo_upload_img" class="upload_btn"><span><?php echo L('upload');?></span></div><span class="gray ml10">建议 宽:250  高:250  </span><br><br><img src="<?php echo C('yh_site_flogo');?>" height="100" id="show_flogo_J_img" /><span class="attachment_icon J_attachment_icon" file-type="image" ></span></td></tr><tr><th> 手机站客服二维码:</th><td><input type="text" name="setting[site_background]" id="J_background_img" class="input-text fl mr10" size="50" value="<?php echo C('yh_site_background');?>"><div id="J_background_upload_img" class="upload_btn"><span><?php echo L('upload');?></span></div><span class="gray ml10">建议 宽:250  高:250 </span><br><br><img src="<?php echo C('yh_site_background');?>" height="100" id="show_background_J_img" /><span class="attachment_icon J_attachment_icon" file-type="image" ></span></td></tr><tr><th>直播间头像:</th><td><input type="text" name="setting[site_zhibo]" id="J_zhibo_img" class="input-text fl mr10" size="50" value="<?php echo C('yh_site_zhibo');?>"><div id="J_zhibo_upload_img" class="upload_btn"><span><?php echo L('upload');?></span></div><span class="gray ml10">建议 宽:200  高:200 </span><br><br><img src="<?php echo C('yh_site_zhibo');?>" height="100" id="show_zhibo_J_img" /><span class="attachment_icon J_attachment_icon" file-type="image" ></span></td></tr><th></th><td><input type="hidden" name="menuid"  value="<?php echo ($menuid); ?>"/><input type="submit" class="smt mr10" name="do" value="<?php echo L('submit');?>"/></td></tr><tr><th></th><td></td></tr><th></th></table></form></div><script src="__STATIC__/js/jquery/jquery.js"></script><script src="__STATIC__/js/jquery/plugins/jquery.tools.min.js"></script><script src="__STATIC__/js/jquery/plugins/formvalidator.js"></script><script src="__STATIC__/js/yhxia.js"></script><script src="__STATIC__/js/admin.js"></script><script src="__STATIC__/js/dialog.js"></script><script>//初始化弹窗
(function (d) {
    d['okValue'] = lang.dialog_ok;
    d['cancelValue'] = lang.dialog_cancel;
    d['title'] = lang.dialog_title;
})($.dialog.defaults);
</script><?php if(isset($list_table)): ?><script src="__STATIC__/js/jquery/plugins/listTable.js"></script><script>$(function(){
	$('.J_tablelist').listTable();
});
</script><?php endif; ?><script src="__STATIC__/js/fileuploader.js"></script><script type="text/javascript">$(function(){
    var upload = new qq.FileUploaderBasic({
    	allowedExtensions: ['jpg','gif','png'],
        button: document.getElementById('J_logo_upload_img'),
        multiple: false,
        action: "<?php echo U('setting/ajax_upload');?>",
        inputName: 'img',
        forceMultipart: true, //用$_FILES
        messages: {
        	typeError: lang.upload_type_error,
        	sizeError: lang.upload_size_error,
        	minSizeError: lang.upload_minsize_error,
        	emptyError: lang.upload_empty_error,
        	noFilesError: lang.upload_nofile_error,
        	onLeave: lang.upload_onLeave
        },
        showMessage: function(message){
        	$.yhxia.tip({content:message, icon:'error'});
        },
        onSubmit: function(id, fileName){
        	$('#J_logo_upload_img').addClass('btn_disabled').find('span').text(lang.uploading);
        },
        onComplete: function(id, fileName, result){
        	$('#J_logo_upload_img').removeClass('btn_disabled').find('span').text(lang.upload);
		if(result.status == '1'){
            		$('#show_logo_J_img').attr('src',result.data);
        		$('#J_logo_img').val(result.data);
        	}else{
        		$.yhxia.tip({content:result.msg, icon:'error'});
        	}
        }
    });

    var zhiboupload = new qq.FileUploaderBasic({
    	allowedExtensions: ['jpg','gif','png'],
        button: document.getElementById('J_zhibo_upload_img'),
        multiple: false,
        action: "<?php echo U('setting/ajax_upload');?>",
        inputName: 'img',
        forceMultipart: true, //用$_FILES
        messages: {
        	typeError: lang.upload_type_error,
        	sizeError: lang.upload_size_error,
        	minSizeError: lang.upload_minsize_error,
        	emptyError: lang.upload_empty_error,
        	noFilesError: lang.upload_nofile_error,
        	onLeave: lang.upload_onLeave
        },
        showMessage: function(message){
        	$.yhxia.tip({content:message, icon:'error'});
        },
        onSubmit: function(id, fileName){
        	$('#J_zhibo_upload_img').addClass('btn_disabled').find('span').text(lang.uploading);
        },
        onComplete: function(id, fileName, result){
        	$('#J_zhibo_upload_img').removeClass('btn_disabled').find('span').text(lang.upload);
		if(result.status == '1'){
            	$('#show_zhibo_J_img').attr('src',result.data);
        		$('#J_zhibo_img').val(result.data);
        	}else{
        		$.yhxia.tip({content:result.msg, icon:'error'});
        	}
        }
    });


    var navupload = new qq.FileUploaderBasic({
    	allowedExtensions: ['jpg','gif','png'],
        button: document.getElementById('J_background_upload_img'),
        multiple: false,
        action: "<?php echo U('setting/ajax_upload');?>",
        inputName: 'img',
        forceMultipart: true, //用$_FILES
        messages: {
        	typeError: lang.upload_type_error,
        	sizeError: lang.upload_size_error,
        	minSizeError: lang.upload_minsize_error,
        	emptyError: lang.upload_empty_error,
        	noFilesError: lang.upload_nofile_error,
        	onLeave: lang.upload_onLeave
        },
        showMessage: function(message){
        	$.yhxia.tip({content:message, icon:'error'});
        },
        onSubmit: function(id, fileName){
        	$('#J_background_upload_img').addClass('btn_disabled').find('span').text(lang.uploading);
        },
        onComplete: function(id, fileName, result){
        	$('#J_background_upload_img').removeClass('btn_disabled').find('span').text(lang.upload);
		if(result.status == '1'){
            		$('#show_background_J_img').attr('src',result.data);
        		$('#J_background_img').val(result.data);
        	}else{
        		$.yhxia.tip({content:result.msg, icon:'error'});
        	}
        }
    });

    var fupload = new qq.FileUploaderBasic({
    	allowedExtensions: ['jpg','gif','png'],
        button: document.getElementById('J_flogo_upload_img'),
        multiple: false,
        action: "<?php echo U('setting/ajax_upload');?>",
        inputName: 'img',
        forceMultipart: true, //用$_FILES
        messages: {
        	typeError: lang.upload_type_error,
        	sizeError: lang.upload_size_error,
        	minSizeError: lang.upload_minsize_error,
        	emptyError: lang.upload_empty_error,
        	noFilesError: lang.upload_nofile_error,
        	onLeave: lang.upload_onLeave
        },
        showMessage: function(message){
        	$.yhxia.tip({content:message, icon:'error'});
        },
        onSubmit: function(id, fileName){
        	$('#J_flogo_upload_img').addClass('btn_disabled').find('span').text(lang.uploading);
        },
        onComplete: function(id, fileName, result){
        	$('#J_flogo_upload_img').removeClass('btn_disabled').find('span').text(lang.upload);
		if(result.status == '1'){
            		$('#show_flogo_J_img').attr('src',result.data);
        		$('#J_flogo_img').val(result.data);
        	}else{
        		$.yhxia.tip({content:result.msg, icon:'error'});
        	}
        }
    });
});
</script></body></html>