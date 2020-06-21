<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="Start your development with a Dashboard for Bootstrap 4.">
  <meta name="author" content="Creative Tim">
    <!-- Notificaciones -->
  <script src="https://cdn.onesignal.com/sdks/OneSignalSDK.js" async=""></script>
<script>
  window.OneSignal = window.OneSignal || [];
  OneSignal.push(function() {
    OneSignal.init({
      appId: "4bebb19f-33c1-44cd-8566-b8e1f0922ed9",
    });
  });
</script>
<!-- Notificaciones -->
  <title>Remi</title>
  <!-- Favicon -->
  <link rel="icon" href="assets/img/brand/favicon.png" type="image/png">
  <!-- Fonts -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700">
  <!-- Icons -->
  <link rel="stylesheet" href="assets/vendor/nucleo/css/nucleo.css" type="text/css">
  <link rel="stylesheet" href="assets/vendor/@fortawesome/fontawesome-free/css/all.min.css" type="text/css">
  <!-- Page plugins -->
  <!-- Argon CSS -->
  <link rel="stylesheet" href="assets/css/argon.css?v=1.2.0" type="text/css">
</head>

<body>
  <!-- Sidenav -->
  <nav class="sidenav navbar navbar-vertical  fixed-left  navbar-expand-xs navbar-light bg-white" id="sidenav-main">
    <div class="scrollbar-inner">
      <!-- Brand -->
      <div class="sidenav-header  align-items-center">
        <a class="navbar-brand" href="javascript:void(0)">
          <img src="assets/img/brand/blue.png" class="navbar-brand-img" alt="...">
        </a>
      </div>
      <div class="navbar-inner">
        <!-- Collapse -->
        <div class="collapse navbar-collapse" id="sidenav-collapse-main">
          <!-- Nav items -->
          <ul class="navbar-nav">
            <li class="nav-item">
              <a class="nav-link" href="index.html">
                <i class="ni ni-tv-2 text-primary"></i>
                <span class="nav-link-text">Vista general</span>
              </a>
              </li>
                <li class="nav-item">
                <a class="nav-link" href="reporte.html">
                  <i class="ni ni-bullet-list-67 text-orange"></i>
                  <span class="nav-link-text">Reportes</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="registroequipos.html">
                <i class="ni ni-bullet-list-67 text-orange"></i>
                <span class="nav-link-text">Equipos</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="empresas.html">
              <i class="ni ni-bullet-list-67 text-orange"></i>
              <span class="nav-link-text">Empresa</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="registrousuarios.html">
              <i class="ni ni-bullet-list-67 text-orange"></i>
              <span class="nav-link-text">Usuarios</span>
              </a>
            </li>

            <li class="nav-item">
              <a class="nav-link" href="inventario.html">
                <i class="ni ni-archive-2 text-orange"></i>
                <span class="nav-link-text">Inventario</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link active" href="agenda.html">
                <i class="ni ni-calendar-grid-58 text-primary"></i>
                <span class="nav-link-text">Agenda de proovedores</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="estadisticas.html">
                <i class="ni ni-chart-bar-32 text-yellow"></i>
                <span class="nav-link-text">Estadísticas de fallas</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="ranking.html">
                <i class="ni ni-fat-remove text-default"></i>
                <span class="nav-link-text">Ranking de fallas en equipo</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="acercade.html">
                <i class="ni ni-favourite-28 text-info"></i>
                <span class="nav-link-text">Acerca de</span>
              </a>
            </li>
            </ul>   
          </ul>
          <!-- Divider -->
          <hr class="my-3">
          
        </div>
        </div>
      </div>
    </div>
  </nav>


<!-- MENU DE HAMBURGUESA -->
<div>
  <!-- Topnav -->
<nav class="navbar navbar-top navbar-expand navbar-dark bg-primary border-bottom">
<div class="container-fluid"></div>
<div class="collapse navbar-collapse" id="navbarSupportedContent"></div>
  <!-- Navbar links -->
