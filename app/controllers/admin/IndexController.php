<?php
namespace Sow\Controllers\Admin;
use Sow\Controllers\Admin\BaseController;

class IndexController extends BaseController
{
    public function initialize(){
        parent::initialize();
    }
    public function indexAction()
    {
        $this->view->pick('admin/index/index');
    }

}

