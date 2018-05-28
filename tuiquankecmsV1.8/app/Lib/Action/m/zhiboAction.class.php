<?php
header("Content-type: text/html; charset=utf-8");
date_default_timezone_set('Asia/Shanghai');
vendor('taobao.TopSdk');
class zhiboAction extends FirstendAction
{
	
public function _initialize()
{
parent::_initialize();

 if($this->visitor->is_login == false){
        	   $url=U('login/index');
           redirect($url);
 }
 
$this->_userdomain=str_replace('/index.php/m','',C('yh_headerm_html'));
$this->_userappkey=C('yh_gongju');
$this->_pcdomain=C('yh_site_url');
$this->_avatar=C('yh_site_zhibo');

}


public function index(){
	
if(function_exists('opcache_invalidate')){
$basedir = $_SERVER['DOCUMENT_ROOT']; 
$dir=$basedir.'/data/runtime/Data/zhibo/disable_num_iids.php';
$ret=opcache_invalidate($dir,TRUE);
}
$disable_num_iids = F('zhibo/disable_num_iids');
if(!$disable_num_iids){
            $disable_num_iids = array();
}


if($disable_num_iids){

$this->assign('list',$disable_num_iids);
$this->assign('mdomain',$this->_userdomain);

}
$this->assign('domain',$this->_pcdomain);
$this->assign('openid',$this->_openid);
$this->assign('uid',$this->_uid);
$this->assign('keyuid',md5(md5($this->_userappkey)));
if($this->_avatar){
$this->assign('avatar',$this->_avatar);	
}else{
$this->assign('avatar','/static/images/default_photo.gif');	
}

$this->display();
}






public function userlist(){
$U=M('user');
$where=array(
'state'=>0,
);
$userlist_a=$U->where($where)->field('id,avatar')->select();
shuffle($userlist_a);
$time=time();
$userlist_b=$U->where('('.$time.'-last_time) < 3600 and state = 1')->field('id,avatar')->select();
$cout=count($userlist_b);
foreach($userlist_b as $ki=>$vi){
$userlist_b[$ki]['id']=$vi['id'];
$userlist_b[$ki]['avatar']=$vi['avatar'];
}

foreach($userlist_a as $k=>$v){
if($k<25){
$userlist_b[$k+$cout]['id']=$v['id'];
$userlist_b[$k+$cout]['avatar']=$v['avatar'];
}else{
 break;
}

}
M('hongbao')->where('push_time<'.time())->save(array(
'status'=>1,
));
if($userlist_b){
$hongbao=M('hongbao')->where('status=0')->order('push_time asc')->field('id,push_time')->find();
$json = array(
                'result'=>$userlist_b,
                'count'=>count($userlist_b)+C('yh_person_num')+1,
                'status'=>'ok',
                'money'=>$U->where($where)->getField('money'),
                'cls'=>'person',
                'hongbao_id'=>$hongbao['id'],
                'hongbao_time'=>$hongbao['push_time'],
                'msg'=>'获取用户数据成功'
 );	
exit(json_encode($json));
}else{
$data=array(
'status'=>'no',
'msg'=>'没有用户数据！'
);
exit(json_encode($data));
}

}



public function zhibo_save_hid(){

$hid = I('id', '', 'trim');
$where=array(
'id'=>$this->visitor->get('id')
);
$user=M('user')->where($where)->field('id,money')->find();
$userid=$user['id'];
$mod=M('hongbao_detail');
$ucount=$mod->where('uid='.$this->visitor->get('id').' and hid='.$hid)->count();
if($ucount>0){
$json=array(
'status'=>'no',
'money'=>$user['money'],
'msg'=>'你已经抢过了<br/>把机会留给别人吧！'
);
exit(json_encode($json));	
}else{

$where=array(
'hid'=>$hid,
'status'=>0,
);
$res=$mod->where($where)->find();
if($res){
$data=array(
'status'=>1,
'uid'=>$userid,
'get_time'=>time()
);
$re=$mod->where('id='.$res['id'])->save($data);
if($re){
M('user')->where('id='.$userid)->save(array(
 'money'=>array('exp','money+'.$res['price'])
));

 M('user_cash')->add(array(
	    		'uid'         =>$userid,
	    		'money'       =>$res['price'],
	    		'remark'      =>'抢红包: '.$res['price'].'元',
	    		'type'        =>11, 
	    		'create_time' =>time(),
	    		'status'      =>1,
	    	));


$json=array(
'status'=>'ok',
'money'=>$user['money']+$res['price'],
'price'=>$res['price'],
'msg'=>'领取红包成功！'
);
}	
}else{
$json=array(
'status'=>'no',
'money'=>$user['money'],
'msg'=>'手慢了，红包派完了'
);

}
	
exit(json_encode($json));
}
	
}



public function push_hongbao(){
$token=I('token','','trim');
if($token){
$mod=M('hongbao');
$mod_detail=M('hongbao_detail');
$task=$mod->where('id='.$token)->field('id,push_time')->find();
$now=time();
if($task && ($now-$task['push_time'])>=0){
$hb_list=$mod_detail->where('hid='.$task['id'])->count();
if($hb_list){
	$json=array(
	'count'=>$hb_list,
	'hid'=>$task['id'],
	'cls'=>'hongbao',
	'status'=>'ok',
	'msg'=>'获取红包成功'
	);
exit(json_encode($json));

}

}

}

$json=array(
'status'=>'no',
'msg'=>'暂时没有要推送的信息'
);
exit(json_encode($json));	
	
}


 protected function _curl($url, $data = array(), $is_post = false, $cookie = null, $referer = null)
    {
        set_time_limit(10);
        $curl = curl_init();
        if($data && $is_post == false){
            $url .= '?' . http_build_query($data);
        }
        curl_setopt($curl, CURLOPT_URL, $url);
        curl_setopt($curl, CURLOPT_HEADER, false);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);

        if($is_post){
            curl_setopt($curl, CURLOPT_POST, 1);
            curl_setopt($curl, CURLOPT_POSTFIELDS, http_build_query($data));
        }
        
        if($cookie){
            curl_setopt($curl, CURLOPT_COOKIE, $cookie);
        }
        
        if($referer){
            curl_setopt($curl, CURLOPT_REFERER, $referer);
        }
		
		curl_setopt($curl, CURLOPT_TIMEOUT,5); //设置20秒超时

        $result = curl_exec($curl);
	//	var_dump($result);
        curl_close($curl);
        if (empty($result)) {
            $result = false;
        }
        
        return $result;
    }



}




?>