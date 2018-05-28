<?php
/**
 * 前台控制器基类
 */
class FirstendAction extends TopAction
{
    protected $visitor = null;

    public function _initialize()
    {
        parent::_initialize();
        // 网站状态
        if (! C('yh_site_status')) {
            header('Content-Type:text/html; charset=utf-8');
            exit(C('yh_closed_reason'));
        }
		
		
        $this->_init_visitor();
        $this->_assign_oauth();
		$this->_cate_mod = D('items_cate')->cache(true, 30 * 60);
		$this->cur_url= str_replace('/index','',strtolower($_SERVER["REQUEST_URI"]));
		$this->assign('nav_curr', $this->cur_url);
		$catetree=$this->_cate_mod->where('status=1')->field('id,name')->order('id asc')->select();
		$this->assign('catetree',$catetree);
		$this->assign('request_url',$this->cur_url);
        $this->openid = I('openid','', 'trim');
		$this->backurl = I('backurl','', 'trim');
		if(!empty($this->openid)){
		$this->_wechat_login($this->openid,$this->backurl);
		}
		

    }
    /**
     * 初始化访问者
     */
    private function _init_visitor()
    {
        $this->visitor = new user_visitor();
        $this->assign('visitor', $this->visitor->info);
    }

    /**
     * 第三方登陆模块
     */
    private function _assign_oauth()
    {
        if (false === $oauth_list = F('oauth_list')) {
            $oauth_list = D('oauth')->oauth_cache();
        }
        $this->assign('oauth_list', $oauth_list);
    }
	
protected function _wechat_login($openid,$backurl){
	
switch($backurl){
	case "zhibo":
	$backurl=U('zhibo/index');
	break;
	case "record":
	$backurl=U('user/record');
	break;
	case "order":
	$backurl=U('user/order');
	break;
	case "suborder":
	$backurl=U('user/suborder');
	break;
	default:
	$backurl=U('user/ucenter');
	break;
}

$errurl=U('user/ucenter');
if(!empty($openid) && strlen($openid)>20){

$where=array(
'openid'=>$openid,
);
$U=M('user');

$exit_openid=$U->where($where)->count();

if($exit_openid>0){
            
 $res = $this->visitor->wechatlogin($openid);
 
if($res){
 	
 redirect($backurl);
	 
 }else{
 	
redirect($errurl);
	
 }
	
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
$res=$U->add($data);

$res = $this->visitor->wechatlogin($openid);

redirect($errurl);
	
 }





	
}		
		
		
}

    /**
     * SEO设置
     */
    protected function _config_seo($seo_info = array(), $data = array())
    {
        $page_seo = array(
            'title' => C('yh_site_title'),
            'keywords' => C('yh_site_keyword'),
            'description' => C('yh_site_description')
        );
        $page_seo = array_merge($page_seo, $seo_info);
        // 开始替换
        $searchs = array(
            '{site_name}',
            '{site_title}',
            '{site_keywords}',
            '{site_description}'
        );
        $replaces = array(
            C('yh_site_name'),
            C('yh_site_title'),
            C('yh_site_keyword'),
            C('yh_site_description')
        );
        preg_match_all("/\{([a-z0-9_-]+?)\}/", implode(' ', array_values($page_seo)), $pageparams);
        if ($pageparams) {
            foreach ($pageparams[1] as $var) {
                $searchs[] = '{' . $var . '}';
                $replaces[] = $data[$var] ? strip_tags($data[$var]) : '';
            }
            // 符号
            $searchspace = array(
                '((\s*\-\s*)+)',
                '((\s*\,\s*)+)',
                '((\s*\|\s*)+)',
                '((\s*\t\s*)+)',
                '((\s*_\s*)+)'
            );
            $replacespace = array(
                '-',
                ',',
                '|',
                ' ',
                '_'
            );
            foreach ($page_seo as $key => $val) {
                $page_seo[$key] = trim(preg_replace($searchspace, $replacespace, str_replace($searchs, $replaces, $val)), ' ,-|_');
            }
        }
        $this->assign('page_seo', $page_seo);
    }

    /**
     * 连接用户中心
     */
    protected function _user_server()
    {
        $passport = new passport(C('yh_integrate_code'));
        return $passport;
    }
	

    /**
     * 前台分页统一
     */
    protected function _pager($count, $pagesize, $path = null)
    {
        $pager = new Page($count, $pagesize);
        if($path){
            $pager->path = $path;
        }
        $pager->rollPage = 3;
        $pager->setConfig('header', '条记录');
        $pager->setConfig('prev', '上一页');
        $pager->setConfig('next', '下一页');
        $pager->setConfig('first', '第一页');
        $pager->setConfig('last', '最后一页');
        $pager->setConfig('theme', '%upPage% %first% %linkPage% %end% %downPage%');
        return $pager;
    }
	
	
 protected function isMobile(){
    // 如果有HTTP_X_WAP_PROFILE则一定是移动设备
    if (isset ($_SERVER['HTTP_X_WAP_PROFILE']))
    {
        return true;
    } 
    // 如果via信息含有wap则一定是移动设备,部分服务商会屏蔽该信息
    if (isset ($_SERVER['HTTP_VIA']))
    { 
        // 找不到为flase,否则为true
        return stristr($_SERVER['HTTP_VIA'], "wap") ? true : false;
    } 
    // 脑残法，判断手机发送的客户端标志,兼容性有待提高
    if (isset ($_SERVER['HTTP_USER_AGENT']))
    {
        $clientkeywords = array ('nokia',
            'sony',
            'ericsson',
            'mot',
            'samsung',
            'htc',
            'sgh',
            'lg',
            'sharp',
            'sie-',
            'philips',
            'panasonic',
            'alcatel',
            'lenovo',
            'iphone',
            'ipod',
            'blackberry',
            'meizu',
            'android',
            'netfront',
            'symbian',
            'ucweb',
            'windowsce',
            'palm',
            'operamini',
            'operamobi',
            'openwave',
            'nexusone',
            'cldc',
            'midp',
            'wap',
            'mobile'
            ); 
        // 从HTTP_USER_AGENT中查找手机浏览器的关键字
        if (preg_match("/(" . implode('|', $clientkeywords) . ")/i", strtolower($_SERVER['HTTP_USER_AGENT'])))
        {
            return true;
        } 
    } 
    // 协议法，因为有可能不准确，放到最后判断
    if (isset ($_SERVER['HTTP_ACCEPT']))
    { 
        // 如果只支持wml并且不支持html那一定是移动设备
        // 如果支持wml和html但是wml在html之前则是移动设备
        if ((strpos($_SERVER['HTTP_ACCEPT'], 'vnd.wap.wml') !== false) && (strpos($_SERVER['HTTP_ACCEPT'], 'text/html') === false || (strpos($_SERVER['HTTP_ACCEPT'], 'vnd.wap.wml') < strpos($_SERVER['HTTP_ACCEPT'], 'text/html'))))
        {
            return true;
        } 
    } 
    return false;
} 
	
    
    public function _empty()
    {
        $this->display(ACTION_NAME);
    }
}