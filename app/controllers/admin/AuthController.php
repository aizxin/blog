<?php
namespace Sow\Controllers\Admin;
use Sow\Controllers\Controller;
use Sow\Validators\AuthValidator;
use Phalcon\Validation;
use Phalcon\Validation\Validator\StringLength;
use Phalcon\Validation\Validator\PresenceOf;
class AuthController extends Controller
{
    public function indexAction()
    {
        if ($this->request->isPost()) {
            $validation = new AuthValidator();
            $messages = $validation->validate($this->request->getPost());
            if (count($messages)) {
                return $this->response->setJsonContent($messages[0]->getMessage());
            }
        }
        $this->view->pick('admin/auth/login');
    }

}

