<?php
header("Content-type: text/html; charset=utf-8");

class minAction extends FirstendAction
{

    public function _initialize()
    {
        parent::_initialize();
        $this->_mod = D('items');
        $this->_cate_mod = D('items_cate')->cache(true, 10 * 60);
        $this->assign('nav_curr', 'index');
        if (C('yh_site_cache')) {
            $file = 'items_site';
        }
    }

    public function index()
    {}
	
		
public function checkque(){
	$id = I('id', '', 'trim');
	
	 $ret=$this->_mod->where(array(
            'num_iid' => $id
       ))->save(array('que'=>1));
	  
	if($ret){
	 $json=array(
	'status'=>'ok'
	);	
		
	  }else{
	  $json=array(
	'status'=>'no'
	);	
		
	  }
	
	exit(json_encode($json));
	
}
	
    public function checkcoupon()
    {
    	
		$tkapi=F('tqkapi/api');
		if(false ===$tkapi){
		$this->tqkapi = 'http://ap.tuiquanke.com';
		}else{
		$this->tqkapi = $tkapi;
		}
		
		
        $id = I('id', '', 'trim');
        $uptime = I('uptime', '', 'trim');
        if ((NOW_TIME - $uptime) > 2000) {
            $item = $this->_mod->where(array(
                'id' => $id
            ))->find();
            $appkey = C('yh_taobao_appkey');
            $appsecret = C('yh_taobao_appsecret');
            if (! empty($appkey) && ! empty($appsecret)) {
                import('TopSdk', VENDOR_PATH . 'taobao', '.php');
                $c = new TopClient();
                $c->appkey = $appkey;
                $c->secretKey = $appsecret;
                $req = new TbkItemInfoGetRequest();
                $req->setFields("num_iid,title,seller_id,volume");
                $req->setPlatform("1");
                $req->setNumIids($item['num_iid']);
                $resp = $c->execute($req);
                $resparr = xmlToArray($resp);
                $newitem = $resparr['results']['n_tbk_item'];
                if (count($newitem) > 0 || $newitem === null) {
                    $url = $this->tqkapi."/?m=api&a=checkcoupon&key=" . C('yh_gongju') . "&activityId=" . $item['Quan_id'] . "&itemId=" . $item['num_iid'] . "";
                    $ch = curl_init();
                    curl_setopt($ch, CURLOPT_URL, $url);
                    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
                    curl_setopt($ch, CURLOPT_HEADER, 0);
                    curl_setopt($ch, CURLOPT_HTTPHEADER, array(
                        'User-Agent:Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2946.0 Safari/537.36'
                    ));
                    curl_setopt($ch, CURLOPT_REFERER, 'http://m.taobao.com/');
                    $result = curl_exec($ch);
                    curl_close($ch);
                    $Arraycoupon = json_decode($result, true);
                    if ($Arraycoupon['status'] == 'false') {
                        /*
                         * $updata['status'] ='fail';
                         * $updata['up_time'] =NOW_TIME;
                         * $updata['pass']=0;
                         * $this->_mod->where(array(
                         * 'id' => $id
                         * ))->save( $updata);
                         */
                        $this->_mod->where(array(
                            'id' => $id
                        ))->delete();
                        exit('no');
                    } else {
                        $updata['up_time'] = NOW_TIME;
                        $updata['sellerId'] = $newitem['seller_id'];
                        $updata['volume'] = $newitem['volume'];
                        $this->_mod->where(array(
                            'id' => $id
                        ))->save($updata);
                    }
                }
            }
        }
    }
}
