<?php
class TopAction extends FuncAction
{
    protected function _initialize()
    {
        Input::noGPC();
        if (false === ($setting = F('setting'))) {
            $setting = D('setting')->setting_cache();
        }		
        C($setting);
        $this->assign('async_sendmail', session('async_sendmail'));
		
		$where = 'coupon_end_time <'.time();
		M('items')->where($where)->delete();
    }
    
    public function _empty()
    {
        $this->_404();
    }
	
    protected function _404($url = '')
    {
        if ($url) {
            redirect($url);
        } else {
            send_http_status(404);
            $this->display(TMPL_PATH . '404.html');
            exit;
        }
    }
    public function getItem($num_iid,$activityId){
        $shopUrl = 'http://hws.m.taobao.com/cache/wdetail/5.0/?id=' . $num_iid;
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $shopUrl);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);
        curl_setopt($ch, CURLOPT_MAXREDIRS, 3);
        $contents = curl_exec($ch);
        curl_close($ch);
        if (!$contents) {
            $contents = file_get_contents($shopUrl);
        }
        $comslist = json_decode($contents, true);
        if ($contents) {
			$info = array();
			$tmp = json_decode($comslist['data']['apiStack'][0]['value'], true);
			$info['title'] = $comslist['data']['itemInfoModel']['title'];
			$info['volume'] = $tmp['data']['itemInfoModel']['totalSoldQuantity'];
			$info['pai'] = $tmp['data']['itemInfoModel']['priceUnits'][0]['name'];
			$info['pai'] = mb_substr($info['pai'], 0, 2, 'utf-8');
			$info['coupon_price'] = $tmp['data']['itemInfoModel']['priceUnits'][0]['price'];
			if (substr_count($info['coupon_price'], '-')) {
				$tmp1 = explode('-', $info['coupon_price']);
				$info['coupon_price'] = min($tmp1[0], $tmp1[1]);
			}
			$info['price'] = $tmp['data']['itemInfoModel']['priceUnits'][1]['price'];
			if (substr_count($info['price'], '-')) {
				$tmp = explode('-', $info['price']);
				$info['price'] = min($tmp[0], $tmp[1]);
			}
			$info['pic_url'] = $comslist['data']['itemInfoModel']['picsPath'][0];
			$info['pic_url'] = str_replace('_320x320.jpg', "", $info['pic_url']);
			$info['sellerId'] = $comslist['data']['seller']['userNumId'];
			$info['nick'] = $comslist['data']['seller']['nick'];
            if ($comslist['data']["trackParams"]["BC_type"] == "B") {
                $info['shop_type'] = "B";
            } else {
                $info['shop_type'] = "C";
            }
			
			//var_dump($comslist['data']["trackParams"]["BC_type"]);
			
            if (strpos($tmp['data']["delivery"]["deliveryFees"][0], '包邮')  === false) {
                $info['ems'] = "0";
            } else {
                $info['ems'] = "1";
            }
			$info['num_iid'] = $num_iid;
            $info['coupon_start_time'] = date('Y-m-d H:i', time());
            $info['coupon_end_time'] = date('Y-m-d H:i', time() + 86400 * 7);
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
            $info['desc'] = $desc[1] . '' . $desc[2] . '' . $desc[3] . '' . $desc[4] . '' . $desc[5] . '' . $desc[6] . '' . $desc[7] . '' . $desc[8] . '' . $desc[9] . '' . $desc[10] . '' . $desc[11] . '' . $desc[12] . '' . $desc[13] . '' . $desc[14] . '' . $desc[15] . '' . $desc[16] . '' . $desc[17] . '' . $desc[18] . '' . $desc[19] . '' . $desc[20] . '' . $desc[21] . '' . $desc[22] . '' . $desc[23] . '' . $desc[24] . '' . $desc[25] . '' . $desc[26] . '' . $desc[27] . '' . $desc[28] . '' . $desc[29] . '' . $desc[30];
			
            return $info;
        } else {
            return false;
        }
    }
    public function http($url)
    {
        set_time_limit(0);
        $result = file_get_contents($url);
        if ($result === false) {
            $curl = curl_init();
            curl_setopt($curl, CURLOPT_URL, $url);
            curl_setopt($curl, CURLOPT_HEADER, false);
            curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
            $result = curl_exec($curl);
            curl_close($curl);
        }
        if (empty($result)) {
            $result = false;
        }
        return $result;
    }
    public function get_id($url)
    {
        $id = 0;
        $parse = parse_url($url);
        if (isset($parse['query'])) {
            parse_str($parse['query'], $params);
            if (isset($params['id'])) {
                $id = $params['id'];
            } elseif (isset($params['item_id'])) {
                $id = $params['item_id'];
            } elseif (isset($params['default_item_id'])) {
                $id = $params['default_item_id'];
            } elseif (isset($params['amp;id'])) {
                $id = $params['amp;id'];
            } elseif (isset($params['amp;item_id'])) {
                $id = $params['amp;item_id'];
            } elseif (isset($params['amp;default_item_id'])) {
                $id = $params['amp;default_item_id'];
            }
        }
        return $id;
    }
	
	
protected function getRobot(){
if(empty($_SERVER['HTTP_USER_AGENT']))
 {
  return false;
 }
 $searchEngineBot = array(
  'googlebot'=>'google',
  'mediapartners-google'=>'google',
  'baiduspider'=>'baidu',
  'msnbot'=>'msn',
  'dotbot'=>'dotbot',
  'youdaobot'=>'yodao',
  'yahoo! slurp'=>'yahoo',
  'yahoo! slurp china'=>'yahoo',
  'iaskspider'=>'iask',
  'sogou web spider'=>'sogou',
  'sogou push spider'=>'sogou',
  'sosospider'=>'soso',
  'bingbot'=>'bing',
  'yandexbot'=>'yan',
  'ahrefsbot'=>'ahrefs',
  '360Spider'=>'360',
  'sitemapx'=>'sitemapx',
  'spider'=>'other',
  'alibaba.security'=>'alibaba',
  'bot'=>'bot',
  'crawler'=>'other',
 );
 $spider = strtolower($_SERVER['HTTP_USER_AGENT']);
 foreach ($searchEngineBot as $key => $value)
 { 
  if (strpos($spider, $key)!== false)
  {
   return $value;
  }
 }
 return false;
}
    
    /*
	 * 验证是否存在openid
	 */
	protected function verificat(){
		$openid = $_SESSION['user']['openid'];
		$json=array(                                 
			'status'=>'out',                             
			'msg'=>'登录超时'                                
		);  
	  	if(!$openid){
	  		exit(json_encode($json));
	  	}
	}  
     
}