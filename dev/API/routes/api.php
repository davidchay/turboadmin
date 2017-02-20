<?php

if(!defined("SPECIALCONSTANT")) die('Acceso denegado');

/*


URL                          HTTP-Method  Operation
/API/clientes/               GET          Returns an array of contacts
/API/cliente/:id             GET          Returns the contact with id of :id
/API/cliente/nuevo           POST         Adds a new contact and return it with an id attribute added
/API/cliente/:id             PUT          Updates the contact with id of :id
/API/cliente/:id             DELETE       Deletes the contact with id of :id

/api/contacts/:id/star        PUT          Adds to favorites  the contact with id of :id
/api/contacts/:id/star        DELETE       Removes from favorites  the contact with id of :id

/api/contacts/:id/notes       GET          Returns the notes for the contact with id of :id
/api/contacts/:id/notes/:nid  GET          Returns the note with id of :nid for the contact with id of :id
/api/contacts/:id/notes       POST         Adds a new note for the contact with id of :id
/api/contacts/:id/notes/:nid  PUT          Updates the note with id if :nid for the contact with id of :id
/api/contacts/:id/notes/:nid  PATCH        Partially updates the note with id of :nid for the contact with id of :id
/api/contacts/:id/notes/:nid  DELETE       Deletes the note with id of :nid for the contact with id of :id
*/


/*
RUTAS CLIENTES
*/
## GET- optener lista de clientes
$app->get("/clientes/", function($request, $response) use($app){
  try
  {
    $db = getConnection();
    $clientes=array();
    foreach ($db->clientes()->select("id_cliente,nombre,colonia,email,celular") as $cliente) {
        $clientes[]  = array(
            "id" => $cliente["id_cliente"],
            "nombre" => $cliente["nombre"],
            "colonia" => $cliente["colonia"],
            "email" => $cliente["email"],
            "celular" => $cliente["celular"],
        );
    }
    $response->withHeader("Content-Type", "application/json");
    $response->withStatus(200);
    $response->getBody()->write(json_encode($clientes));
    $db=null;
    return $response;
  }catch(PDOException $e)
  {
      echo "Error: ". $e->getMessage();
  }
});
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
## POST - Agregar cliente nuevo
$app->post("/cliente/nuevo", function($request, $response){
  try {
    $data = $request->getParsedBody();
    $db = getConnection();
    $nuevoCliente= $db->clientes()->insert($data);
    if($nuevoCliente->fetch()){
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

## PUT - Editar datos de cliente
$app->put("/cliente/{id}", function($request, $response,$args){
  try {
    $id= (int)$args['id'];
    $db=getConnection();
    $cliente=$db->clientes()->where("id_cliente",$id);
    if($cliente->fetch()){
      $data = $request->getParsedBody();
      $result=$cliente->update($data);
      $result=array(
        "status"=>(bool)$result,
        "message"=>"Los datos se actualizarón exitosamente"
      );
    }else{
      $result=array(
        "status"=>false,
        "message"=>"Error: No se pudo actulizar los datos"
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
$app->delete("/cliente/{id}", function($request, $response,$args){
  try {
    $id= (int)$args['id'];
    $db=getConnection();
    $cliente=$db->clientes()->where("id_cliente",$id);
    if($cliente->fetch()){
      $cliente->delete();
      $result=array(
        "status"=>true,
        "message"=>"El gegistro se elimino exitosamente"
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
    echo "Error: ".$e->getMessage();
  }

});
