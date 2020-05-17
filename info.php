<?php
//ARCHIVOS DE CONFIGURACION Y NAVBAR Y FOOTER
include "global/config.php";
include "global/db.php";
include "carrito.php";
include "templates/nabvar.php"
?>

    <section>
      <h3>Bienvenidos a nuestra empresa</h3>
      <article>
        <h3 class="title" 
        style="text-align:center;font.size:175%;
              line-height: 155%;
              font-weight: 50%;
              padding:0;">MISIÓN</h3>
        <p style="text-align:justify;">Satisfacer las necesidades de nuestros clientes y  superando sus expectativas,  brindándoles servicios de calidad. Aportando al desarrollo tecnológico y a la demanda  de productos innovadores con lo último en tecnología; ofrecer nuestro compromiso de excelencia e innovación. Dirigiéndonos a nuestros clientes como una empresa Salvadoreña.</p>
      </article>
      <article>
          <h3 style="text-align:center;">VISIÓN</h3>
          <p style="text-align:justify;">Ser una empresa de productos tecnológicos,  como la mejor opción para la compra online de los mismos. Y a su vez la mejor opción para realizar su compra de un manera rápida o inmediata, ofreciendo seguridad en la compra de producto que el cliente necesite.</p>
      </article>
    </section>


<?php include "templates/footer.php"; ?>


