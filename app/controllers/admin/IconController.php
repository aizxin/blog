<?php
namespace Sow\Controllers\Admin;
use Sow\Controllers\Admin\BaseController;

class IconController extends BaseController
{
    public function initialize(){
        parent::initialize();
    }
    /**
     *  [indexAction 图标]
     *  @author Sow
     *  @DateTime 2017-06-10T17:41:42+0800
     *  @return   [type]                   [description]
     */
    public function indexAction()
    {
        $this->view->pick('admin/icon/index');
    }

}

