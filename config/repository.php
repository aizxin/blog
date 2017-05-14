<?php

$di->set('userRepo', function () {
    return new \Aizxin\Repositories\UserRepository();
});