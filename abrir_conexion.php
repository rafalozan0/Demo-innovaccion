<?php
// PHP Data Objects(PDO) Sample Code:
try {
    $conn = new PDO("sqlsrv:server = tcp:remi-server.database.windows.net,1433; Database = Remi_database", "innova8662", "innova86#");
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
}
catch (PDOException $e) {
    print("Error connecting to SQL Server.");
    die(print_r($e));
}
 
// SQL Server Extension Sample Code:
$connectionInfo = array("UID" => "innova8662", "pwd" => "innova86#", "Database" => "Remi_database", "LoginTimeout" => 30, "Encrypt" => 1, "TrustServerCertificate" => 0);
$serverName = "tcp:remi-server.database.windows.net,1433";
$conn = sqlsrv_connect($serverName, $connectionInfo);

if($conn){
	echo "Conexión exitosa";
}else{
	echo "Falló en la conexión";
}
?>