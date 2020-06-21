<?php
    include_once 'database.php';
    
    session_start();

    if(isset($_GET['cerrar_sesion'])){
        session_unset(); 

        // destroy the session 
        session_destroy(); 
    }
    
    if(isset($_SESSION['rol'])){
        switch($_SESSION['rol']){
            case 1:
                header('location: admin.html');
            break;

            case 2:
            header('location: usuario.html');
            break;

            case 3:
            header('location: tecnico.html');
            break;

            default:
        }
    }

    if(isset($_POST['username']) && isset($_POST['password'])){
        $username = $_POST['username'];
        $password = $_POST['password'];

        $db = new Database();
        $query = $db->connect()->prepare('SELECT *FROM usuarios WHERE username = :username AND password = :password');
        $query->execute(['username' => $username, 'password' => $password]);

        $row = $query->fetch(PDO::FETCH_NUM);
        
        if($row == true){
            $rol = $row[3];
            
            $_SESSION['rol'] = $rol;
            switch($rol){
                case 1:
                    header('location: admin.php');
                break;

                case 2:
                header('location: colab.php');
                break;

                default:
            }
        }else{
            // no existe el usuario
            echo "Nombre de usuario o contraseña incorrecto";
        }
        

    }

?>
<!DOCTYPE html> 

<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="Sistema web capaz de monitorizar los mantenimientos y/o revisiones que se realizan de forma rutinaria en un hospital, además de dar aviso al área de mantenimiento en caso de existir un reporte de falla, así mismo el sistema proporcionara indicadores que permitirán disminuir o incrementar dichas rutinas de mantenimiento.">
  <meta name="author" content="Remi">
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
  <!-- Argon CSS -->
  <link rel="stylesheet" href="assets/css/argon.css?v=1.2.0" type="text/css">
</head>

<body class="bg-default">
  <!-- Navbar -->
  <nav id="navbar-main" class="navbar navbar-horizontal navbar-transparent navbar-main navbar-expand-lg navbar-light">
    <div class="container">
      <a class="navbar-brand" href="dashboard.html">
        <img src="assets/img/brand/blue.png">
      </a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-collapse" aria-controls="navbar-collapse" aria-expanded="false" aria-label="Toggle navigation">
   
      </button>
      <div class="navbar-collapse navbar-custom-collapse collapse" id="navbar-collapse">
        <div class="navbar-collapse-header">
          <div class="row">
            <div class="col-6 collapse-brand">
              <a href="dashboard.html">
                <img src="assets/img/brand/blue.png">
              </a>
            </div>
            <div class="col-6 collapse-close">
              <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbar-collapse" aria-controls="navbar-collapse" aria-expanded="false" aria-label="Toggle navigation">
                <span></span>
                <span></span>
              </button>
            </div>
          </div>
        </div>
        <ul class="navbar-nav mr-auto">
          
      </div>
    </div>
  </nav>
  <!-- Main content -->
  <div class="main-content">
    <!-- Header -->
    <div class="header bg-gradient-primary py-7 py-lg-8 pt-lg-9">
      <div class="container">
        <div class="header-body text-center mb-7">
          <div class="row justify-content-center">
            <div class="col-xl-5 col-lg-6 col-md-8 px-5">
              <h1 class="text-white">Bienvenido!</h1>
              <!-- Inicio del formulario con php -->
              <form action="#" method="POST">
                Username: <br/><input type="text" name="username"><br/>
                Password: <br/><input type="text" name="password"><br/>
                <input type="submit" value="Iniciar sesión">
            </form>
            <!-- Fin del formulario de php -->
            </div>
          </div>
        </div>
      </div>
      <div class="separator separator-bottom separator-skew zindex-100">
        <svg x="0" y="0" viewBox="0 0 2560 100" preserveAspectRatio="none" version="1.1" xmlns="http://www.w3.org/2000/svg">
          <polygon class="fill-default" points="2560 0 2560 100 0 100"></polygon>
        </svg>
      </div>
    </div>
    <!-- Page content -->
    <!-- Inicio de interfaz grafica -->
    <div class="container mt--8 pb-5">
      <div class="row justify-content-center">
    </div>
  </div>
  <!-- Fin de interfaz grefica principal -->
  <!-- Footer -->
  <footer class="py-5" id="footer-main">
    <div class="container">
      <div class="row align-items-center justify-content-xl-between">
        <div class="col-xl-6">
          <div class="copyright text-center text-xl-left text-muted">
            &copy; 2020 <a class="font-weight-bold ml-1" target="_blank">Remi</a>
          </div>
        </div>
        <div class="col-xl-6">
          <ul class="nav nav-footer justify-content-center justify-content-xl-end">
            <li class="nav-item">
              <a  class="nav-link" target="_blank"> </a>
            </li>
            <li class="nav-item">
              <a  class="nav-link" target="_blank"></a>
            </li>
            <li class="nav-item">
              <a  class="nav-link" target="_blank"> </a>
            </li>
            <li class="nav-item">
              <a  class="nav-link" target="_blank"></a>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </footer>
  <!-- Argon Scripts -->
  <!-- Core -->
  <script src="assets/vendor/jquery/dist/jquery.min.js"></script>
  <script src="assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/js-cookie/js.cookie.js"></script>
  <script src="assets/vendor/jquery.scrollbar/jquery.scrollbar.min.js"></script>
  <script src="assets/vendor/jquery-scroll-lock/dist/jquery-scrollLock.min.js"></script>
  <!-- Argon JS -->
  <script src="assets/js/argon.js?v=1.2.0"></script>
</body>

</html>