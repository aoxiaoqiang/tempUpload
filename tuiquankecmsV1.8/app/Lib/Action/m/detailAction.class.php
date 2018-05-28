<?php
class detailAction extends FirstendAction {
public function _initialize() {
        parent::_initialize();
		$this->_mod = D('items');
}
	
	
public function index(){
	
$id = I('id', '','trim');
$item = $this->_mod->where(array('id' => $id))->find(); !$item && $this->_404();
if(C('yh_item_hit')){
			$hits_data = array('hits'=>array('exp','hits+1'));
			$this->_mod->where(array('id'=>$id))->setField($hits_data);
}

$this->_config_seo(C('yh_seo_config.item'), array(
            'title' => $item['title'],
            'intro' => $item['intro'],
			'price' => $item['price'],
			'quan' => floattostr($item['quan']),
			'coupon_price' => $item['coupon_price'],
			'tags' => $tags,
            'seo_title' => $item['seo_title'],
            'seo_keywords' => $item['seo_keys'],
            'seo_description' => $item['seo_desc'],
 ));
 
 $cid = $item["cate_id"];
 $where=array(
 'cate_id'=>$cid,
 'id'=>array('neq',$id)
 );
 $orlike = $this->_mod->where($where)->field('id,title,pic_url,coupon_price,price,shop_type')->limit('0,9')->order('id desc')->select();
 $this->assign('orlike', $orlike);
if(empty($item['quankouling']) || $item['quankouling']=='0' || $item['quankouling']=='undefined'){
	   $kouling=kouling($item['pic_url'].'_200x200.jpg',$item['title'],$item['quanurl']);
	   $item['quankouling']=$kouling;
	   $this->_mod->where(array(
                'num_iid' => $item['num_iid']
            ))->setField('quankouling',$kouling);
 }
$this->assign('item', $item);

if($this->getRobot()==false)
 {
		 $last_time=date('Y-m-d',$item['last_time']);
		 $today=date('Y-m-d',time());
if($last_time!=$today || $item['ding']==1 || ($item['tk']==1 && $item['que']==0) ){
if(function_exists('opcache_invalidate')){
$basedir = $_SERVER['DOCUMENT_ROOT']; 
$dir=$basedir.'/data/runtime/Data/coupon/disable_num_iids.php';
$ret=opcache_invalidate($dir,TRUE);
}
		    $disable_num_iids = F('coupon/disable_num_iids');
		    if(!$disable_num_iids){
                    $disable_num_iids = array();
             }
			$is=strpos(serialize($disable_num_iids),$item['num_iid']);
            if(empty($is)){
                    $disable_num_iids[] =array(
                    'num_iid'=>$item['num_iid'],
                    'rate'=>$item['commission_rate'],
                    'zc_id'=>$item['zc_id']
					); 
					
if(function_exists('opcache_invalidate')){
$basedir = $_SERVER['DOCUMENT_ROOT']; 
$dir=$basedir.'/data/runtime/Data/coupon/disable_num_iids.php';
$ret=opcache_invalidate($dir,TRUE);
}

			 F('coupon/disable_num_iids', $disable_num_iids);
			 $data=array(
			 'last_time'=>time(),
			  'ding'=>0,
			  'que'=>0,
			 );
			 $this->_mod->where(array(
                'num_iid' => $item['num_iid']
            ))->save($data);
			
              }
		 }
 }

$this->display();
	
}

public function productinfo(){
$num_iid=I('numiid');
 if ($num_iid) {
    $descUrl = 'http://hws.m.taobao.com/cache/mtop.wdetail.getItemDescx/4.1/?data=%7B%22item_num_id%22%3A%22' . $num_iid . '%22%7D';
    $yhxia_https = new yhxia_https();
    $yhxia_https->fetch($descUrl);
    $source = $yhxia_https->results;
    if (!$source) {
        $source = file_get_contents($descUrl);
    }
    $result_data = json_decode($source, true);
    $dinfo = array();
    $num = $result_data['data']['images'];
    for ($i = 0; $i < count($num); $i++) {
		$images = $i + 1;
		$desc[$images] = $num[$i];
		$desc[$images] = '<img class="lazy" src=' . $desc[$images] . '>';
    }
	if(count(explode(".gif", $desc[1])) > 1){$desc[1]='';}
    $desc = $desc[1] . '' . $desc[2] . '' . $desc[3] . '' . $desc[4] . '' . $desc[5] . '' . $desc[6] . '' . $desc[7] . '' . $desc[8] . '' . $desc[9] . '' . $desc[10] . '' . $desc[11] . '' . $desc[12] . '' . $desc[13] . '' . $desc[14] . '' . $desc[15] . '' . $desc[16] . '' . $desc[17] . '' . $desc[18] . '' . $desc[19] . '' . $desc[20] . '' . $desc[21] . '' . $desc[22] . '' . $desc[23] . '' . $desc[24] . '' . $desc[25] . '' . $desc[26] . '' . $desc[27] . '' . $desc[28] . '' . $desc[29] . '' . $desc[30];
    $data['desc'] = $desc;
	$json=array(
	'status'=>'ok',
	'content'=>$desc
	);
    $this->_mod->where(array('num_iid' => $num_iid))->save($data);
	exit(json_encode($json));
}

	
	
}

	
	
}


function floattostr( $val ){
    preg_match( "#^([\+\-]|)([0-9]*)(\.([0-9]*?)|)(0*)$#", trim($val), $o );
    return $o[1].sprintf('%d',$o[2]).($o[3]!='.'?$o[3]:'');
}	