<?php
vendor('taobao.TopSdk');
class jumpAction extends FirstendAction
{
    public function _initialize()
    {
        parent::_initialize();
        $this->assign('nav_curr', 'index');
		$this->_mod = D('items');
        $this->_cate_mod = D('items_cate')->cache(true, 10 * 60);
		if (C('yh_site_cache')) {
            $file = 'items_site';
        }
    }
    /**
     * 商品详细页
     */
    public function index()
    {
        $id = I('item', '', 'trim');
		$quan=I('quan', '', 'trim');
		$quanurl=I('quanurl', '', 'trim');
		$data=array(
		'quan'=>I('quan', '', 'trim'),
		'quanid'=>I('quanid', '', 'trim'),
		'id'=>I('item', '', 'trim'),
		'pid'=>I('pid', '', 'trim')
		);
		
		 $appkey = C('yh_taobao_appkey');
         $appsecret = C('yh_taobao_appsecret');
        if (! empty($appkey) && ! empty($appsecret) && !empty($id)) {
                import('TopSdk', VENDOR_PATH . 'taobao', '.php');
                $c = new TopClient();
                $c->appkey = $appkey;
                $c->secretKey = $appsecret;
                $req = new TbkItemInfoGetRequest();
                $req->setFields("num_iid,user_type,title,seller_id,volume,pict_url,reserve_price,zk_final_price,item_url");
                $req->setPlatform("1");
                $req->setNumIids($id);
                $resp = $c->execute($req);
                $resparr = xmlToArray($resp);
                $newitem = $resparr['results']['n_tbk_item'];
				$newitem['coupon_price']=$newitem['zk_final_price']-$data['quan'];
				$newitem['quan']=$data['quan'];
				$newitem['quanid']=$data['quanid'];
				$newitem['pid']=$data['pid'];
			    if(!empty($quan) && !empty($quanurl)){
			    	$newitem['quanurl']=$quanurl;
			    $kouling=kouling($newitem['pict_url'].'_200x200.jpg',$newitem['title'],$quanurl);
				}else{
				$newitem['quanurl']='https://uland.taobao.com/coupon/edetail?activityId='.$data['quanid'].'&itemId='.$newitem['num_iid'].'&pid='. $data['pid'] .'&shareurl=true&app=chrome';
				 $kouling=kouling($newitem['pict_url'].'_200x200.jpg',$newitem['title'],$newitem['quanurl']);	
				}
			$newitem['quankouling']=$kouling;
			$this->_config_seo(C('yh_seo_config.item'), array(
            'title' => $newitem['title'],
            'price' =>  $newitem['reserve_price'],
            'quan' =>  floattostr($newitem['quan']),
            'coupon_price' => $newitem['zk_final_price']-$data['quan'],
            'seo_title' => $newitem['title']
           ));
		    if(!empty($quan) && !empty($quanurl)){
		   	$this->assign('quan', $quan);
			$this->assign('quanurl', base64_encode($quanurl));
		   }
		
		  $this->assign('item', $newitem);
				
            }

 $orlike = $this->_mod->field('id,title,pic_url,coupon_price,price,shop_type')->limit('0,9')->order('id desc')->select();
 $this->assign('orlike', $orlike);
       
if(function_exists('opcache_invalidate')){
$basedir = $_SERVER['DOCUMENT_ROOT']; 
$dir=$basedir.'/data/runtime/Data/coupon/disable_num_iids.php';
$ret=opcache_invalidate($dir,TRUE);
}
		$disable_num_iids = F('coupon/disable_num_iids');
		    if(!$disable_num_iids){
                    $disable_num_iids = array();
             }
			$is=strpos(serialize($disable_num_iids),$id);
            if(empty($is)){
                    $disable_num_iids[] =array(
                    'num_iid'=>$id,
                    'rate'=>10,
                    'zc_id'=>1
					); 
			 F('coupon/disable_num_iids', $disable_num_iids);
			 }
	

       $this->display();
		
    }


public function out(){
$data=array(
		'quanid'=>I('quanid', '', 'trim'),
		'id'=>I('id', '', 'trim'),
		'pid'=>I('pid', '', 'trim')
);
$url=I('quanurl', '', 'trim');
if(!empty($url)){
$quanurl=base64_decode($url)	;
}else{
$quanurl='https://uland.taobao.com/coupon/edetail?activityId='.$data['quanid'].'&itemId='.$data['id'].'&pid='. $data['pid'] .'&shareurl=true&app=chrome';
}
$this->assign('quanurl',$quanurl);
$this->display();
}


}

function floattostr($val)
{
    preg_match("#^([\+\-]|)([0-9]*)(\.([0-9]*?)|)(0*)$#", trim($val), $o);
    return $o[1] . sprintf('%d', $o[2]) . ($o[3] != '.' ? $o[3] : '');
}