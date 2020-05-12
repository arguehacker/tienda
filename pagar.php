<?php
include "global/config.php";
include "global/db.php";
include "carrito.php";
include "templates/nabvar.php";
?>
<?php
if ($_POST){
    $total = 0;
    $SID=session_id();
    $NombreClient=$_POST['nombre'];
    $Correo=$_POST['email'];
    foreach($_SESSION['CARRITO'] as $indice=>$prod){
        $cantidad_prod = $prod['CANTIDAD'];
        $total=$total + ($prod['PRECIO']*$prod['CANTIDAD']);
    }
    $sentencia=$pdo->prepare("INSERT INTO `ventas` (`ID`, `ClaveTransacion`, `PaypalDatos`, `Nombre`, `Fecha`, `Correo`, `Cantidad`, `Total`, `status`) 
        VALUES (NULL,:ClaveTransacion, '',:NombreClient,NOW(),:Correo,:Cantidad,:Total, 'pendiente')");
    $sentencia->bindParam(":ClaveTransacion",$SID);
    $sentencia->bindParam(":NombreClient",$NombreClient);
    $sentencia->bindParam(":Cantidad",$cantidad_prod);
    $sentencia->bindParam(":Correo",$Correo);
    $sentencia->bindParam(":Total",$total);
    $sentencia->execute();
    $idVenta=$pdo->lastInsertId();

    foreach($_SESSION['CARRITO'] as $indice=>$prod){
        $sentencia=$pdo->prepare("INSERT INTO 
        `detalleVenta` (`ID`, `IDVENTA`, `IDPRODUCTO`, `PRECIOUNITARIO`, `CANTIDAD`, `VENDIDO`) 
        VALUES (NULL,:IDVENTA,:IDPRODUCTO,:PRECIOUNITARIO,:CANTIDAD, '1');");

        $sentencia->bindParam(":IDVENTA",$idVenta);
        $sentencia->bindParam(":IDPRODUCTO",$prod['ID']);
        $sentencia->bindParam(":PRECIOUNITARIO",$prod['PRECIO']);
        $sentencia->bindParam(":CANTIDAD",$prod['CANTIDAD']);
        $sentencia->execute();
    
    }
    //echo "<h3>".$total."</h3>";
}
?>
<!--------------------------------------------AGREGANDO CODIGO PARA PAYPAL------------------------------------------->
<script src="https://www.paypalobjects.com/api/checkout.js"></script>
<style>
   
    /* Media query for mobile viewport */
    @media screen and (max-width: 400px) {
        #paypal-button-container {
           width: 100%;
        }
    }
   
    /* Media query for desktop viewport */
    @media screen and (min-width: 400px) {
        #paypal-button-container {
           width: 250px;
            display: inline-block;
        }
    }
   
</style>
<!--------------------------------------------AGREGANDO CODIGO PARA PAYPAL------------------------------------------->



<div class="jumbotron text-center">
    <h1 class="display-4">Paso final</h1>
    <hr class="my-4">
    <p class="lead">Estas a punto de pagar con PayPal la cantidad de:</p>
    <h4>$<?php echo number_format($total, 2)?></h4>
    <div id="paypal-button-container"></div>
    <p>Los productos se podran retirar en la tienda de Technology Box</p><br>
    <strong>(Para aclaraciones : ServiciosVentas@technology Box)</strong>
</div>
 
<script>
    paypal.Button.render({
        env: 'sandbox', // sandbox | production
        style: {
            label: 'checkout',  // checkout | credit | pay | buynow | generic
            size:  'responsive', // small | medium | large | responsive
            shape: 'pill',   // pill | rect
            color: 'gold'   // gold | blue | silver | black
        },
 
        // PayPal Client IDs - replace with your own
        // Create a PayPal app: https://developer.paypal.com/developer/applications/create
 
        client: {
            sandbox:'Afm6GIAmClum0sahs4eRYfy1CK-Zh7m4oVTOIUw9qwTpkGznC6hwxIpS3eCV74-6icpnKN1AX4vYdzWa',
            production:'EF4ejD-TryWD5DpezAtd6_7JOzSFgl5OiYtWITYG1hF5tY87oEWT_mMgnnKd9OTxw53nAs1d-_E719_i'
        },
 
        // Wait for the PayPal button to be clicked

 
        payment: function(data, actions) {
            return actions.payment.create({
                payment: {
                    transactions: [
                        {
                            amount: { total: '<?php echo  $total; ?>', currency: 'USD' },
                            description:"Compra de productos a Techmology box:$<?php echo number_format($total, 2); ?>",
                            custom:"<?php echo $SID;?>#<?php echo $idVenta;?>"
                        }
                    ]
                }
            });
        },
 
        // Wait for the payment to be authorized by the customer
 
        onAuthorize: function(data, actions) {
            return actions.payment.execute().then(function() {
                console.log(data);
                window.location="verificador.php?paymentToken="+data.paymentToken+"&paymentID="+data.paymentID;
            });
        }
   
    }, '#paypal-button-container');
 
</script>
<?php include "templates/footer.php"; ?>