<?php
  $hostname_localhost="localhost";
  $database_localhost="db_distribuidoraaol";
  $username_localhost="hfriasb";
  $password_localhost="7415963";

 $json['img']=array();


	if(isset($_POST["btn"])){
		
		 $conexión = mysqli_connect($hostname_localhost,$username_localhost,$password_localhost,$database_localhost);
		
		 $ruta="imagenes";
		 $archivo=$_FILES['imagen']['tmp_name'];
		 echo 'Archivo';
		 echo '<br>';
		 echo $archivo;
		 $nombreArchivo=$_FILES['imagen']['name'];
		 echo 'Nombre Archivo';
		 echo '<br>';
		 echo $nombreArchivo;
		 move_uploaded_file($archivo,$ruta."/".$nombreArchivo);
		 $ruta=$ruta."/".$nombreArchivo;
		 $codigoProducto=$_POST['codigoProducto'];
		 $nombreProducto=$_POST['nombreProducto'];
	
		
		echo '<br>';
		echo 'codigoProducto: ';
		echo  $codigoProducto;
		echo '<br>';
		echo 'nombreProducto: ';
		echo  $nombreProducto;
		echo '<br>';
		echo 'ruta :';
		echo  $ruta;
		echo '<br>';
		echo 'Tipo Imagen: ';
		echo ($_FILES['imagen']['type']);
		echo '<br>';
		echo '<br>';
		echo "Imagen: <br><img src='$ruta'>";
		echo '<br>';
		echo '<br>';
		echo 'imagen en Bytes: ';
		echo '<br>';
		echo '<br>';
		//echo $bytesArchivo=file_get_contents($ruta);
		echo '<br>';
		
		 $bytesArchivo=file_get_contents($ruta);
		 $sql="INSERT INTO producto(codigoProducto,nombreProducto,imagen/*,ruta_imagen*/) VALUES (?,?,?/*,?*/)";
		 $stm=$conexión->prepare($sql);
		 $stm->bind_param('ssb',$codigoProducto,$nombreProducto,$bytesArchivo/*,$ruta*/);
		 /*$sql="INSERT INTO producto(codigoProducto,nombreProducto,imagen) VALUES (?,?,?)";
		 $stm=$conexión->prepare($sql);
		 $stm->bind_param('ssb',$codigoProducto,$nombreProducto,$bytesArchivo);*/
		
		if($stm->execute()){
			echo 'imagen Insertada Exitosamente';
			 $consulta="SELECT * FROM producto WHERE codigoProducto='{$codigoProducto}'";
			 $resultado=mysqli_query($conexión,$consulta);
			echo '<br>';
			while ($row=mysqli_fetch_array($resultado)){
				echo  $row['codigoProducto']. ' - '.  $fila['nombreProducto']. '<br/>';
				array_push($json['img'],array('codigoProdulcto'=>$row['codigoProducto'],'nombreProducto'=>$row['nombreProducto'],
			'photo'=>base64_encode($row['nombreProducto'])/*,'ruta'=>  $fila['ruta_imagen']*/));
			}
			mysqli_close($conexión);
			
			echo '<br>';
			echo 'Objeto JSON 2';
			echo '<br>';
			echo json_encode($json);
		}
	}
?>