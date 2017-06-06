<?php
namespace Sow\Controllers\Admin;
use Sow\Controllers\Admin\Controller;

class IndexController extends Controller
{
    public function indexAction()
    {
        $this->view->pick('admin/index/index');
        // return $this->view->render('admin', 'index');
    }

}

