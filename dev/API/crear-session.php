<?php

session_start();

$_SESSION['NOMBRE']='ISMAEL';
$_SESSION['PERFIL']='ADMIN';

header('Location: /');
exit;