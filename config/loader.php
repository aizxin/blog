<?php

$loader = new \Phalcon\Loader();

/**
 * We're a registering a set of directories taken from the configuration file
 */
$loader->registerDirs(
    [
        $config->application->controllersDir,
        $config->application->modelsDir
    ]
)->register();
// $loader->registerNamespaces([
//     'Aizxin' => BASE_PATH,
//     'Aizxin\Controllers' => $config->application->controllersDir,
//     'Aizxin\Models' => $config->application->modelsDir,
//     'Aizxin\Controllers\Api' => $config->application->controllersDir  . '/api/',
//     'Aizxin\Validators' => $config->application->validatorsDir,
//     'Aizxin\Repositories' => $config->application->repositoriesDir,
//     'Aizxin\Services' => $config->application->servicesDir,
// ])->register();
