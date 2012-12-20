<?php

// Define path to application directory
defined('APPLICATION_PATH')
    || define('APPLICATION_PATH', realpath(dirname(__FILE__) . '/../application'));

// Define path to image directory
defined('IMAGE_PATH')
    || define('IMAGE_PATH', realpath(dirname(__FILE__) . '/image'));

// Define application environment
defined('APPLICATION_ENV')
    || define('APPLICATION_ENV', (getenv('APPLICATION_ENV') ? getenv('APPLICATION_ENV') : 'production'));
// Define application environment
defined('PUBLIC_PATH')
|| define('PUBLIC_PATH', realpath(dirname(__FILE__) . '/../public'));
		


// Ensure library/ is on include_path
set_include_path(implode(PATH_SEPARATOR, array(
    realpath(APPLICATION_PATH . '/../library'),
    get_include_path(),
)));

/** Zend_Application */
require_once 'Zend/Application.php';

// Create application, bootstrap, and run
$application = new Zend_Application(
    APPLICATION_ENV,
    APPLICATION_PATH . '/configs/application.ini',
	IMAGE_PATH
);
$application->bootstrap()
            ->run();