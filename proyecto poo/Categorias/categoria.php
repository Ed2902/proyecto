<?php

require_once ("conexion.php");
class categoria {
    private $ID_Categoria;
    private $NombreCategoria;
    private $DescripcionCat;
    
    const TABLA = 'categorias';

    // Constructor
    public function __construct($NombreCategoria, $DescripcionCat, $ID_Categoria=null) {
        $this->ID_Categoria = $ID_Categoria;
        $this->NombreCategoria = $NombreCategoria;
        $this->DescripcionCat = $DescripcionCat;
    }

    // Getters
    public function getID_Categoria() {
        return $this->ID_Categoria;
    }

    public function getNombreCategoria() {
        return $this->NombreCategoria;
    }

    public function getDescripcionCat() {
        return $this->DescripcionCat;
    }

    // Setters
    public function setID_Categoria($ID_Categoria) {
        $this->ID_Categoria = $ID_Categoria;
    }

    public function setNombreCategoria($NombreCategoria) {
        $this->NombreCategoria = $NombreCategoria;
    }

    public function setDescripcionCat($DescripcionCat) {
        $this->DescripcionCat = $DescripcionCat;
    }

    public function guardar(){
        $conexion = new Conexion();
        $consulta = $conexion->prepare('INSERT INTO categorias (NombreCategoria, DescripcionCat)VALUES (:NombreCategoria, :DescripcionCat )');
        try{
           $consulta -> bindParam(':NombreCategoria', $this->NombreCategoria);
           $consulta -> bindParam(':DescripcionCat', $this->DescripcionCat);
           $consulta->execute();
           $this->ID_Categoria = $conexion->lastInsertId();
           echo "categoria guardado con éxito";
       } catch (PDOException $e) {
           echo "Ha surgio un error y no se pudo guardar el proveedor. Detalle: ". $e->getMessage();
       }
        }

    
     public static function mostrar(){
            $conexion = new Conexion();
            $consulta = $conexion->prepare('SELECT ID_Categoria,NombreCategoria,DescripcionCat FROM ' . self::TABLA . ' ORDER BY ID_Categoria');
            $consulta -> execute();
            $registros = $consulta->fetchAll();
            return $registros;

    }
    
}

