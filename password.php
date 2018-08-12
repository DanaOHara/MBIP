<?php

/* Script de validación de contraseña mediante PHP.
*  Sintaxis: $ php password.php <contrasena> <hash>
*  Retorna 1 si el hash pertenece a la contraseña, 0 en caso contrario.
*  Requiere PHP 5.6
*/


if(isset($argv)){
  $pass = password_hash($argv[1], PASSWORD_BCRYPT);
  //echo "Argumento 1: ".$argv[1]." \n";
  //echo "Argumento 2: ".$argv[2]." \n";
  if(password_verify($argv[1], $argv[2])){
    echo 1;
  } else{
    echo 0;
  }
}
?>
