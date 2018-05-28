<?php
header("Content-type: text/html; charset=utf-8");
date_default_timezone_set('Asia/Shanghai');
require ('wechat/Wechat.php');
require ('taobao/TopSdk.php');
import("@.ORG.Snoopy");

//exit(); // 停用公众号查询
/**
 * 微信公众平台演示类
 */
// 继承Wechat类,这里实现了消息回复和接受的基本功能
class TestWechat extends Wechat
{
	
	
	function clickurl($itemtitle){
		$c = new TopClient;
		$c->appkey = APPKEY;
		$c->secretKey = SECRET;
		$req = new TbkShopGetRequest;
		$req->setFields("user_id,shop_title,shop_type,seller_nick,pict_url,shop_url");
		$req->setQ($itemtitle);
		$req->setSort("commission_rate_des");
		$req->setIsTmall("false");
		$req->setStartCredit("1");
		$req->setEndCredit("20");
		$req->setStartCommissionRate("2000");
		$req->setEndCommissionRate("123");
		$req->setStartTotalAction("1");
		$req->setEndTotalAction("100");
		$req->setStartAuctionCount("123");
		$req->setEndAuctionCount("200");
		$req->setPlatform("1");
		$req->setPageNo("1");
		$req->setPageSize("20");
		$resp = $c->execute($req);
		$resparr = $this->xmltoarray($resp);
		var_dump($resparr);
		return $resparr['model'];	
	}


		/*
		 * 获取淘宝天猫商品id
		 */
		function quid($strurl)
		{
			// 提取优惠券中的商品id
			$preg_uland = '/&itemId=(.+?)&/is';
			preg_match($preg_uland, $strurl, $allhtml_uland);
			if (! empty($allhtml_uland)) {
				$this->responseText($allhtml_uland[1]);	
			    return $allhtml_uland[1];
			}
			
			if(strpos($strurl,'.m.taobao.com/i')!== false){
				$preg_andriod = '/taobao.com\/i(.+?).htm/is';
				preg_match($preg_andriod, $strurl, $allhtml_andriod);
				if (! empty($allhtml_andriod)) {
				    return $allhtml_andriod[1];
				}	
			}
		
		
			if(strpos($strurl,'item.taobao.com')!== false){
				
			    $preg = '/var url = \'(.+?)\'\;/is';
			    preg_match($preg, $strurl, $allhtml);
			
				
			    if (! empty($allhtml)) {
			        $preg1 = '/&id=(.+?)&/is';
			        preg_match($preg1, $allhtml[1], $allhtml1);
			        if (! empty($allhtml1)) {
			            return $allhtml1[1];
			        } else {
			            $preg2 = '/taobao.com\/i(.+?).htm/is';
			            preg_match($preg2, $allhtml[1], $allhtml2);
			            
			            if (! empty($allhtml2)) {
			                return $allhtml2[1];
			            } else {
			                
			                $preg3 = '/&itemId=(.+?)&/is';
			                preg_match($preg3, $allhtml[1], $allhtml3);
			                
			                if (! empty($allhtml3)) {
			                    return $allhtml3[1];
			                }
			            }
			        }
			    }
			}else{
				$preg_tmall = '/"itemId":(.+?),/is';
				preg_match($preg_tmall, $strurl, $allhtml_tmall);
				if (! empty($allhtml_tmall)) {
				    return $allhtml_tmall[1];
				}	
			}
		}

/* 提取12位数字 */
		function get_tb_id($str)
		{
		    // return preg_match('/([0-9]{12})\b/',$str,$a) ? $a[1] : 0;
		    preg_match_all("/\d+/", $str, $array);
		    foreach ($array[0] as $key) {
		        if (strlen($key) == 12) {
		            return $key;
		        }
		    }
		}

		function xmlToArray($xml){
		    $val = json_decode(json_encode($xml),true);
		    return $val;
		}

