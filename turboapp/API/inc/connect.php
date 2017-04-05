<?php
if(!defined("SPECIALCONSTANT")) die('Acceso denegado');

require 'vendor/notorm/NotORM.php';

function getPDO(){
  try
  {
    $db_user='root';
    $db_password='alfayomega';
    $db_name="turboadmin";

    $_PDO= new PDO("mysql:host=localhost;dbname=$db_name", $db_user, $db_password);
    $_PDO->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

  }
  catch(PDOException $e)
  {
      echo "Error: ". $e->getMessage();
  }
  return $_PDO;

}

function getConnection()
{
  try{
    $connection=getPDO();
    $db= new NotORM($connection);
  }
  catch(PDOException $e)
  {
      echo "Error: ". $e->getMessage();
  }
  return $db;
}
