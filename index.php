<?php
//ARCHIVOS DE CONFIGURACION Y NAVBAR Y FOOTER
include "global/config.php";
include "global/db.php";
include "carrito.php";
include "templates/nabvar.php"
?>
<!-----------CONTENIDO------------>
          <br>
          <section>
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
                <div class="col-xs-12 col-sm-6 col-md-3">
                  <div class="thumbnail">
                    <div class="card">
                        <a><img title="Titulo de producto" alt="Titulo" class="card-img-top" alt="200" src="assets/img-products/<?php echo $prod['Imagen']; ?>" data-toggle="popover" data-trigger="hover" data-content="Descripcion de producto" height="200px"></a>
                        <div class="caption">
                          <div class="card-body">
                            <p><?php echo $prod['NombreProd']; ?></p>
                            <h3 class="card-text"><?php echo $prod['Marca']; ?></h3>
                            <p>$<?php echo $prod['Precio']; ?></p>
                            <!-------------------------------FIN BUCLE DE MOSTRAR LOS PRODUCTOS EN EL BODY------------------------------->
                            <!-------------------------------FORMULARIO PARA AGREGAR PRODUCTOS EN EL CARRITO------------------------------->
                            <form action="" method="post">
                                <input type="hidden" name="id" id="id" value="<?php echo $prod['CodigoProd']; ?>">
                                <input type="hidden" name="nombreProd" id="nombreProd" value="<?php echo $prod['NombreProd']; ?>">
                                <input type="hidden" name="marca" id="marca" value="<?php echo $prod['Marca']; ?>">
                                <input type="hidden" name="precio" id="precio" value="<?php echo $prod['Precio']; ?>">
                                <p class="text-center">
                                  <input type="hidden" name="cantidad" id="cantidad" value="<?php echo 1; ?>">
                                <button class="btn btn-success btn-sm botonCarrito" name="btnAccion" value="Agregar" type="submit"><i class="fa fa-shopping-cart"></i>&nbsp; Añadir</button>
                                </p>
                                
                            </form>

                        </div>
                          
                      </div>
                    </div>
                  </div>
                </div>
              <?php } ?>
            
          </section>
          
              <section id="distribuidores-index">
                <div class="container">
                  <div class="col-xs-12 col-sm-6"></div>
                  <div class="col-xs-12 col-sm-6"></div>
                  <div class="col-xs-12">
                    <div class="page-header">
                      <h1>Nuestras<small>Marcas</small></h1>
                      
                    </div>
                    <img src="assets/img/logos-marcas.png" alt="logos-marcas" class="img-responsive">
                    
                  </div>
                  
                </div>
                
              </section>
              
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