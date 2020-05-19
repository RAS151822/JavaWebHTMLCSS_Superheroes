<%@page import="java.util.Iterator"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Query"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:useBean id="Superheroe" scope="request" class="ORM.Superheroes"/>
<jsp:setProperty name="Superheroe" property="*"/>

<%
    ORM.Superheroes sedeBean = (ORM.Superheroes) request.getAttribute("Superheroe");
    if (sedeBean == null) {
%>
ERROR: no se especific&oacute; SuperHeroe a mostrar.
<%
} else {
    try{
        Session s = ORM.NewHibernateUtil.getInstance().getSessionFactory().openSession();
        s.refresh(sedeBean);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Superheroe <%=sedeBean.getIdSuperheroe()%> - <%=sedeBean.getNomSuperheroe()%></title>
        <link rel="stylesheet" href="mystyles.css">
    </head>
    <body>
        <div id="main-container">   
        <table border="1">
            
            <thead>
            <tr><td colspan="4" align="center">Superheroe <%=sedeBean.getIdSuperheroe()%> - <%=sedeBean.getNomSuperheroe()%></td></tr>
            </thead>
            <tr>
                <td >Habilidad </td><td><%=sedeBean.getHabilidad()%></td>
                <td>Capa </td><td> <%=sedeBean.getCapa()%></td>
                <td>Genero </td><td> <%=sedeBean.getGenero()%></td> 
            </tr>
        
        </table>
        </div>>       
            
       <div id="main-container"> 
        
            <table border="1">
                
            
            <thead><tr><td colspan="2" align="center">Super Poderes</td></tr> </thead>
           
                        <%
                          if (sedeBean.getSuperpodereses().isEmpty()) {%>
                <tr><td colspan="2">No existen superpoderes en este SuperHeroe </td></tr>
                <%
                } else {
                    Iterator itDeptos = sedeBean.getSuperpodereses().iterator();
                    while (itDeptos.hasNext()) {
                        ORM.Superpoderes unDepto = (ORM.Superpoderes) itDeptos.next();
                %>
                <tr>
                    <td><%=unDepto.getNomPoder()%></td>
                    <td><%=unDepto.getIdSuperpoder()%></td>
                </tr>
                <%
                        }
                    }
                %>
                <tr> 
                    <td> 
                            <input type="hidden" name="op" method="post" value="insertSuperHeroe"/> 
                            <input name="nomSuperHeroe" required method="post" type="text" size="20"  maxlength="20"/> 
                    </td> 
                </tr> 
                <tr> 
                    <td> 
                            <input type="submit" value="Crear"/> 
                            <input type="reset" name="cancelar" value="Cancelar"/> 
                    </td> 
                </tr> 

            </table>
       </div>> 
    </body>
</html>
<%
        } catch (Exception e) {
            e.printStackTrace(System.err);
        }
    }
%>