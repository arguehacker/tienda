<?php
//ARCHIVOS DE CONFIGURACION Y NAVBAR Y FOOTER
include "global/config.php";
include "global/db.php";
include "carrito.php";
include "templates/nabvar.php"
?>
<!-----------CONTENIDO------------>
          <br>
          <?php if($mensaje!=""){?>
          <div class="alert alert-success">
              <?php echo $mensaje; ?>
              <!---------------------Opcional--------------------->
              <a href="mostracarrito.php">Ver Carrito</a>
          </div>
          <?php }?>

          <div class="row">
              <?php
              //CONEXION A TABLA PRODUCTOS
              $sentencia = $pdo->prepare("SELECT * FROM `productos`");
              $sentencia->execute();
              $listaProd = $sentencia->fetchAll(PDO::FETCH_ASSOC);
              //print_r($listaProd);
              ?>
              <?php
              //Mostrando los produtos de mi tabla producto
              foreach($listaProd as $prod){ ?>
                <div class="col-12 col-sm-12 col-md-6 col-xl-3">
                    <div class="card">
                        <img title="Titulo de producto" alt="Titulo" class="card-img-top" src="assets/img-products/<?php echo $prod['Imagen']; ?>" data-toggle="popover" data-trigger="hover" data-content="Descripcion de producto" height="200px">
                        <div class="card-body">
                            <span><?php echo $prod['NombreProd']; ?></span>
                            <p class="card-text"><?php echo $prod['Marca']; ?></p>
                            <h5 class="card-title">$<?php echo $prod['Precio']; ?></h5>
                            <!-------------------------------FIN BUCLE DE MOSTRAR LOS PRODUCTOS EN EL BODY------------------------------->
                            <!-------------------------------FORMULARIO PARA AGREGAR PRODUCTOS EN EL CARRITO------------------------------->
                            <form action="" method="post">
                                <input type="hidden" name="id" id="id" value="<?php echo $prod['CodigoProd']; ?>">
                                <input type="hidden" name="nombreProd" id="nombreProd" value="<?php echo $prod['NombreProd']; ?>">
                                <input type="hidden" name="marca" id="marca" value="<?php echo $prod['Marca']; ?>">
                                <input type="hidden" name="precio" id="precio" value="<?php echo $prod['Precio']; ?>">
                                <input type="hidden" name="cantidad" id="cantidad" value="<?php echo 1; ?>">
                                <button class="btn btn-success btn-sm botonCarrito" name="btnAccion" value="Agregar" type="submit">Agregar al carrito</button>
                            </form>

                        </div>

                    </div>

                </div>

             
              <?php } ?>
              
          </div>
      </div>
    
    <!-------------------------------Bootstrap JS ------------------------------->
    <script src="js/jquery-3.4.1.slim.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <!------------------------------- fin Bootstrap JS ------------------------------->
    <!-------------------------------SCRIPT PARA MOSTRAR INFORMACION EN LOS PRODUCTOS------------------------------->
    <script>
        $(function(){
            $('[data-toggle="popover"]').popover()
        });
    </script>
    <!-------------------------------PIE DE PAGINA------------------------------->
<?php include "templates/footer.php"; ?>