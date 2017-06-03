<?php
namespace Sow\Repositories;

use MicheleAngioni\PhalconRepositories\AbstractRepository;
use Sow\Models\User;

class UserRepository extends AbstractRepository
{
    protected $model;

    public function __construct()
    {
        $this->model = new User();
    }
    /**
     *  [postLogin 管理员登录]
     *  @author Sow
     *  @DateTime 2017-06-03T00:02:46+0800
     *  @param    [type]                   $request [description]
     *  @return   [type]                            [description]
     */
    public function postLogin($request)
    {

    }
}