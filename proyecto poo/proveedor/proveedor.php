<?php
require_once ("conexion.php");
class Proveedor {
    private $ID_Proveedor;
    private $NombreProv;
    private $DireccionProv;
    private $Telefono;
    private $Correo;
    const TABLA = 'proveedores';

    public function __construct($ID_Proveedor, $NombreProv, $DireccionProv, $Correo, $Telefono) {
        $this->ID_Proveedor = $ID_Proveedor;
        $this->NombreProv = $NombreProv;
        $this->DireccionProv = $DireccionProv;
        $this->Correo = $Correo;
        $this->Telefono = $Telefono;
    }

    public function getidProveedor() {
        return $this->ID_Proveedor;
    }

    public function setidProveedor($ID_Proveedor) {
        $this->ID_Proveedor = $ID_Proveedor;
    }

    public function getNombreProv() {
        return $this->NombreProv;
    }

    public function setNombreProv($NombreProv) {
        $this->NombreProv = $NombreProv;
    }

    public function getDireccionProv() {
        return $this->DireccionProv;
    }

    public function setDireccionProv($DireccionProv) {
        $this->DireccionProv = $DireccionProv;
    }

    public function getCorreo() {
        return $this->Correo;
    }

    public function setCorreo($Correo) {
        $this->Correo = $Correo;
    }

    public function getTelefonos() {
        return $this->Telefono;
    }

    public function setTelefonos($Telefono) {
        $this->Telefono = $Telefono;
    }

    public function guardar(){
        $conexion = new Conexion();
        $consulta = $conexion->prepare('INSERT INTO proveedores (ID_Proveedor, NombreProv, DireccionProv, Telefono, Correo) VALUES (:ID_Proveedor, :NombreProv, :DireccionProv, :Telefono, :Correo)');
    
        try {
            $consulta->bindParam(':ID_Proveedor', $this->ID_Proveedor);
            $consulta->bindParam(':NombreProv', $this->NombreProv);
            $consulta->bindParam(':DireccionProv', $this->DireccionProv);
            $consulta->bindParam(':Telefono', $this->Telefono);
            $consulta->bindParam(':Correo', $this->Correo);
            $consulta->execute();
            echo "Proveedor guardado con éxito";
        } catch (PDOException $e) {
            echo "Ha surgio un error y no se pudo guardar el proveedor. Detalle: ". $e->getMessage();
        }
    
    }
    public static function mostrar(){
        $conexion = new Conexion();
        $consulta = $conexion->prepare('SELECT ID_Proveedor ,NombreProv ,DireccionProv ,Telefono ,Correo FROM ' . self::TABLA . ' ORDER BY NombreProv');
        $consulta -> execute();
        $registros = $consulta->fetchAll();
        return $registros;
    }


}





?>