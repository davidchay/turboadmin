<?php

if(!defined("SPECIALCONSTANT")) die('Acceso denegado');

/*
URL                          HTTP-Method  Operation

/API/ubicacion/               GET          regresa un array con datos 
                                          (id,nombre,colonia,email,celular) de usuario de tipo cliente    

/API/cliente/:id             GET          Returns the contact with id of :id
/API/cliente/nuevo           POST         Adds a new contact and return it with an id attribute added
/API/cliente/:id             PUT          Updates the contact with id of :id
/API/cliente/:id             DELETE       Deletes the contact with id of :id

*/

/*******************
###  RUTAS UBICACION  ###
********************/

## GET- optener lista de las ubicaciones
$app->get("/ubicacion/", function($request, $response) use($app){
  try
  {
    $db = getConnection();
    $ubicaciones=array();
    
    foreach ($db->ubicacion() as $ubi) {
        $ubicaciones[]  = array(
            "id_ubicacion" => $ubi["id_ubicacion"],
            "nombre" => $ubi["nombre"],
            "descripcion" => $ubi["descripcion"]            
        );
    }
    $response->withHeader("Content-Type", "application/json");
    $response->withStatus(200);
    $response->getBody()->write(json_encode($ubicaciones));
    $db=null;
    return $response;
  }catch(PDOException $e)
  {
      echo "Error: ". $e->getMessage();
  }
});
/*
## GET {id} - optener un cliente
$app->get("/cliente/{id}", function($request, $response) {
  try {
    $id = $request->getAttribute('id');
    $db = getConnection();
    $cliente=array();
    foreach ($db->clientes()->where('id_cliente',$id) as $cliente) {
          if(empty($cliente)) break;
          $clientes[]  = array(
              "id" => $cliente["id_cliente"],
              "nombre" => $cliente["nombre"],
              "direccion" => $cliente["direccion"],
              "referencias" => $cliente["referencias"],
              "colonia" => $cliente["colonia"],
              "email" => $cliente["email"],
              "telefono"=>$cliente["telefono"],
              "celular" => $cliente["celular"],
              "whatsapp" => $cliente["whatsapp"],
              "latitud" => $cliente["latitud"],
              "longitud" => $cliente["longitud"]
          );
    }
    if(empty($clientes)){
      $clientes[]=array(
        "message"=>"Error: Cliente no encotrado"
      );
    }
    $response->withHeader("Content-Type", "application/json");
    $response->withStatus(200);
    $response->getBody()->write(json_encode($clientes));
    $db=null;
    return $response;
  } catch (PDOException $e) {
    echo "Error: ". $e->getMessage();
  }
});
*/
## POST - Agregar ubicacion nuevo
$app->post("/ubicacion/nuevo", function($request, $response){
  try {
    $data = $request->getParsedBody();
    $db = getConnection();
    $nuevoUbi= $db->ubicacion()->insert($data);
    if($nuevoUbi->fetch()){
      $result=array(
        "status"=>true,
        "message"=>"Se agrego un nuevo registro"
      );
    }else{
      $result=array(
        "status"=>false,
        "message"=>"Error al tratar de agregar un registro"
      );
    }
    $response->withHeader("Content-Type", "application/json");
    $response->withStatus(200);
    $response->getBody()->write(json_encode($result));
    $db=null;
    return $response;
  }
  catch(PDOException $e)
  {
      echo "Error: ". $e->getMessage();
  }
});

## PUT - Editar datos de ubicacion
$app->put("/ubicacion/{id}", function($request, $response,$args){
  try {
    $id= (int)$args['id'];
    $db=getConnection();
    $ubicacion=$db->ubicacion()->where("id_ubicacion",$id);
    if($ubicacion->fetch()){
      $data = $request->getParsedBody();
      $result = $ubicacion->update($data);
      $result = array(
        "status"=>true,
        "message"=>"Los datos se actualizarón exitosamente"
      );
    }else{
      $result=array(
        "status"=>false,
        "message"=>":( no se pudo guardar los cambios"
      );
    }
    $response->withHeader("Content-Type", "application/json");
    $response->withStatus(200);
    $response->getBody()->write(json_encode($result));
    $db=null;
    return $response;
  } catch (PDOException $e) {
    echo "Error: ".$e->getMessage();
  }

});

## DELETE {id} - Eliminar un degistro declientes
$app->delete("/ubicacion/{id}", function($request, $response,$args){
  try {
    $id= (int)$args['id'];
    $db=getConnection();
    $ubicacion=$db->ubicacion()->where("id_ubicacion",$id);
    if($ubicacion->fetch()){
      $ubicacion->delete();
      $result=array(
        "status"=>true,
        "message"=>"La ubicación se elimino exitosamente"
      );
    }else{
      $result=array(
        "status"=>false,
        "message"=>"No se pudo eliminar el registro"
      );
    }
    $response->withHeader("Content-Type", "application/json");
    $response->withStatus(200);
    $response->getBody()->write(json_encode($result));
    $db=null;
    return $response;
  } catch (PDOException $e) {
    echo "Error: ".$e->getMessage();
  }

});
