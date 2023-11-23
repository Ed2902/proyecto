<?php

require_once ("conexion.php");
class Producto {
    private $id;
    private $nombre;
    private $codigoproducto;
    private $descripcion;
    private $precioVenta;
    private $precioCompra;
    private $cantidad;
    private $categoria;
    
    const TABLA = 'productos';

    // Getters y Setters

    public function getIdProducto() {
        return $this->id;
    }

    public function setIdProducto($id) {
        $this->id = $id;
    }

    public function getNombre() {
        return $this->nombre;
    }

    public function setNombre($nombre) {
        $this->nombre = $nombre;
    }

    
    public function getCodigoproducto() {
        return $this->codigoproducto;
    }

    public function setCodigoproducto($codigoproducto) {
        $this->codigoproducto = $codigoproducto;
    }

    public function getDescripcion() {
        return $this->descripcion;
    }

    public function setDescripcion($descripcion) {
        $this->descripcion = $descripcion;
    }

    public function getPrecioCompra() {
        return $this->precioCompra;
    }

    public function setPrecioCompra($precioCompra) {
        $this->precioCompra = $precioCompra;
    }

    public function getPrecioVenta() {
        return $this->precioVenta;
    }

    public function setPrecioVenta($precioVenta) {
        $this->precioVenta = $precioVenta;
    }

    public function getCategoria() {
        return $this->categoria;
    }

    public function setCategoria($categoria) {
        $this->categoria = $categoria;
    }

    public function getCatidad() {
        return $this->cantidad;
    }

    public function setCatidad($cantidad) {
        $this->cantidad = $cantidad;
    }


    // Constructor
    public function __construct($nombre,$codigoproducto,$descripcion,$precioCompra,$precioVenta,$categoria,$cantidad,$id=null) {
        $this->id = $id;
        $this->nombre = $nombre;
        $this->codigoproducto = $codigoproducto;
        $this->descripcion = $descripcion;
        $this->precioCompra = $precioCompra;
        $this->precioVenta = $precioVenta;
        $this->categoria = $categoria;
        $this->cantidad = $cantidad;
    }

    public function guardar(){
        
            $conexion = new Conexion();
            $consulta = $conexion->prepare('INSERT INTO productos (NombreProd, CodigoProducto, DescripcionProd, PrecioUnitario, PrecioCompra, Cantidad_Disponible, ID_Categoria)
            VALUES (:NombreProd, :CodigoProducto, :DescripcionProd, :PrecioUnitario, :PrecioCompra, :Cantidad_Disponible, :ID_Categoria)');

            try {
            $consulta -> bindParam(':NombreProd', $this->nombre);
            $consulta -> bindParam(':CodigoProducto', $this->codigoproducto);
            $consulta -> bindParam(':DescripcionProd', $this->descripcion);
            $consulta -> bindParam(':PrecioUnitario', $this->precioCompra);
            $consulta -> bindParam(':PrecioCompra', $this->precioVenta);
            $consulta -> bindParam(':ID_Categoria', $this->categoria);
            $consulta -> bindParam(':Cantidad_Disponible', $this->cantidad);
            $this->id = $conexion->lastInsertid();
            

             echo "Proveedor guardado con éxito";
            } catch (PDOException $e) {
                echo "Ha surgio un error y no se pudo guardar el proveedor. Detalle: ". $e->getMessage();
            }
    }

    public static function mostrar(){
        $conexion = new Conexion();
        $consulta = $conexion->prepare('SELECT ID_Producto, NombreProd, CodigoProducto, DescripcionProd, PrecioUnitario, PrecioCompra, ID_Categoria, Cantidad_Disponible 
        FROM ' . self::TABLA . ' ORDER BY nombre');
        $consulta -> execute();
        $registros = $consulta->fetchAll();
        return $registros;

}



}
