<?php

require_once("producto.php");

$objProducto = new Producto($_POST["nombre"],$_POST["codigoProducto"],$_POST["descripcion"],
$_POST["precioVenta"],$_POST["precioCompra"],$_POST["categoria"],$_POST["cantidad"]);

$objProducto->guardar();

echo $objProducto->getNombre();
echo $objProducto->getCodigoproducto();
echo $objProducto->getDescripcion();    
echo $objProducto->getPrecioCompra();
echo $objProducto->getPrecioVenta();
echo $objProducto->getCategoria();
echo $objProducto->getCatidad();
?>