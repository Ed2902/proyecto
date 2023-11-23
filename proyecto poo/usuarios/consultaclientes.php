  <?php

  require_once "usuario.php";
  $usuario = usuario::mostrar();

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
                <th>Contrasena</th>
                <th>ID_RolFK</th>
            </tr>
            </thead>
            <tbody>
          <?php foreach ($usuario as $item): ?>
            <th> <?php echo $item['ID_Usuario']; ?> </th>
            <th><?php echo $item['NombreUsuario']; ?></th>       
            <th><?php echo $item['Contrasena']?></th>
            <th><?php echo $item['ID_RolFK']?></th>
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