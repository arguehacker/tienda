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
              //Sirve para colocar a pagina uno
              if(!$_GET){
                header('location:index.php?pagina=1');
              }
              //CONEXION A TABLA PRODUCTOS
              $sentencia = $pdo->prepare("SELECT * FROM `productos`");
              $sentencia->execute();
              $listaProd = $sentencia->fetchAll(PDO::FETCH_ASSOC);
              $producto_Page = 4; //Esto me sirve para mostrar cuantos productos se muestran
              //Contar productos de la base de datos
              $total_productos=$sentencia->rowCount();
              $paginas = ceil($total_productos/$producto_Page); //Transformamos a entero aproximado
              ?>
              <?php
              //Sirve para bloquear en la URL posibles rompimientos de la paginación
              if($_GET['pagina']>$paginas || $_GET['pagina']<=0){
                header('location:index.php?pagina=1');
              }
              //Calculando los productos a mostra en page
              $iniciar = ($_GET['pagina']-1)*$producto_Page;

              //Mostramos el limite a mostrar con las variables 
              $sql_product = $pdo->prepare("SELECT * FROM `productos` LIMIT :iniciar,:n_product");
              //Le pasamos los parametros
              $sql_product->bindParam(':iniciar',$iniciar,PDO::PARAM_INT);
              $sql_product->bindParam(':n_product',$producto_Page,PDO::PARAM_INT);
              $sql_product->execute();
              //Utilizamos esta variable para mostrar en el foreach
              $resultado_page = $sql_product->fetchAll(PDO::FETCH_ASSOC);
              
              ?>
              <?php
              //Mostrando los produtos de mi tabla producto
              foreach($resultado_page as $prod){ ?>
                <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
                  <div class="thumbnail">
                    <div class="card">
                        <a><img title="<?php echo $prod['NombreProd'];?>" alt="Titulo" class="card-img-top" alt="200" src="assets/img-products/<?php echo $prod['Imagen']; ?>" data-toggle="popover" data-trigger="hover" data-content="Descripcion de producto" height="200px"></a>
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
                                  <!--<input type="hidden" name="cantidad" id="cantidad" value="<?php echo 1; ?>">-->
                                <input class="btn btn-primary" type="number" name="cantidad" id="cantidad" min="1" value="1" style="width: 30%; height: 35%">
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
              <!--Carrusel de paginación-->
              <nav aria-label="...">
                <ul class="pagination">
                  <li class="page-item <?php echo $_GET['pagina']<=1?'disabled':''?>">
                    <a class="page-link" href="index.php?pagina=<?php echo $_GET['pagina']-1;?>">Anterior</a>
                  </li>
                  <!--Paginacion-->
                  <?php for ($i=0; $i < $paginas; $i++) { ?>
                  <li class="page-item <?php echo $_GET['pagina']==$i+1?'active': ''?>"><a class="page-link" href="index.php?pagina=<?php echo $i+1; ?>"><?php echo $i+1; ?></a></li>
                  <?php } ?>

                  <li class="page-item <?php echo $_GET['pagina']>=$paginas?'disabled':''?>">
                    <a class="page-link" href="index.php?pagina=<?php echo $_GET['pagina']+1;?>">Siguiente</a>
                  </li>
                </ul>
              </nav>
              <!--Fin carrusel-->
          
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