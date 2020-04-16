<?php
include "global/config.php";
include "carrito.php";
include "templates/nabvar.php"

?>
<br>
<h3>Lista del carrito</h3>
<!---CONDICION QUE EVALUA SI LA SESSION CARRITO ES DISTINTO DE VACIO MUESTRA LOS PRODUCTOS--->
<?php if(!empty($_SESSION['CARRITO'])){ ?>

<table class="table table-light table-bordered">
    <tbody>
        <tr>
            <th width="35%" class="text-center">Nombre</th>
            <th width="20%" class="text-center">Marca</th>
            <th width="15%" class="text-center">Precio</th>
            <th width="20%" class="text-center">Cantidad</th>
            <th width="5%" class="text-center">Total</th>
            <th width="5%">---</th>
        </tr>
        <?php $total=0?>
        <!-----------------MOSTRANDO PRODUCTOS EN LA TABLA------------------>
        <?php foreach($_SESSION['CARRITO'] as $indice=>$prod){?>
        <tr>
            <td width="35%" class="text-center"><?php echo $prod['NOMBRE']; ?></td>
            <td width="20%" class="text-center"><?php echo $prod['MARCA']; ?></td>
            <td width="15%" class="text-center"><?php echo $prod['PRECIO']; ?></td>
            <td width="20%" class="text-center"><?php echo $prod['CANTIDAD']; ?></td>
            <td width="5%" class="text-center"><?php echo number_format($prod['PRECIO']*$prod['CANTIDAD'], 2); ?></td>
            <td width="5%">
            <!------------------FORMULARIO PARA ELIMINAR PRODUCTOS---------------------->
            <div class="col-12 col-sm-12 col-md-6 col-xl-3">
                <form action="" method="post">
                    <input type="hidden" name="id" value="<?php echo $prod['ID']; ?>">
                    <button class="btn btn-danger" type="submit" name="btnAccion" value="Eliminar">Eliminar</button></td>
                </form> 
            </div>
                             
        </tr>
        <?php $total=$total+$prod['PRECIO']*$prod['CANTIDAD']?>
        <?php } ?>
        <tr>
            <td colspan="4" align="right"><h3>Total</h3></td>
            <td align="right"><h3><?php echo number_format($total,2 ); ?></h3></td>
            <td></td>
        </tr>
        <tr>
        <!-----------BUTTON PARA PROCEDER A PAGAR EL PRODUCTO E INFORMACION-------------->
            <td colspan="5">
                <form action="pagar.php" method="post">
                    <div class="alert alert-success" role="alert">
                        <div class="form-group">
                        <label for="my-input">Correo de contacto</label>
                        <input id="email" name="email" class="form-control" type="email" required="">
                        </div>
                        <small id="emailHelp" class="form-text text-muted">Los productos se enviaran a este correo</small>
                    </div>
                    <button class="btn btn-primary btn-lg btn-block" type="submit" name="btnAccion" value="proceder">Proceder a pagar</button>
                
                </form>         
            </td>
        </tr>
    </tbody>
</table>
<?php }else{ ?>
    <!----------FIN CONDICION->MUESTRA ESTE MENSAJE SI EL CARRITO ESTA VACIO---------------->
    <div class="alert alert-success">
        No hay productos en el carrito
    </div>
<?php } ?>



<?php include "templates/footer.php"; ?>