		/*
		 * 生成短网址
		 */
		function dwz($url)
		{
		    $c = new TopClient();
		//  $appkey = "23517064";
		//  $secret = "e537d43edaccbc5088815eb06bf11a23";
		    $c->appkey = APPKEY;
		    $c->secretKey = SECRET;
		    $req = new TbkSpreadGetRequest();
		    $requests = new TbkSpreadRequest();
		    $requests->url = $url;
		    $req->setRequests(json_encode($requests));
		    $resp = $c->execute($req);
		    $resparr = $this->xmltoarray($resp);
		    return $resparr['results']['tbk_spread']['content'];
		}

		/*
		 * 查询商品详情
		 * */
		 function getdetail($itemid){
		  $c = new TopClient();
		            $c->appkey = APPKEY;
		            $c->secretKey = SECRET;
		            $req = new TbkItemInfoGetRequest();
		            $req->setFields("num_iid,title,pict_url,small_images,reserve_price,zk_final_price,user_type,provcity,item_url");
		            $req->setPlatform("1");
		            $req->setNumIids($itemid); // 524723987038 非淘宝客商品id
		            $resp = $c->execute($req);
		            $resparr = $this->xmltoarray($resp);	
			        return $resparr;
		 }

		/*
		 * 生成淘口令
		 */
		function kouling($logo, $text, $url)
		{
		    $c = new TopClient();
		//  $APPKEY = "23517064";
		//  $secret = "e537d43edaccbc5088815eb06bf11a23";
		    $c->appkey = APPKEY;
		    $c->secretKey = SECRET;
		    $req = new WirelessShareTpwdCreateRequest();
		    $tpwd_param = new IsvTpwdInfo();
		    $tpwd_param->ext = "{\"xx\":\"xx\"}";
		    $tpwd_param->logo = $logo;
		    $tpwd_param->text = $text;
		    $tpwd_param->url = $url;
		    $tpwd_param->user_id = "2342342342";
		    $req->setTpwdParam(json_encode($tpwd_param));
		    $resp = $c->execute($req);
		    $resparr = $this->xmltoarray($resp);
			//var_dump($resparr);
		    return $resparr['model'];
		}

		/*
		 * 获取优惠券信息
		 * 返回数组
		 */
		function quandetail($parterid, $quanid)
		{
//		    $snoopy = new Snoopy();
//		    $snoopy->agent = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2946.0 Safari/537.36";
//		    $snoopy->rawheaders["Pragma"] = "no-cache";
//		    $snoopy->rawheaders["X_FORWARDED_FOR"] = $this->ip(); // 伪装ip
//		    $shopquan = "http://shop.m.taobao.com/shop/coupon.htm?seller_id=" . $parterid . "&activity_id=" . $quanid;
//		    $snoopy->fetch($shopquan);
		    
		    
		    $url = "http://shop.m.taobao.com/shop/coupon.htm?seller_id=" . $parterid . "&activity_id=" . $quanid;
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
		    
		    
		    // var_dump($snoopy->results);
		    $preg = '/<div class="coupon-info">(.+?)<\/div>/is';
		    preg_match($preg, $result, $allhtml);
		    // var_dump($allhtml[1]);
		    if (empty($allhtml)) {
		        
		        // return false;
		    } else {
		        
		        $regdl = '/<dt.*?>(.+?)<\/dt>/is';
		        preg_match($regdl, $allhtml[1], $quanprice);
		        $regdd = '/<dd.*?>(.+?)<\/dd>/is';
		        preg_match_all($regdd, $allhtml[1], $quantime);
		        // var_dump($quantime[1]);
		        $quan_money = $quanprice[1]; // 优惠券金额
		        $quan_time = $quantime[1][2]; // 优惠券有效期
		        $quan_menkan = $quantime[1][1]; // 优惠券门槛
		        $quanitem = array(
		            'erdu' => $quan_money,
		            'menkan' => $quan_menkan,
		            'shijian' => $quan_time
		        );
		        if ($quan_money > 0) {
		            return $quanitem;
		        }
		    }
		}

