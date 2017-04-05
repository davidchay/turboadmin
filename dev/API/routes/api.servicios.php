<?php

if(!defined("SPECIALCONSTANT")) die('Acceso denegado');

/*


URL                          HTTP-Method  Operation
/API/servicios/               GET          Returns an array of contacts
/API/servicio/:id             GET          Returns the contact with id of :id
/API/servicio/nuevo           POST         Adds a new contact and return it with an id attribute added
/API/servicio/:id             PUT          Updates the contact with id of :id
/API/servicio/:id             DELETE       Deletes the contact with id of :id

*/

/********************
#### SERVICIOS ####
*********************/
## GET - optener todos los servicio
$app->get("/servicios/", function($request, $response){
  try {
    $db=getConnection();
    $servicios=array();
    foreach ($db->servicios() as $servicio) {
      $servicios[]=array(
        "id"=>$servicio["id_servicio"],
        "nombre"=>$servicio["nombre"],
        "descripcion"=>$servicio["descripcion"],
        "costo"=>$servicio["costo_monto"],
        "categoria"=>$servicio["categoria"]
      );
    }
    $response->withHeader("Content-Type", "application/json");
    $response->withStatus(200);
    $response->getBody()->write(json_encode($servicios));
    $db=null;
    return $response;
  } catch (PDOException $e) {
    echo "Error. " . $e->getMessage();
  }

});

## GET / {{id}} - optener un servicio por su id
$app->get("/servicio/{id}", function($request, $response, $args){
  try {
    $id=(int)$args["id"];
    $db=getConnection();
    $servicio=$db->servicios()->where('id_servicio',$id);
    if($data=$servicio->fetch())
    {
      $result=array(
        "id"=>$data["id_servicio"],
        "nombre"=>$data["nombre"],
        "descripcion"=>$data["descripcion"],
        "costo"=>$data["costo_monto"],
        "categoria"=>$data["categoria"]
      );
    }else{
      $result=array(
        "status"=>false,
        "message"=>"Error: no se encontro el registro solicitado"
      );
    }
    $response->withHeader("Content-Type", "application/json");
    $response->withStatus(200);
    $response->getBody()->write(json_encode($result));
    $db=null;
    return $response;
  } catch (PDOException $e) {
    echo "Error: " . $e->getMessage();
  }
});

## POST - Guardar un nuevo servicio
$app->post("/servicio/nuevo", function($request, $response){
    try {
      $data = $request->getParsedBody();
      $db=getConnection();
      $nuevo=$db->servicios()->insert($data);
      if($nuevo->fetch()){
        $result=array(
          "status"=>true,
          "message"=>"El registro se agrego exitosamente"
        );
      }else{
        $result=array(
          "status"=>false,
          "message"=>"Error: No se pudo guardar los registros en la base de datos"
        );
      }
      $response->withHeader("Content-Type", "application/json");
      $response->withStatus(200);
      $response->getBody()->write(json_encode($result));
      $db=null;
      return $response;
    } catch (PDOException $e) {
      echo "Error: " . $e->getMessage();
    }

});

## PUT / {id} - Edita un servicio
$app->put("/servicio/{id}", function($request, $response, $args){
  try {
    $id=(int)$args["id"];
    $db=getConnection();
    $servicios = $db->servicios()->where('id_servicio', $id);
    if($servicios->fetch()){
      $data = $request->getParsedBody();
      $result=$servicios->update($data);
      $result=array(
        "status"=>true,
        "message"=>"Los datos se actualizarón exitosamente"
      );
    }else{
      $result=array(
        "status"=>false,
        "message"=>"Error: no se pudo actualizar los datos"
      );
    }
    $response->withHeader("Content-Type", "application/json");
    $response->withStatus(200);
    $response->getBody()->write(json_encode($result));
    $db=null;
    return $response;
  } catch (PDOException $e) {
    echo "Error: " . $e->getMessage();
  }

});

## DELETE / {id} - Eliminar un registro de la tabla servicio
$app->delete("/servicio/{id}", function($request, $response, $args){
  try {
    $id=(int)$args['id'];
    $db=getConnection();
    $servicios=$db->servicios()->where('id_servicio',$id);
    if($servicios->fetch()){
      $servicios->delete();
      $result=array(
        "status"=>true,
        "message"=>"El registro se elimino exitosamente"
      );
    }else{
      $result=array(
        "status"=>false,
        "message"=>"Error: No se pudo eliminar el registro"
      );
    }
    $response->withHeader("Content-Type", "application/json");
    $response->withStatus(200);
    $response->getBody()->write(json_encode($result));
    $db=null;
    return $response;
  } catch (PDOException $e) {
    echo "Error: " . $e->getMessage();
  }

});
