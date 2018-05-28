<?php
class zhiboAction extends FirstendAction
{
public function index(){
$openid=I('openid','','trim');
$useragent = strtolower(addslashes($_SERVER['HTTP_USER_AGENT'])); 
if(strpos($useragent, 'micromessenger') === false && strpos($useragent, 'windows phone') === false){ 
exit('deney Access!');
}
if(strpos($useragent,'wechatdevtools')){
exit('deney Access!');	
}
$M=M('user');
$where=array(
'openid'=>$openid
);

if(!empty($openid) && strlen($openid)>20){
$count=$M->where($where)->count();
if($count>0){
session('user', array(
                'openid' => $openid,
));	
}else{
$data=array(
'username'=>'wx_'.substr($openid,20,6),
'nickname'=>'wx_'.substr($openid,20,6),
'password'=>md5(substr($openid,20,6)),
'reg_ip'=>get_client_ip(),
'avatar'=>'/static/tuiquanke/images/noimg.png',
'state'=>1,
'status'=>1,
'reg_time'=>time(),
'last_time'=>time(),
'create_time'=>time(),
'openid'=>$openid,
);
$res=$M->add($data);
}

}

$this->assign('zhibourl',C('yh_zhibo_url'));
$this->assign('openid',$openid);

$this->display(); 
}

}
?>