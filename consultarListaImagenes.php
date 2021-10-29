<?php
  $hostname_localhost="localhost";
  $database_localhost="db_distribuidoraaol";
  $username_localhost="hfriasb";
 $password_localhost="7415963";

 $json=array();
				
		 $conexión = mysqli_connect($hostname_localhost,$username_localhost,$password_localhost,$database_localhost);

		 $consulta="SELECT codigoProducto,nombreProducto,imagenProducto FROM producto";
		 $resultado=mysqli_query($conexión,$consulta);
		
		while($registro=mysqli_fetch_array($resultado)){
			 $result["codigoProducto"]=$registro['codigoProducto'];
			 $result["nombreProducto"]=$registro['nombreProducto'];
			 $result["imagen"]=base64_encode($registro['imagen']);
			 $json['producto'][]=$result;
			//echo $registro['id'].' - '.$registro['nombre'].' <br/>»;
		}
		mysqli_close($conexión);
		echo json_encode($json);
?>