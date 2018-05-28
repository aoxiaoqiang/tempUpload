<?php

class articleAction extends FirstendAction
{

    public function _initialize()
    {
        parent::_initialize();
		$reurl=$_SERVER['REQUEST_URI'];
		$reurl=str_replace('item','detail',$reurl);
		if($this->isMobile()){
		redirect(C('yh_headerm_html').$reurl);	
		}
        $this->_mod = D('article')->cache(true, 10 * 60);
        $this->_cate_mod = D('article_cate')->cache(true, 10 * 60);
        C('DATA_CACHE_TIME', C('yh_site_cachetime'));
    }

    /**
     * * 首页（全部）
     */
    public function index()
    {
        $p = I('p', 1, 'intval'); // 页码
        
        $order = 'ordid asc,id desc';
        $where['cate_id'] = '1';
        $where['status'] = '1';
        // $page_size = C('yh_index_page_size');
        $page_size = 10;
        $index_info['p'] = $p;
        
        $start = $page_size * ($p - 1);
        
        $mdarray = $where;
        $mdarray['sort'] = $sort;
        $mdarray['status'] = $status;
        $mdarray['order'] = $order;
        $mdarray['p'] = $p;
        $items_list = $this->_mod->where($where)
            ->order($order)
            ->limit($start . ',' . $page_size)
            ->select();
        $orlike = D('items')->cache(true, 10 * 60)
            ->limit('0,14')
            ->order('is_commend desc,id desc')
            ->select();
        
        $this->assign('sellers', $orlike);
        
        
        $this->assign('items_list', $items_list);
        
        $count = $this->_mod->where($where)->count();
        
        $pager = $this->_pager($count, $page_size);
        
        $this->assign('page', $pager->kshow());
        $this->assign('zpage', $pager->zshow());
        $this->assign('total_item', $count);
        $this->assign('pager', 'index');
        $this->assign('artice', 'article'); // 分类选中
        $this->display("read");
    }

    public function read()
    {
        $id = I('id', '1', 'intval');
        ! $id && $this->_404();
        $help_mod = M('article');
		
		$hits_data = array('hits'=>array('exp','hits+1'));
		$help_mod->where(array('id'=>$id))->setField($hits_data);
        $help = $help_mod->field('id,title,info,author,seo_title,seo_keys,seo_desc')->find($id);
        $helps = $help_mod->field('id,title,info,author')->select();
        $this->_config_seo(array(
            'title' => $help['seo_title']?$help['seo_title']:$help['title'],
            'keywords'=>$help['seo_keys'],
	        'description'=>$help['seo_desc']
        ));
        $this->assign('helps', $helps);
        $this->assign('id', $id);
        $this->assign('help', $help); // 分类选中
        
        $orlike = D('items')->cache(true, 10 * 60)->where("title like '%" . $help['author'] . "%' ")
            ->limit('0,8')
            ->order('is_commend desc,id desc')
            ->select();
        
        $this->assign('sellers', $orlike);
        
        $this->display('view');
    }

    public function qianggou()
    {
        $page_seo = array(
            'title' => '抢购小技巧 - '
        );
        $this->assign('page_seo', $page_seo);
        $this->display('qianggou');
    }
}