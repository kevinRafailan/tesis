<?php
   require_once("../config/conexion.php");
    if(isset($_SESSION["id_usuario"])){
      require_once("../modelos/Perfil.php");
      $Perfil=new Perfil();
?>
<?php
  require_once("header.php");
 ?>
  <script type="text/javascript" src="js/perfil.js"></script>
  <script type="text/javascript">
$(document).ready(function() {
     setTimeout(function() {
         $(".alert-success").fadeOut(1000);
 },2500);
});
</script>

<style type="text/css">
  .testp{z-index: 1031 !important;
position: relative !important;
width: 32rem;
margin-bottom: -6rem;
float: right;
margin-top: 0.2rem;}
  .iconfix .glyphicon-folder-open{padding-right: 1rem!important;}
</style>
  <!--Contenido-->
  <?php
  if(isset($_GET["m"])) {
            switch($_GET["m"]){
                case "1";
                ?><div id="resultados_ajax" class="text-center testp">  <div class="alert alert-success" role="alert">
              <button type="button" class="close" data-dismiss="alert">×</button>
              Se ha actualizado la información </div>
          </div>
                 <?php
                 break;
              case "2";
                ?><div id="resultados_ajax" class="text-center testp">  <div class="alert alert-success" role="alert">
              <button type="button" class="close" data-dismiss="alert">×</button>
              Se ha eliminado la imagen de usuario</div>
          </div>
                 <?php
                 break;
              }

          }
             ?>
      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
                <section class="content-header">
      <h1>
       Mi Perfil
      </h1>
      <ol class="breadcrumb">
        <li><a href="home.php"><i class="fa fa-home"></i>Inicio</a></li>
        <li><i class="fa fa-user"></i> Mi Perfil</li>
      </ol>
    </section>
        <!-- Main content -->
        <section class="content">
            <div class="row">
              <div class="col-md-12">
                  <div class="box">
<div class="box-header with-border">
              <i class="fa fa-user"></i>
              <h3 class="box-title">Administrar Perfil</h3>
            </div>
                    <!-- /.box-header -->
                    <!-- centro -->
                    <div class="panel-body table-responsive">

<?php 
            //si existe el envia del post entonces se llama al metodo
            $datos= $Perfil->get_usuario_por_id($_SESSION['id_usuario']);
              for($i=0;$i<count($datos);$i++){
               ?>            
<div class="form-group col-md-6">
<dl class="dl-horizontal">
                 <dt>Nombre(s):</dt>
                <dd><?php echo $datos[$i]["nombres"]?></dd>
                <dt>Apellido(s):</dt>
                <dd><?php echo $datos[$i]["apellidos"]?></dd>
                <dt>Usuario:</dt>
                <dd><?php echo $datos[$i]["usuario"]?></dd>
                <dt>Correo:</dt>
                 <dd><?php echo $datos[$i]["correo"]?></dd>
                <dt>Fecha de registro:</dt>
                <dd><?php echo $datos[$i]["fecha_ingreso"]?></dd>
              </dl>

   <?php
           }//cierre del for                                              
?>
               <div style="text-align: center;">
                <a href="#" class="btn btn-default btn-flat" onclick="mostrar_perfil('<?php echo $_SESSION["id_usuario"]?>')"  data-toggle="modal" data-target="#perfilModal">Editar Perfil</a>
&nbsp;
                   <a href="#" class="btn btn-default btn-flat" onclick="editar_pass('<?php echo $_SESSION["id_usuario"]?>')"  data-toggle="modal" data-target="#perfilModal">Cambiar Contraseña</a>
                 </div>
                   </div>

<div class="form-group col-md-6" style="text-align: center;">
 <?php $imagen = $_SESSION["imagen"]; ?>
  <img src="upload/<?php echo $imagen; ?>" class="img-thumbnail" width="200"/>
       <br><br>
       <?php 
       if ($imagen == "imagen_usuario_general.png") {              
       }else{ ?>
        <a href="#" class="btn btn-default btn-flat" onclick="quitar_imagen('<?php echo $_SESSION["id_usuario"]?>')" >Eliminar Imagen</a>
      <?php }?>

</div>
                    </div>
                    <!--Fin centro -->
              </div><!-- /.col -->
          </div><!-- /.row -->
      </section><!-- /.content -->
  </div><!-- /.content-wrapper -->
  <!--Fin-Contenido-->

   <!--FORMULARIO PERFIL USUARIO MODAL-->
<style type="text/css">
  .form-horizontal .form-group {
    padding-top: 1rem!important;
}
</style>
  <div id="perfilModal" class="modal fade">
    <div class="modal-dialog">
        <form action="mi_perfil.php" autocomplete="off" method="post" id="perfil_form">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title">Editar Perfil</h4>
          </div>


           <div class="form-row ofield2" style="margin-top: 1.2rem!important;">
             <div class="form-group col-md-6">
<label clas>Nombres*</label>
                     <input type="text" class="form-control" id="nombre_perfil" name="nombre_perfil" placeholder="Nombres" required>
                      <span class="error_form" id="error_nombre_perfil"></span>
              </div>

              <div class="form-group col-md-6">
<label>Apellidos*</label>
<input type="text" class="form-control" id="apellido_perfil" name="apellido_perfil" placeholder="Apellidos" required >
                      <span class="error_form" id="error_apellido_perfil"></span>
               </div>
             </div>

           <div class="form-row ofield2">
             <div class="form-group col-md-6">
<label clas>Usuario*</label>
<input type="text" class="form-control" id="usuario_perfil" name="usuario_perfil" placeholder="Nombres" required >
                      <span class="error_form" id="error_usuario_perfil"></span>
                    
              </div>

              <div class="form-group col-md-6">
<label>Correo*</label>
                   <input type="email" class="form-control" id="email_perfil" name="email_perfil" placeholder="Correo" required="required">
                      <span class="error_form" id="error_email_perfil"></span>
               </div>
             </div>


           <div class="form-row ofield">
             <div class="form-group col-md-6">
<label clas>Password*</label>
<input type="password" class="form-control" id="password1_perfil" name="password1_perfil" placeholder="Password" required>
<span class="error_form" id="error_password1_perfil"></span>
              </div>

              <div class="form-group col-md-6">
<label>Repita Password*</label>
                      <input type="password" class="form-control" id="password2_perfil" name="password2_perfil" placeholder="Repita Password" required>
                    <span class="error_form" id="error_password2_perfil"></span>
               </div>
             </div>

                 <div class="form-row ofield2 iconfix" style="text-align: center;">
                  <style type="text/css">
                    .bootstrap-filestyle{display: grid!important;} 
                  </style>
                    <div class="form-group col-md-6">
<input type="file" id="usuario_imagen" onchange="validarImagen(this);"  name="usuario_imagen"><br>
                   </div>
<div class="form-group col-md-6">
<span id="upload_usuario_imagen"></span>
                     </div>
                    </div>





                            <div class="col-lg-12">
<div><span class="ofield2">- Los campos con * (asterisco) son obligatorios<br>-Formatos de imagen validos: jpg y png menor a 1 MB</span>
<span class="ofield">- La contraseña debe tener entre 6 caracteres y maximo 15 entre letras, números y al menos un carácter especial <strong>!@#$%</strong><br><br></span></div>
</div>
<div style="clear: both;"></div>
  <div class="modal-footer" style="border-top: none!important;">
        <input type="hidden" name="id_usuario_perfil" id="id_usuario_perfil"/>
           <button type="submit" name="action" id="" class="btn btn-success pull-left" value="Add"><i class="fa fa-floppy-o" aria-hidden="true"></i> Guardar </button>
         <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-times" aria-hidden="true"></i> Cerrar</button>
          </div>
        </div>
      </form>
    </div>
  </div>


<?php
  require_once("footer.php");
?>

  <script type="text/javascript" src="js/perfil.js"></script>
<?php
  } else {
        header("Location:".Conectar::ruta()."vistas/index.php");
  }
?>
