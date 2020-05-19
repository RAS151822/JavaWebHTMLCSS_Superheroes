<%-- 
    Document   : frmModificarSuperHeroe
    Created on : 18-may-2020, 20:37:04
    Author     : Ras
--%>


<%@page import="java.util.Iterator"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Query"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:useBean id="Superheroe" scope="request" class="ORM.Superheroes"/>
<jsp:setProperty name="Superheroe" property="*"/>

<%
    ORM.Superheroes superheroeBean = (ORM.Superheroes) request.getAttribute("Superheroe");
    if (superheroeBean == null) {
%>
ERROR: no se especific&oacute; sede a mostrar.
<%
} else {
    Session s = ORM.NewHibernateUtil.getInstance().getSessionFactory().openSession();
    try  {
        s.refresh(superheroeBean);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar SuperHeroe</title>
    </head>
    <body>
        <form method="post" action="controlador">
            <table border="1">
             
                    <input type="hidden" name="op" value="ModificarSuperHeroe"/>
                    <input type="hidden" name="idSuperheroe"  value="<%=superheroeBean.getIdSuperheroe()%>"/>
                    <tr><td>Nombre</td><td><input name="nomSuperheroe" value="<%=superheroeBean.getNomSuperheroe()%>" required method="post" type="text" size="20"  maxlength="20"/></td></tr>  
                    <tr><td>Habilidad</td><td><input name="habilidad" value="<%=superheroeBean.getHabilidad()%>" required method="post" type="text" size="20"  maxlength="20"/></td></tr> 
                    <tr><td>Capa</td><td><input name="capa" value="<%=superheroeBean.getCapa()%>" required method="post" type="text" size="15"  maxlength="20"/></td></tr> 
                    <tr><td>Genero</td><td><input name="genero" value="<%=superheroeBean.getGenero()%>" required method="post" type="text" size="15"  maxlength="20"/></td></tr> 

                    <td>
                        <input type="submit" value="Modificar"/>
                        <input type="reset" name="cancelar" value="Cancelar"/>
                    </td>
                </tr>
            </table>
        </form>
        <a href="controlador">Inicio</a>
    </body>
</html>
<%
        } catch (Exception e) {
            e.printStackTrace(System.err);
        }
    }
%>

