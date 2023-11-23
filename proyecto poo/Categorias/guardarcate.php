<?php


require_once("categoria.php");
//$objPersonaje = personaje::guardar();
//Crear un objeto (instancia de una clase)

//var_dump($_POST);

$objcategoria = new categoria($_POST["NombreCategoria"], $_POST["DescripcionCat"]);

$objcategoria->guardar();


echo $objcategoria->getNombreCategoria();
echo $objcategoria->getDescripcionCat();
?>