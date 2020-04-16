<?php
session_start();

$mensaje="";
if(isset($_POST['btnAccion'])){
    //SWITCH PARA VALIDAR FOMULARIOS DE ENVIO AL CARRITOS E ELIMINACION
    switch($_POST['btnAccion']){
        case 'Agregar':
            if(is_numeric($_POST['id'])){
                $ID=$_POST['id'];
                //$mensaje.="Ok Id correcto".$ID."<br/>";
            }else{ 
                $mensaje.="uppss.. Id incorrecto ".$ID."<br/>";
            }

            if(is_string($_POST['nombreProd'])){
                $NOMBRE=$_POST['nombreProd'];
                //$mensaje.="ok NOMBRE ".$NOMBRE."<br/>";
            }else{
                $mensaje.="Upps.. algo pasa con el nombre"."<br/>"; break;
            }

                if($_POST['marca']){
                    $MARCA=$_POST['marca'];
                    //$mensaje.="ok MARCA ".$MARCA."<br/>";
                }else{
                    $mensaje.="Upps.. algo pasa con LA CANTIDADD"."<br/>"; break;
                }

                if(is_numeric($_POST['precio'])){
                    $PRECIO=$_POST['precio'];
                    //$mensaje.="ok PRECIO ".$PRECIO."<br/>";
                }else{
                    $mensaje.="Upps.. algo pasa con el PRECIO"."<br/>"; break;
                }
                if(is_numeric($_POST['cantidad'])){
                    $CANTIDAD=$_POST['cantidad'];
                    //$mensaje.="ok PRECIO ".$CANTIDAD."<br/>";
                }else{
                    $mensaje.="Upps.. algo pasa con el PRECIO"."<br/>"; break;
                }

                if(!isset($_SESSION['CARRITO'])){
                    $producto=array(
                        'ID'=>$ID,
                        'NOMBRE'=>$NOMBRE,
                        'MARCA'=>$MARCA,
                        'PRECIO'=>$PRECIO,
                        'CANTIDAD'=>$CANTIDAD
                    );
                    $_SESSION['CARRITO'][0]=$producto;
                    
                    }else{
                        $NumeroProductos=count($_SESSION['CARRITO']);
                        $producto=array(
                            'ID'=>$ID,
                            'NOMBRE'=>$NOMBRE,
                            'MARCA'=>$MARCA,
                            'PRECIO'=>$PRECIO,
                            'CANTIDAD'=>$CANTIDAD
                        );
                        $_SESSION['CARRITO'][$NumeroProductos]=$producto;
                        
                        }
            //echo "<script>alert('Producto Agregado al carrito')</script>";
            $mensaje.="Producto Agregado al carrito";
            
        break;
                
        case 'Eliminar':
            if(is_numeric($_POST['id'])){
                $ID=$_POST['id'];
                
                foreach($_SESSION['CARRITO'] as $indice=>$prod){
                    if($prod['ID']==$ID){
                        unset($_SESSION['CARRITO'][$indice]);
                      echo "<script>alert('Elemento borrado...')</script>";  
                    }            
                }    
            }else{ 
                $mensaje.="uppss.. Id incorrecto ".$ID."<br/>";
            }
        break;

    }
    
}

?>