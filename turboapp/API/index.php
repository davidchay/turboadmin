<?php



require 'vendor/autoload.php';

$app = new Slim\App();

define('SPECIALCONSTANT', true);

require 'inc/connect.php'; //conexion
//RUTAS
require 'routes/api.clientes.php'; //rutas
require 'routes/api.servicios.php'; //rutas
require 'routes/api.ubicacion.php'; //rutas

$app->run();
