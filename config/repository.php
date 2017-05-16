<?php
$di->set('userRepo', function () {
    return new \Sow\Repositories\UserRepository();
});
$di->setShared('dd', function (){
    return '$var';
});


