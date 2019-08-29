<?php
  //conexion a la base de datos
   require_once("../config/conexion.php");
   //si se preciona el boton y el valor es si
   if(isset($_POST["enviar"]) and $_POST["enviar"]=="si"){
     //se instancia la clase
     require_once("../modelos/Usuarios.php");
     //nuevo objeto de tipo usuarios
     $usuario = new Usuarios();
     //se invoca la function
     $usuario->login();
 }

 ?>
 <!DOCTYPE html>
 <html>
 <head>
   <meta charset="utf-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <title>Acceso</title>
   <!-- Tell the browser to be responsive to screen width -->
   <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
   <!-- Bootstrap 3.3.7 -->
   <link rel="stylesheet" href="../public/bower_components/bootstrap/dist/css/bootstrap.min.css">
   <!-- Font Awesome -->
   <link rel="stylesheet" href="../public/bower_components/font-awesome/css/font-awesome.min.css">
   <!-- Ionicons -->
   <link rel="stylesheet" href="../public/bower_components/Ionicons/css/ionicons.min.css">
   <!-- Theme style -->
   <link rel="stylesheet" href="../public/dist/css/AdminLTE.min.css">
   <!-- iCheck -->
   <link rel="stylesheet" href="../public/plugins/iCheck/square/blue.css">

   <link rel="stylesheet" href="../assets/css/supersized.css">

   <!-- estilos adicionales para el formulario -->
   <style>
   .login-logo{
         margin-bottom: 0px!important;
         margin-top: -20px!important;
   }
   .login-box-body{
     border-radius: 1rem;
         background: -moz-linear-gradient(top, rgba(255,255,255,0.1) 0%, rgba(255,255,255,0.4) 100%);
         background: -webkit-linear-gradient(top, rgba(255,255,255,1) 0%,rgba(255,255,255,0.4) 100%);
         background: linear-gradient(to bottom, rgba(255,255,255,1) 0%,rgba(255,255,255,0.4) 100%);
         filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#ffffff', endColorstr='#00ffffff',GradientType=0 );
   }
    .login-box{margin: auto!important;
    padding-top: 12rem!important;}
   </style>
   <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
   <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
   <!--[if lt IE 9]>
   <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
   <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
   <![endif]-->

   <!-- Google Font -->
   <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
 </head>
 <body class="hold-transition login-page">
 <div class="login-box">
   <!-- /.login-logo -->
   <div class="login-box-body">

  <!--INICIO MENSAJES DE ALERTA-->
    <div class="container-fluid">

       <div class="row">
          <div class="col-lg-12">

         <div class="box-body">

             <?php


             if(isset($_GET["m"])) {

            switch($_GET["m"]){


                case "1";
                ?>

                <div class="alert alert-danger alert-dismissible">
                       <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                       <h4><i class="icon fa fa-ban"></i> El correo y/o password es incorrecto o no tienes permiso!</h4>

                 </div>

                 <?php
                 break;


                 case "2";
                 ?>
                     <div class="alert alert-danger alert-dismissible">
                       <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                       <h4><i class="icon fa fa-ban"></i> Los campos estan vacios</h4>

                 </div>
                 <?php
                 break;



              }

          }


             ?>

             <div class="login-logo">
               <a href="#"><b>Acceso</b></a>
             </div>
         </div>


         </div>
       </div>
   </div>
   <!-- Javascript -->
   <script src="../assets/js/jquery-1.8.2.min.js"></script>
   <script src="../assets/js/supersized.3.2.7.min.js"></script>
   <script src="../assets/js/supersized-init.js"></script>
   <script src="../assets/js/scripts.js"></script>
   <!--/container-fluid-->
 <!-- FIN MENSAJES DE ALERTA-->

 <!--login-box-msg-->

     <p class="text-center pad text-bold bg-primary margin-bottom">Ingrese los datos</p>

     <form action="" method="post">
       <div class="form-group has-feedback">
         <input type="email" name="correo" id="correo" class="form-control" placeholder="Email" required="required">
         <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
       </div>
       <div class="form-group has-feedback">
         <input type="password" name="password" id="password" class="form-control" placeholder="Password" required>
         <span class="glyphicon glyphicon-lock form-control-feedback"></span>
       </div>

        <div class="form-group">
         <input type="hidden" name="enviar" class="form-control" value="si">

       </div>
       <div class="row">

         <div class="col-xs-7 col-xs-offset-3 col-sm-8 col-sm-offset-2 col-lg-8 col-lg-offset-2">
           <button type="submit" class="btn btn-primary btn-block btn-flat"><i class="fa fa-power-off" aria-hidden="true"></i>  Iniciar Sesión</button>
         </div>
         <!-- /.col -->
       </div>
     </form>



     <!--<a href="#">I forgot my password</a><br>-->



   </div>
   <!-- /.login-box-body -->

 </div>
 <!-- /.login-box -->


 <!-- jQuery 3 -->
 <script src="../public/bower_components/jquery/dist/jquery.min.js"></script>
 <!-- Bootstrap 3.3.7 -->
 <script src="../public/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
 <!-- iCheck -->
 <script src="../public/plugins/iCheck/icheck.min.js"></script>
 <script>
   $(function () {
     $('input').iCheck({
       checkboxClass: 'icheckbox_square-blue',
       radioClass: 'iradio_square-blue',
       increaseArea: '20%' // optional
     });
   });
 </script>
 </body>
 </html>