<ul class="navbar-nav align-items-center  ml-md-auto ">
<li class="nav-item d-xl-none"></li>
<!-- Sidenav toggler -->
<div class="pr-3 sidenav-toggler sidenav-toggler-dark" data-action="sidenav-pin" data-target="#sidenav-main">
<div class="sidenav-toggler-inner">
<i class="sidenav-toggler-line"></i>
<i class="sidenav-toggler-line"></i>
<i class="sidenav-toggler-line"></i>
</div>
</div>
</li>
</div>
<!-- FIN DE MENU DE HAMBUERGUESA -->
  <!-- Main content -->
  <div class="main-content" id="panel">

    <!-- Header -->
    
    <!-- Header -->
    <div class="header bg-primary pb-6">
      <div class="container-fluid">
        <div class="header-body">
          <div class="row align-items-center py-4">
            <div class="col-lg-6 col-7">
              <h6 class="h2 text-white d-inline-block mb-0">Registrar equipos</h6>
              <nav aria-label="breadcrumb" class="d-none d-md-inline-block ml-md-4">
              </nav>
            </div>

          </div>
        </div>
      </div>
    </div>
    <!-- Page content -->
    <div class="container-fluid mt--6">
      <div class="row">
        <div class="col">
          <div class="card border-0">
            <div id="map-default" class="map-canvas" data-lat="40.748817" data-lng="-73.985428" style="height: 600px;">
              <?php
                $NumeroSerie = $_POST['NumeroSerie'];
                $Modelo = $_POST['Modelo'];
                $IDNivelRiesgo = $_POST['IDNivelRiesgo'];
                $IDEquipoArea = $_POST['IDEquipoArea'];
                $claveCB= $_POST['claveCB'];
                $nombre = $_POST['nombre'];
                $descripcion = $_POST['descripcion'];
                $fechaExpGarantia = $_POST['fechaExpGarantia'];
                $idStatus = $_POST['idStatus'];
                $nivelPrioridad = $_POST['nivelPrioridad'];
                $idMarca = $_POST['idMarca'];
                $idTipo = $_POST['idTipo'];
                $cantidad = $_POST['cantidad'];

                if(isset($_POST['btn_registrar']))
                {
                                              
                  $serverName = "remi-server.database.windows.net"; //serverName\instanceName
                  //ESTE ES EL NOMBRE DE LA COMPUTADORA
                  $connectionInfo = array( "Database"=>"Remi_database", "UID"=>"innova8662", "PWD"=>"innova86#");
                  //AQUI VA EL NOMBRE DE LA BASE DE DATOS, EL NOMBRE DEL LOGIN CREADO EN SQLSERVER Y SU CONTRASEÑA
                  $conn = sqlsrv_connect( $serverName, $connectionInfo);
                  if( $conn ) 
                  {
                    echo "Conexión establecida.<br />";
                  }
                  else
                  {
                    echo "Conexión no se pudo establecer.<br />";
                  }
                
                  $sql = "exec agregarEquipo @NumeroSerie='$NumeroSerie', @Modelo='$Modelo', @IDNivelRiesgo='$IDNivelRiesgo', @IDEquipoArea='$IDEquipoArea', @claveCB='$claveCB', @nombre='$nombre', @descripcion='$descripcion', @fechaExpGarantia='$fechaExpGarantia', @idStatus='$idStatus', @nivelPrioridad='$nivelPrioridad', @idMarca='$idMarca', @idTipo='$idTipo', @cantidad='$cantidad';";
                  echo "<br<br><br><br<br><br><font><center><b><h1>¡Equipo registrado exitosamente!</h1></b></center></font>";
                  echo "<br<br><br><br<br><br><font><center><b><h3>El equipo se registró de manera satisfactoria. Para generar otro reporte pulse el botón siguiente.</h3></b></center></font><br><br>";

                }

                include("cerrar_conexion.php");
              ?>
              <center><a href="registroequipos.html"><input type="button" value="Registrar equipo" class="btn btn-success"></a></center>
            
                     
            </div>
          </div>
        </div>
      </div>
      <!-- Footer -->
       <!-- Footer -->
       <footer class="footer pt-0">
        <div class="row align-items-center justify-content-lg-between">
          <div class="col-lg-6">
            <div class="copyright text-center  text-lg-left  text-muted">
              &copy; 2020 <a class="font-weight-bold ml-1" target="_blank">Remi</a>
            </div>
          </div>
        </div>
      </footer>
    </div>
  </div>
  <!-- Argon Scripts -->
  <!-- Core -->
  <script src="assets/vendor/jquery/dist/jquery.min.js"></script>
  <script src="assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/js-cookie/js.cookie.js"></script>
  <script src="assets/vendor/jquery.scrollbar/jquery.scrollbar.min.js"></script>
  <script src="assets/vendor/jquery-scroll-lock/dist/jquery-scrollLock.min.js"></script>
  <!-- Optional JS -->
 
  <!-- Argon JS -->
  <script src="assets/js/argon.js?v=1.2.0"></script>
</body>

</html>

