<?php
use Phalcon\Di\FactoryDefault;

error_reporting(E_ALL);

define('BASE_PATH', dirname(__DIR__));
define('APP_PATH', BASE_PATH . '/app');
// 设置时区
date_default_timezone_set('Asia/Shanghai');
try {
    /** Read vendor autoload */
    if (file_exists(BASE_PATH . "/vendor/autoload.php")) {
        include BASE_PATH . "/vendor/autoload.php";
    }
    /**
     * The FactoryDefault Dependency Injector automatically registers
     * the services that provide a full stack framework.
     */
    $di = new FactoryDefault();

    /**
     * Handle routes
     */
    include BASE_PATH . '/config/router.php';

    /**
     * Read services
     */
    include BASE_PATH . '/config/services.php';
    /**
     * Get config service for use in inline setup below
     */
    $config = $di->getConfig();
    /**
     * Include Autoloader
     */
    include BASE_PATH . '/config/loader.php';

    /**
     * Handle the request
     */
    $application = new \Phalcon\Mvc\Application($di);
    // $application->useImplicitView(false);
    echo $application->handle()->getContent();

} catch (\Exception $e) {
    echo $e->getMessage() . '<br>';
    echo '<pre>' . $e->getTraceAsString() . '</pre>';
}
