<?php
$di->set('userRepo', function () {
    return new \Sow\Repositories\UserRepository();
});