		/*
		 * 提取文本中的链接
		 */
		function getlink($content)
		{
		    $pregstr = "/(http:\/\/[A-Za-z0-9_#?.&=\/]+)([\x{4e00}-\x{9fa5}])?(\s)?/u";
		    if (preg_match($pregstr, $content, $matchArray)) {
		        $body = $matchArray[1]; // 以空格或者中文仅接着链接地址，提取链接地址
		        return $body;
		    }
		}

		/*
		 * 获取token
		 */
		function get_token()
		{
		//  $appid = "wx1608c8c8faef3d6a";
		//  $appsecret = "328095df451ba53f51e96947397ea11b";
		    $url = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=".APPID."&secret=".APPSECRET;
		    $ch = curl_init();
		    curl_setopt($ch, CURLOPT_URL, $url);
		    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
		    curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, FALSE);
		    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
		    $output = curl_exec($ch);
		    curl_close($ch);
		    $jsoninfo = json_decode($output, true);
		    $access_token = $jsoninfo["access_token"];
		    return $access_token;
		}
		
		/* 生成随机的国内ip地址 */
		function ip()
		{
		    $ip_long = array(
		        array(
		            '607649792',
		            '608174079'
		        ), // 36.56.0.0-36.63.255.255
		        array(
		            '1038614528',
		            '1039007743'
		        ), // 61.232.0.0-61.237.255.255
		        array(
		            '1783627776',
		            '1784676351'
		        ), // 106.80.0.0-106.95.255.255
		        array(
		            '2035023872',
		            '2035154943'
		        ), // 121.76.0.0-121.77.255.255
		        array(
		            '2078801920',
		            '2079064063'
		        ), // 123.232.0.0-123.235.255.255
		        array(
		            '-1950089216',
		            '-1948778497'
		        ), // 139.196.0.0-139.215.255.255
		        array(
		            '-1425539072',
		            '-1425014785'
		        ), // 171.8.0.0-171.15.255.255
		        array(
		            '-1236271104',
		            '-1235419137'
		        ), // 182.80.0.0-182.92.255.255
		        array(
		            '-770113536',
		            '-768606209'
		        ), // 210.25.0.0-210.47.255.255
		        array(
		            '-569376768',
		            '-564133889'
		        )
		    ) // 222.16.0.0-222.95.255.255
		;
		    $rand_key = mt_rand(0, 9);
		    return $ip = long2ip(mt_rand($ip_long[$rand_key][0], $ip_long[$rand_key][1]));
			}
	

    /*
     * 关注推送图文消息
     */
    protected function onSubscribe()
    {
        $items = array(
            new NewsResponseItem('欢迎来到可买得！想知道如何找淘宝内部优惠券吗？戳这里看看。', '千挑万选找到了自己心仪的宝贝，怎样才能更优惠？虽然可买得不能帮您免单，但是我们开发的这款神器可以帮您省钱，随时随地查询淘宝天猫内部优惠券。', 'https://mmbiz.qlogo.cn/mmbiz_png/cWXAzPz5lMG15vRPpzhHoQdnPr1ComInbHvAiaYvhqrGhHCZ63OIKJ9OaCZkmgv2WaANAEibZCXNXSKd1tNxkaiaA/0?wx_fmt=png', 'http://m.kemaide.com/article/view_921')
        )
        // new NewsResponseItem(
        // '标题二',
        // '描述二',
        // $this->getRequest('picurl'),
        // 'http://m.kemaide.com'),
        ;
        $this->responseNews($items);
    }

    protected function onImage()
    {
        $items = array(
            new NewsResponseItem('标题一', $this->getRequestTxt(), $this->getRequest('picurl'), 'http://weixin.com'),
            new NewsResponseItem('标题二', '描述二', $this->getRequest('picurl'), 'http://weixin.com')
        );
        $this->responseNews($items);
    }

    /**
     * 收到文本消息时触发，回复收到的文本消息内容
     *
     * @return void
     */
    // step 2
    // 收到用户发给公众号的文本信息的时候会调用此函数
    protected function onText()
    {
    	
        // $this->getRequest('content') 返回的是用户发送给公众号的文本
        /*
         * 连接数据库
         */
        $conn = mysql_connect('localhost', 'taoke', 'LTY520com.') or die("error connecting");
        mysql_query("set names 'utf8'");
        mysql_select_db('taoke');
        $appkey_bc = "23589473";
        $secret_bc = "14a6e87bc64a385a184578d505c22336";
		//$appkey = "23517064";
		//$secret = "e537d43edaccbc5088815eb06bf11a23";
        $openid = $this->getRequest('FromUserName'); // 请求者的openid
        
        $myword = $this->getRequest('content'); 
        if(mb_strlen($myword,'UTF-8')<10){
       
	        $sql   = "select * from tqk_items where title like '%$myword%' order by id desc limit 5";
	        $query = mysql_query($sql,$conn);
	        $rows  = mysql_fetch_array($query);  
	  		if($rows){
				$items = array();
				$myrow = '';
				while($rows=mysql_fetch_array($query)){
					$myrow = new NewsResponseItem('券后价:'.$rows['coupon_price'].'元   '.$rows['title'],'' ,$rows['pic_url'],publicUrl."/detail/id/".$rows['id']);
					$items[] = $myrow;
				}
	    		$this->responseNews($items);
	    	}else{
	    		$this->responseText('您输入的关键字的商品不存在！');
	    	}
    }
        
        /*
         * 处理用户@111指令
         */
        if (trim($this->getRequest('content')) == "@111") {
            $sql = "select * from weixin_quanlist where uid='" . $openid . "' order by id desc limit 0,1";
            $query = mysql_query($sql, $conn);
            $row = mysql_fetch_array($query);
            if (! empty($row)) {
                if ($row['cha'] < $row['nums']) {
                    $quanlistarray = unserialize($row['content']);
                    
                    $sql = "update weixin_quanlist set cha=" . ($row['cha'] + 1) . " where id=" . $row['id'] . "";
                    mysql_query($sql);
                    
                    $this->responseText($quanlistarray[($row['cha'])]);
                } else {
                    $this->responseText('已经没有优惠券啦！');
                }
            }
        }
		
		// 根据优惠券地址生成淘口令和推广链接 start 
		if(strpos($this->getRequest('content'),'uland.taobao.com')!== false){
		$num_id=$this->quid($this->getRequest('content'));
		$resparr=$this->getdetail($num_id);
		$quanrul=$this->getRequest('content');
		$itemimg = $resparr['results']['n_tbk_item']['pict_url']; // 获取商品缩略图
		$itemtitle = $resparr['results']['n_tbk_item']['title']; // 获取商品的标题
		$kouling = $this->kouling($itemimg, $itemtitle, $quanrul);
		$dwz = $this->dwz($quanrul); // 生成短网址
		 $newcontent = $itemtitle.'';
		$newcontent .= '【领券链接】'.$dwz.'';
		            
		$newcontent .= '点击链接，再选择浏览器打开或者复制这条信息，打开[拥抱]手机淘宝[拥抱]' . $kouling . '即可领券购买！';	
		 $this->responseText($newcontent); // 推送结果
		
		}
		//$snoopy = new Snoopy();
		// 生成优惠券淘口令  end 
        $url = $this->getlink($this->getRequest('content'));
        if (!empty($url)) {
//          $snoopy->agent = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2946.0 Safari/537.36";
//          $snoopy->rawheaders["Pragma"] = "no-cache";
//          $snoopy->rawheaders["X_FORWARDED_FOR"] = $this->ip(); // 伪装ip
//          $snoopy->fetch($url); // 获取所有内容
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
            $itemid = $this->quid($result); // 商品id
            
            if($itemid<=0){
             $this->responseText('抱歉！此条信息系统无法识别。');
            }
            
            /*
             * 查询卖家id和佣金情况
             */
            $url = "http://pub.alimama.com/items/search.json?q=https://item.taobao.com/item.htm?id=" . $itemid;
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
            
            
            $parterid = $result;
            
            $parter = json_decode($parterid, true);
            $parterid = $parter['data']['pageList'][0]['sellerId']; // 获得卖家id
            $tkRate = $parter['data']['pageList'][0]['tkRate']; // 佣金比例
            $tkCommFee = $parter['data']['pageList'][0]['tkCommFee']; // 返佣金
            
            /*
             * 查询商品的信息
             */
            $resparr=$this->getdetail($itemid);
		   
		  //  $this->responseText(serialize($resparr).'++');
			
            if (count($resparr) > 1) {
                $itemprice = $resparr['results']['n_tbk_item']['zk_final_price']; // 获取商品的折扣价格
                $itemimg = $resparr['results']['n_tbk_item']['pict_url']; // 获取商品缩略图
                $itemtitle = $resparr['results']['n_tbk_item']['title']; // 获取商品的标题
                
                /*
                 * 查询隐藏优惠券
                */
               
//              $quanurl = 'http://zhushou4.taokezhushou.com/api/v1/coupon?sellerId='.$parterid.'&itemId='.$itemid;
//              $snoopy->fetch($quanurl);
               
               $url = 'http://zhushou4.taokezhushou.com/api/v1/coupon?sellerId='.$parterid.'&itemId='.$itemid;
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
               
               
                $quanlist = json_decode($result, true);
                
				// $this->responseText(serialize($quanlist['data']).'++');
				//	$this->responseText($parterid.'++'.$itemid);
                // var_dump($quanlist);
             if (count($quanlist['dataList']) > 0){
                    $i = 0;
                    $newcontent = "";
                    $newcontentarray = array();
                    
                    foreach ($quanlist['dataList'] as $k) {
                        $quanid = $k['activityId'];
                        $quan = $this->quandetail($parterid, $quanid);
                        
                        if (count($quan) > 2) { // 过滤不存在的优惠券
                                            // $preg='/单笔满(.+?)元/is';
                                            // preg_match($preg,$quan['menkan'],$goodmoney);
                                            // if($goodmoney[1]<=$itemprice){// 过滤不能用的优惠券
                            
                            $quanurl = 'https://uland.taobao.com/coupon/edetail?activityId=' . $quanid . '&itemId=' . $itemid . '&pid=mm_11702096_18566204_65628339&shareurl=true&dx=1&app=chrome';
                            $kouling = $this->kouling($itemimg, $itemtitle, $quanurl); // 生成淘口令
                            $dwz = $this->dwz($quanurl); // 生成短网址
                            $newcontent = '[鼓掌]【为您找到1张优惠券啦！】';
                            $newcontent .= '[嘘]如果不满意，发送“@111”继续查找此商品优惠券！';
                            $newcontent .= '[玫瑰]' . $quan['shijian'] . '';
                            $newcontent .= '[凋谢]' . $quan['menkan'] . '(商品售价' . $itemprice . '元)';
                            $newcontent .= '复制这条信息，打开[拥抱]手机淘宝[拥抱]' . $kouling . '或者点击链接，再选择浏览器打开，即可领取！' . $dwz . '';
                            $newcontentarray[$i] = $newcontent; // 生成新的数组用于存储数据库
                            $i ++;
                        }
                        // }
                    } // foreach 到这里结束
                    
                    /*
                     * 查询一条可用的优惠券
                     */
                    
//                  $dpquan = "http://gateway.shihuizhu.com/api/goods/" . $itemid;
//                  $snoopy->fetch($dpquan);
                    
                    $url = "http://gateway.shihuizhu.com/api/goods/" . $itemid;
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
                    
                    
                    
                    $dpquanlist = json_decode($result, true);
                    	
                    if ($dpquanlist['result']['stoptime'] > time()) { // 如果查询到可用的优惠券
                        
                        $quanurls = $dpquanlist['result']['coupon_url'];
					
					if(strpos($quanurls,'activity_id')!== false){
					 $preg3 = '/&activity_id=(.*)/is';
					}else{
					 $preg3 = '/&activityid=(.*)/is';	
					}
                        preg_match($preg3, $quanurls, $allhtml3);
                        $quanid = $allhtml3[1];
                        
                        $quanurl = 'https://uland.taobao.com/coupon/edetail?activityId=' . $quanid . '&itemId=' . $itemid . '&pid=mm_11702096_18566204_65628339&shareurl=true&dx=1&app=chrome';
                        $kouling = $this->kouling($itemimg, $itemtitle, $quanurl); // 生成淘口令
                        $dwz = $this->dwz($quanurl); // 生成短网址
                     
                        $topnewcontent = '[鼓掌]【为您找到' . $dpquanlist['result']['coupon_money'] . '优惠券】';
                        $topnewcontent .= '[嘘]如果不满意，发送“@111”继续查找此商品优惠券！';
                        $topnewcontent .= '[玫瑰]有效期至' . date("Y-m-d", $dpquanlist['result']['stoptime']) . '';
                        $topnewcontent .= '[玫瑰] 券后' . $dpquanlist['result']['price'] . '元';                    
                        $topnewcontent .= '复制这条信息，打开[拥抱]手机淘宝[拥抱]' . $kouling . '或者点击链接，再选择浏览器打开，即可领取！' . $dwz . '';
                    }
		
                    //$this->responseText($topnewcontent); // 推荐的的优惠券  
                    /*
                     * 此处输出优惠券信息 暂时屏蔽掉这里
                     */
                  if (!empty($newcontent) || !empty($topnewcontent)) {
                        
                        // 把优惠券信息写入数据库
                        $sql = "insert into weixin_quanlist(pid,uid,content,nums,cha,addtime) values('" . $itemid . "','" . $openid . "','" . serialize($newcontentarray) . "'," . $i . ",1,'" . time() . "')";
                        $query = mysql_query($sql);
                        
                        if (! empty($topnewcontent)) {
                            
                            $this->responseText($topnewcontent); // 推荐的的优惠券
                        } else {
                            $this->responseText($newcontentarray[0]); // 正常的优惠券
                        }
                    } else {
                        $this->responseText('优惠券有门槛！');
                    }
                } else {
                    /*
                     * 此处处理有佣金但是没有优惠券
                     * 通过返红包引导客户下单
                     */
                     $quanurl = 'https://uland.taobao.com/coupon/edetail?activityId=026a0d0190114c4db772a20e58a3fc0c&itemId=' . $itemid . '&pid=mm_11702096_18566204_65628339&shareurl=true&app=chrome';
                    // $quanurl= 'https://item.taobao.com/item.htm?id='.$itemid.'&ali_trackid=2:mm_11702096_20830626_70504828:1492945738_3k5_254447193&pvid=10_114.224.103.236_457_1492945710303';
                    //$quanurl='http://item.taobao.com/item.htm?id='.$itemid.'&pid=mm_11702096_20830626_70504828';
                    $kouling = $this->kouling($itemimg, $itemtitle, $quanurl); // 生成淘口令
                    $dwz = $this->dwz($quanurl); // 生成短网址
                   $tkCommFee = floor($tkCommFee * 0.5); // 返现比率
                    if ($tkCommFee < 1) {
                        $tkCommFee = 1; // 如果佣金比例小于1元，设置为1元返现
                    }
                    
                    $notcommfee = '[凋谢]抱歉！此商品没有优惠券。
					[嘘]复制这条信息，去下单可获得' . $tkCommFee . '元红包。
					领取方式：下单后截图给客服
					客服微信号：m18961519251
					复制这条信息，打开[拥抱]手机淘宝[拥抱]' . $kouling . '
					或者点击链接，再选择浏览器打开下单！
					' . $dwz . '';     
                    $this->responseText($notcommfee); // 公众号输出消息
                                                          
                    // $this->responseText('此商品暂时没有内部优惠券啦！'); // 公众号输出消息
                }
            } else {
                /*
                 * 此处处理没有佣金的商品
                 */
                $this->responseText('此商品暂时没有内部优惠券！'); // 公众号输出消息
            }
        }
        	
    }
    
    
}

		

?>