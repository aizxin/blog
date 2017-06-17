<?php

$router = $di->getRouter();

// Define your routes here
$router->removeExtraSlashes( true );
// 前台
// /默认url
$router->add('/', [
    'namespace' => 'Sow\Controllers\Home',
    'controller' => 'index',
    'action' => 'index'
]);
// /category
$router->add('/:controller', [
    'namespace' => 'Sow\Controllers\Home',
    'controller' => 1,
    'action' => 'index'
]);
$router->add('/:controller/:action', [
    'namespace' => 'Sow\Controllers\Home',
    'controller' => 1,
    'action' => 2
]);
// /category/1
$router->add('/:controller/:params', [
    'namespace' => 'Sow\Controllers\Home',
    'controller' => 1,
    'action' => 'show',
    'id' => 2
]);
// /category/1/edit
$router->add('/:controller/:params/:action', [
    'namespace' => 'Sow\Controllers\Home',
    'controller' => 1,
    'action' => 3,
    'params' => 2
]);

//api路由组
$router->add('/api/:controller/:action/:params', [
    'namespace' => 'Sow\Controllers\Api',
    'controller' => 1,
    'action' => 2,
    'params' => 3,
]);
$router->add('/api/:controller', [
    'namespace' => 'Sow\Controllers\Api',
    'controller' => 1
]);

//admin路由组 /admin/category/create
$router->add('/admin/:controller/:action', [
    'namespace' => 'Sow\Controllers\Admin',
    'controller' => 1,
    'action' => 2
]);
// /admin/category/1
$router->add('/admin/:controller/:params', [
    'namespace' => 'Sow\Controllers\Admin',
    'controller' => 1,
    'action' => 'show',
    'id' => 2
]);
// /admin/category
$router->add('/admin/:controller', [
    'namespace' => 'Sow\Controllers\Admin',
    'controller' => 1,
    'action' => 'index'
]);
// /admin/category/1/edit
$router->add('/admin/:controller/:params/:action', [
    'namespace' => 'Sow\Controllers\Admin',
    'controller' => 1,
    'action' => 3,
    'params' => 2
]);
$router->add('/admin/user/target', 'Sow\\Controllers\\Admin\\User::target')->setName('admin.user.target');
$router->handle();
