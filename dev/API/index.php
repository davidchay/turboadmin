<?php



require 'vendor/autoload.php';

$app = new Slim\App();

define('SPECIALCONSTANT', true);

require 'inc/connect.php'; //conexion
require 'routes/api.php'; //rutas

$app->run();
