<!-- frmNuevaSede.jsp --> 
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<jsp:useBean id="Superheroe" scope="request" class="ORM.Superheroes"/> 
<jsp:setProperty name="Superheroe" property="*"/> 
<!DOCTYPE html> 
<html> 
	<head> 
		<meta http-equiv="ContentType" content="text/html; charset=UTF-8"> 
		<title>Alta SuperHeroe</title> 
                 <link rel="stylesheet" href="mystyles.css">
	</head>
     
	<body> 
            <div id="main-container">   
		<form method="post" action="controlador"> 
			<table border="1"> 
				
                            <input type="hidden" name="op" method="post" value="InsertSuperHeroe"/> 		
                            <tr><td>Nombre</td><td><input name="nomSuperheroe" required method="post" type="text" size="20"  maxlength="20"/></td></tr>  
                            <tr><td>Habilidad</td><td><input name="habilidad" required method="post" type="text" size="20"  maxlength="20"/></td></tr> 
                            <tr><td>Capa</td><td><input name="capa" required method="post" type="text" size="15"  maxlength="20"/></td></tr> 
                            <tr><td>Genero</td><td><input name="genero" required method="post" type="text" size="15"  maxlength="20"/></td></tr> 

				<tr> 
					<td> 
						<input type="submit" value="Crear"/> 
						<input type="reset" name="cancelar" value="Cancelar"/> 
					</td> 
				</tr> 
			</table> 
		</form> 
		<a href="controlador">Inicio</a> 
          </div>
	</body> 
</html> 