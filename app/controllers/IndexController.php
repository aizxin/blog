<?php
namespace Aizxin\Controllers;
use Aizxin\Controllers\Controller;

class IndexController extends Controller
{
    public function indexAction()
    {
        var_dump(di('userRepo')->find(1)->toArray());
        $this->view->disable();
    }

}

