jQuery(function($){
	var backTop=jQuery(".call-top");
	$(window).scroll(function(){
		if($(window).scrollTop()>150){
			backTop.css("display","block");
		}else{
			backTop.css("display","none");
		}
	})
	$('#back_top .call-top').click(function(){
		$('body,html').animate({scrollTop:0},500);
		return false;
	})


$('#back_top .call-top').click(function() {
	$('body,html').animate({ scrollTop: 0 }, 500);
	return false;
})

jQuery(".focusBox").hover(function(){ jQuery(this).find(".prev,.next").stop(true,true).fadeTo("show",0.2) },function(){ jQuery(this).find(".prev,.next").fadeOut() });
jQuery(".focusBox").slide({ mainCell:".pic",effect:"fold", autoPlay:true, delayTime:600, trigger:"click"});		

$("#btn_baoming").click(function(){
layer.open({
  type: 2,
  title: '卖家入驻报名',
  shadeClose: true,
  shade: 0.8,
  area: ['600px', '500px'],
  content: '/?m=baoming' //iframe的url
}); 


});

$("#jubao").click(function(){
var num_iid=$('#jubao').attr('rel');
layer.open({
  type: 2,
  title: '卖家违规举报',
  shadeClose: true,
  shade: 0.8,
  area: ['440px', '280px'],
  content: '/?m=baoming&a=jubao&num_iid='+num_iid //iframe的url
});
	
})


});


