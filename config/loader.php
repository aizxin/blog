<?php

$loader = new \Phalcon\Loader();

/**
 * We're a registering a set of directories taken from the configuration file
 */
$loader->registerNamespaces([
    'Aizxin' => BASE_PATH,
    'Aizxin\Controllers' => APP_PATH . '/controllers/',
    'Aizxin\Models' => APP_PATH . '/models/',
    'Aizxin\Controllers\Api' => APP_PATH  . '/api/',
    'Aizxin\Validators' => APP_PATH . '/validations/',
    'Aizxin\Repositories' => APP_PATH . '/repositories/',
    'Aizxin\Services' => APP_PATH . '/services/',
])->registerFiles([
    'function' => APP_PATH . '/library/helper.php',
])->register();
