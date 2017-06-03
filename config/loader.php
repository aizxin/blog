<?php

$loader = new \Phalcon\Loader();

/**
 * We're a registering a set of directories taken from the configuration file
 */
$loader->registerNamespaces([
    'Sow' => BASE_PATH,
    'Sow\Controllers' => $config->application->controllersDir,
    'Sow\Models' => $config->application->modelsDir,
    'Sow\Controllers\Api' => $config->application->controllersDir  . '/api/',
    'Sow\Controllers\Admin' => $config->application->controllersDir  . '/admin/',
    'Sow\Validations' => $config->application->validationsDir,
    'Sow\Repositories' => $config->application->repositoriesDir,
    'Sow\Services' => $config->application->servicesDir,
    'Sow\Traits'   => $config->application->traitsDir,
])->registerFiles(
    [
        'function' => $config->application->libraryDir . 'helper.php',
    ]
)->register();
