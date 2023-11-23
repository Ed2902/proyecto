<?php

  require_once "proveedor.php";
  $cliente = Proveedor::mostrar();

  ?>
  <html>
      
      <head>
      <link rel="stylesheet" href="//cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css">
      </head>

      <body>

        <table  id="myTable" class="table table-bordered">
            <thead>
            <tr>
                <th>NIT</th>
                <th>NOMBRE</th>
                <th>DIRECCION</th>
                <th>TELEFONO</th>
                <th>CORREO</th>
            </tr>
            </thead>
            <tbody>
          <?php foreach ($cliente as $item): ?>
            <th> <?php echo $item['ID_Proveedor']; ?> </th>
            <th><?php echo $item['NombreProv']; ?></th>       
            <th><?php echo $item['DireccionProv']?></th>
            <th><?php echo $item['Telefono']?></th>
            <th><?php echo $item['Correo']?></th>
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