  <?php

  require_once "cliente.php";
  $cliente = Cliente::mostrar();

  ?>
  <html>
      
      <head>
      <link rel="stylesheet" href="//cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css">
      </head>

      <body>

        <table  id="myTable" class="table table-bordered">
            <thead>
            <tr>
                <th>ID</th>
                <th>NOMBRE</th>
                <th>DIRECCION</th>
                <th>TELEFONO</th>
            </tr>
            </thead>
            <tbody>
          <?php foreach ($cliente as $item): ?>
            <th> <?php echo $item['ID_Cliente']; ?> </th>
            <th><?php echo $item['NombreCli']; ?></th>       
            <th><?php echo $item['DireccionCli']?></th>
            <th><?php echo $item['Telefono']?></th>
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