<?php

$router = $di->getRouter();

// Define your routes here
$router->removeExtraSlashes( true );

$router->add('/:controller/:action/:params', [
    'namespace' => 'Aizxin\Controllers',
    'controller' => 1,
    'action' => 2,
    'params' => 3,
]);

$router->add('/:controller', [
    'namespace' => 'Aizxin\Controllers',
    'controller' => 1
]);

$router->add('/api/:controller/:action/:params', [
    'namespace' => 'Aizxin\Controllers\Api',
    'controller' => 1,
    'action' => 2,
    'params' => 3,
]);

$router->add('/api/:controller', [
    'namespace' => 'Aizxin\Controllers\Api',
    'controller' => 1
]);

$router->setDefaultController( 'index' );
$router->setDefaultAction( 'index' );

$router->handle();
