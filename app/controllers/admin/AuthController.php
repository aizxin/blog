<?php
namespace Sow\Controllers\Admin;

use Sow\Controllers\Controller;
use Sow\Validations\AuthValidation;

class AuthController extends Controller
{
    public function indexAction()
    {
        if ($this->request->isPost()) {
            $request = $this->request->getJsonRawBody(['name','password']);
            try {
                validate('auth')->validator($request);
                $request['password'] = setPassword($request['password']);
                $user = $this->repo->getModel('user')->create($request);
                return apiSuccess($user);
            } catch (\Phalcon\Validation\Exception $ex) {
                return apiError($ex->getMessage());
            }
        }
        $this->view->pick('admin/auth/login');
    }

}

