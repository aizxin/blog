<?php
namespace Sow\Controllers\Admin;
use Sow\Controllers\Controller;

class IndexController extends Controller
{
    public function indexAction()
    {
        // var_dump('expression');
        // $this->view->disable();
        $this->view->pick('admin/index/index');
        // return $this->view->render('admin', 'index');
    }

}

