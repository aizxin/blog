<?php
namespace Aizxin\Repositories;

use MicheleAngioni\PhalconRepositories\AbstractRepository;
use Aizxin\Models\Users;

class UserRepository extends AbstractRepository
{
    protected $model;

    public function __construct()
    {
        $this->model = new Users();
    }
}