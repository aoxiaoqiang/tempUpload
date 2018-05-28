<?php
class loginAction extends FirstendAction
{
    public function _initialize()
    {
        parent::_initialize();
    }
    
    public function index(){
    	
	if($this->visitor->is_login){
            $this->redirect(U('user/ucenter'));
     }	
	 $this->_config_seo(array(
            'title'=>'用户登录'
        )); 
	
	$this->display();
    }
	

  public function register()
    {
        if($this->visitor->is_login){
            $this->redirect('user/ucenter');
        }
        
        if(IS_POST){
           $phone = $this->_param('phone','trim');
        
            $username = $this->_param('username','trim');
        
            $email = $this->_param('email','trim');
        
            $password = $this->_param('password','trim');
        
            $repassword = $this->_param('repassword','trim');
        
            if($password != $repassword){
                $this->ajaxReturn(0, '两次密码输入不一致');
            }
        
            $res = $this->visitor->register($username, $phone, $email, $password, $data);
        
            if($res){
                return $this->ajaxReturn(1, '注册成功', U('user/ucenter'));
            }
        
            $this->ajaxReturn(0, $this->visitor->error);
        }
        
        
        $this->_config_seo(array(
            'title'=>'用户注册'
        ));
        
        $this->display();
    }
    

	
	
	
	public function login(){
		
	if($this->visitor->is_login){
		    
            $this->redirect(U('user/ucenter'));
     }	
		
	   if(IS_POST){
            
            $username = $this->_param('username','trim');
            
            $password = $this->_param('password','trim');
            
            $remember = $this->_param('remember','trim', 0);
            
            $res = $this->visitor->login($username, $password, $remember);
            
            if($res){
                
                $callback = $this->_param('callback','trim');
				
				if(empty($callback)){$callback=U('user/ucenter');}
                
                if(strpos($callback, '/login') !== false){
                    $callback = U('user/ucenter');
                }
				
				return $this->ajaxReturn(1, '登录成功', $callback?$callback:U('user/ucenter'), array(
                    'id'=>$this->visitor->get('id'),
                    'nickname'=>$this->visitor->get('nickname')
                ));
               
				
            }
			
            $this->ajaxReturn(0, $this->visitor->error);
        }
		
		
	}


public function logout()
    {
        $this->visitor->logout();
        $callback = $_SERVER['HTTP_REFERER'];
        if(
            strpos($callback, '/login') !== false ||
            strpos($callback, '/user') !== false 
        ){
            $callback = C('yh_headerm_html');
        }
		
        redirect($callback);
    }
	
	
	
}  