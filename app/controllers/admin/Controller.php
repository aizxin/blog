<?php
namespace Sow\Controllers\Admin;
use Sow\Controllers\Controller as BaseController;
use Sow\Traits\Controller as ControllerTraits;

class Controller extends BaseController
{
    use ControllerTraits;
    public function initialize(){
        $this->authCheck();
        $this->menu();
    }
    /**
     *  [authCheck 判断管理员是否登录]
     *  @author Sow
     *  @DateTime 2017-06-04T00:39:26+0800
     *  @return   [type]                   [description]
     */
    public function authCheck()
    {
        if(!$this->session->has('userInfo')){
            $this->response->redirect('admin/auth');
        }
    }
    /**
     *  [menu 左侧菜单]
     *  @author Sow
     *  @DateTime 2017-06-14T22:24:08+0800
     *  @return   [type]                   [description]
     */
    public function menu()
    {
        $action = $this->dispatcher->getActionName();
        $url = $this->request->getURI();
        $url = substr($url,1);
        // var_dump($url);
        // $userInfo = $this->session->get('userInfo');
        // var_dump(new \Sow\Roles\Middlewares\VerifyPermission($url));
        $menu = $this->cache->get('userPermissions');
        $this->view->parentId = 0;
        $this->view->id = 2;
        foreach ($menu as $kv) {
            if($kv['slug'] == $url){
                $this->view->parentId = $kv['parent_id'];
                $this->view->id = $kv['id'];
            }
        }
        $this->view->menu = sort_parent($menu);
        // $this->view->disable();
    }

}

