<?php
$hostname='localhost';
$database='db_distribuidoraaol';
$username='hfriasb';
$password='7415963';



$json=array();

    $conexion= mysqli_connect($hostname,$username,$password,$database);

    $consulta= "SELECT codigoProducto,nombreProducto,imagenProducto FROM producto; "
    $resultado = mysqli_query($conexion, $consulta);

    while($registro=mysqli_fetch_array($resultado)){
        $json['producto'][]=$registro;
        //echo $registro['codigoProducto'].'-'.$registro['nombreProducto'].'<br/>';
    }

    mysqli_close($conexion);
    echo json_encode($json);
?>