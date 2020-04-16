<?php
include "global/config.php";
include "global/db.php";
include "carrito.php";
include "templates/nabvar.php"
?>

<!-------------------------DATOS DE PAYPAL------------------->

<?php

//print_r($_GET);

$Login= curl_init(LINKAPI."/v1/oauth2/token");
curl_setopt($Login,CURLOPT_RETURNTRANSFER,TRUE);
curl_setopt($Login,CURLOPT_USERPWD,CLIENTID.":".SECRET);

curl_setopt($Login,CURLOPT_POSTFIELDS,"grant_type=client_credentials");

$Respuesta=curl_exec($Login);

$objRespuesta=json_decode($Respuesta);

$AccessToken=$objRespuesta->access_token;

//print_r($AccessToken);

//DETALLE DE VENTA
$venta = curl_init(LINKAPI."/v1/payments/payment/".$_GET['paymentID']);

curl_setopt($venta,CURLOPT_HTTPHEADER,array("Content-Type: application/json","Authorization: Bearer ".$AccessToken));

curl_setopt($venta,CURLOPT_RETURNTRANSFER,TRUE);

$RespuestaVenta=curl_exec($venta);

//print_r($RespuestaVenta);

$objDatosTransaccion=json_decode($RespuestaVenta);

//print_r($total=$objDatosTransaccion->transactions);

$state=$objDatosTransaccion->state;
$email=$objDatosTransaccion->payer->payer_info->email;
$total=$objDatosTransaccion->transactions[0]->amount->total;
$currency=$objDatosTransaccion->transactions[0]->amount->currency;
$custom=$objDatosTransaccion->transactions[0]->custom;

$clave=explode("#",$custom);

$SID=$clave[0];
$ClaveVenta=$clave[1];

curl_close($venta);
curl_close($Login);

if($state=="approved"){
    $mensajePaypal="<h3>Pago Aprobado</h3>";

    //ACTUALIZANDO MI PAGO EN LA BASE DE DATOS TABLA VENTAS, PARA GARANTIZAR LA VENTA Y GUARDAR LOS DATOS EN BD

    $sentencia=$pdo->prepare("UPDATE `ventas` SET `PaypalDatos` =:PaypalDatos, `status` = 'Aprobado' WHERE `ventas`.`ID` =:ID;");
    $sentencia->bindParam(":ID",$ClaveVenta);
    $sentencia->bindParam(":PaypalDatos",$RespuestaVenta);
    $sentencia->execute();

    $sentencia=$pdo->prepare("UPDATE ventas SET status='Completo' WHERE ClaveTransacion=:ClaveTransacion AND Total=:TOTAL AND ID=:ID");
    $sentencia->bindParam(":ClaveTransacion",$SID);
    $sentencia->bindParam(":TOTAL",$total);
    $sentencia->bindParam(":ID",$ClaveVenta);
    $sentencia->execute();
    //MODIFIACION DE DATOS
    $completado=$sentencia->rowCount();

    session_destroy();



}else{
    $mensajePaypal="<h3>Hay un problema con el pago de Paypal</h3>";
}

?>
<!-------------------MUESTRAR AL USUARIO QUE SE HA COMPLETADO SU TRANSACCION---------->
<div class="jumbotron">
    <h1 class="display-4">Listo</h1>
    <hr class="my-4">
    <p class="lead"><?php echo $mensajePaypal?></p>
    
    <p><?php if($completado>=1){

        $sentencia=$pdo->prepare("SELECT * FROM detalleVenta,productos WHERE detalleVenta.IDPRODUCTO=productos.CodigoProd AND detalleVenta.IDVENTA=:ID");
        $sentencia->bindParam(":ID",$ClaveVenta);
        $sentencia->execute();

        $listaProductos=$sentencia->fetchAll(PDO::FETCH_ASSOC);
        //print_r($listaProductos);
    }?>
    <div class="row">
        <!----LEE LA LISTA DE PRODUCTOS DEL CLIENTE----------->
        <?php foreach( $listaProductos as $producto){ ?>
        <div class="col-2">
            <div class="card">
                <img class="card-img-top" src="" alt="assets/img-products/<?php echo $producto['Imagen']; ?>">
                <div class="card-body">
                    <p class="card-text"><?php echo $producto['NombreProd']; ?></p>
                </div>
            </div>
        </div>
        <?php }?>
        
    </div>
    </p>

</div>