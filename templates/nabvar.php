<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/media.css">
    <link rel="stylesheet" href="css/normalize.css">

    <title>Technology Box</title>
  </head>

  <body>
      <nav id="navbar-auto-hidden" class="navbar navbar-expand-lg bg-dark navbar-dark">
          <a class="navbar-brand" href="index.php"><img src="assets/img/logo-navbar.png" style="width: 30px;"></a>

          <div id="my-nav" class="collapse navbar-collapse">
              <ul class="navbar-nav mr-auto">
                  <li class="nav-item active">
                      <a class="table-cell-td" href="index.php">Inicio <span class="sr-only">(current)</span></a>
                  </li>
                  <li class="nav-item active">
                      <a class="table-cell-td" href="mostracarrito.php">Carrito(<?php echo (empty($_SESSION['CARRITO']))?0:count($_SESSION['CARRITO']) ?>)</a>
                  </li>

              </ul>
          </div>

      </nav>
      <br>
      <br>
      <div class="container">