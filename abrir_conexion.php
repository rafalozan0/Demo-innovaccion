<?php 
	// Parametros a configurar para la conexion de la base de datos 
	$host = "localhost";    // sera el valor de nuestra BD 
	$basededatos = "remi";    // sera el valor de nuestra BD 
	$usuariodb = "betzy";    // sera el valor de nuestra BD 
	$clavedb = "12345";    // sera el valor de nuestra BD 

	//Lista de Tablas
	$tabla_db1 = "reporte"; 	   // tabla de usuarios
	$tabla_db2 = "registrarequipo";
	$tabla_db3 = "usuario";
	$tabla_db4 = "empresa";

	//error_reporting(0); //No me muestra errores
	
	$conexion = new mysqli($host,$usuariodb,$clavedb,$basededatos);


	if ($conexion->connect_errno) {
	    echo "Nuestro sitio experimenta fallos....";
	    exit();
	}

?>