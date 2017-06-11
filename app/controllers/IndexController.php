<?php
namespace Sow\Controllers;
use Sow\Controllers\Controller;

class IndexController extends Controller
{
    public function indexAction()
    {
        echo phpinfo();
        $this->view->disable();
    }

}

