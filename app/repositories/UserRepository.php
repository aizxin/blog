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
}