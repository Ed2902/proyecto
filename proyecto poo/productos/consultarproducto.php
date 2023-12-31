<?php

require_once "producto.php";
$producto = Producto::mostrar();

?>
<html>
    
    <head>
    <link rel="stylesheet" href="//cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css">
    </head>

    <body>

      <table  id="myTable" class="table table-bordered">
          <thead>
          <tr>
              <th>Codigo de producto</th>
              <th>Nombre</th>
              <th>Descripcion</th>
              <th>Precio de Compra</th>
              <th>Precio Venta</th>
              <th>Categoria</th>
              <th>Cantidades</th>
          </tr>
          </thead>
          <tbody>
        <?php foreach ($producto as $item): ?>
          <tr>
          <th> <?php echo $item['CodigoProducto']; ?> </th>
          <th> <?php echo $item['NombreProd'];?></th>
          <th> <?php echo $item['DescripcionProd'];?></th>
          <th> <?php echo $item['PrecioUnitario'];?></th> 
          <th> <?php echo $item['PrecioCompra'];?></th>
          <th> <?php echo $item['cantidad'];?></th>
          <th> <?php echo $item['ID_Categoria'];?></th>
          <th> <?php echo $item['ID_Producto'];?></th>
          </th>
          </tr>
        <?php endforeach; ?>
          </tbody> 
        </table>

        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script src="//cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
        <script>
          $(document).ready(function() {
              $('#myTable').DataTable( {
                  "processing": true,
                  "serverSide": true,
                  "ajax": "../server_side/scripts/server_processing.php"
              } );
          } );
          </script>
    </body>

</html>