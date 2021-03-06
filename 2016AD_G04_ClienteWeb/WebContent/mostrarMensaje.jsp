<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*"%>
<%@ page import= "java.util.*"%>
<%@ page import="com.ADG04.bean.Administracion.DTO_Usuario"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- Cabecera -->
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
 <title>Der große Verteiler - Distribuci&oacute;n y env&iacute;os</title>
 <!-- Scripts --> 
 <script src="jquery/jquery-2.1.1.js" type="text/javascript"></script>
 <script type="text/javascript" src="js/mainmenu.js"></script>
 <script type="text/javascript" src="jquery/jquery.timepicker.js"></script>
 <!-- Hojas de estilo -->
 <link href="css/style.css" rel="stylesheet" type="text/css" />
 <link href="jquery/jquery-ui.css" rel="stylesheet" type="text/css" />
 <link href="css/jquery.timepicker.css" rel="stylesheet" type="text/css">
 <!-- Fonts -->
 <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700' rel='stylesheet' type='text/css'>
 <link href="css/font-awesome.css" rel="stylesheet" type="text/css" >
</head>
<!-- Fin Cabecera -->
<!-- Declaraciones -->
<%
	String usuario;
	
	usuario = "";
	
	HttpSession sesionIntento = request.getSession();
	if(sesionIntento.getAttribute("usuario") != null){
		usuario = (String)sesionIntento.getAttribute("usuario");
	}    
%>
<input id="iInt_Logueado" type="hidden" value =""/>
<input id="iStr_User"     type="hidden" value =""/>
<!-- Fin Declaraciones -->

<!-- Scripts -->
<script type="text/javascript">

$(document).ready(function() {	
	  


		  	  
	   
}); //document ready

</script>
<!-- Fin Scripts -->
 
<!-- Cuerpo -->
<body>
<div class="container">
    <div class="content">
        <div id="wrap">
        	<header>
       		<div class="inner relative">
                      <ul style="width:227px;">
        				<li style="width:230px;"><a class="logo" href="main.jsp"><img src="images/logo_web_dgv_02.jpg" alt="Der grobe Verteiler" border="0"></a></li>
                     	<li class="logueado" style="width:227px; margin-top:10px;font-size:18px; line-height:25px; color:#f0af1e;">
                         <span id="nombreUsuario"> </span>               
                        </li>
                        <div id="cerrarSesion" style="width:227px;color:#fff; font-size:14px;" > </div>           	
         			    </ul>
                    <a id="menu-toggle" class="button dark" href="#"></a>
        			<nav id="navigation">
          
        		    </nav>
        			<div class="clear"></div>
          		</div>
 
        	</header>
        </div>	
  
    <!-- Pagina principal -->
    <div class="amarillo"></div>
  	<div class="page" style="background: #FFF; padding: 25px 50px;">
      <div id="divLogin">
      
      </div>
      <div id="divTodo">
       <%= '"' + (String)request.getAttribute("mensaje") + '"'%>
      </div>
      <div id="divAltaEncomienda">
      </div>
      <div id="paginaClientes">
      </div>
    </div>
    <!-- Fin Pagina principal -->   
    <div class="amarillo"></div>
    </div>
   <!-- Capa de desarrollo -->
    <div style="font-size: small;" id="logDebug" style="max-height:200px;overflow-y:auto;overflow-x:auto;white-space:pre;">
    
    </div>
    <br />
  </div>
</body>
</html>
