<%-- 
    Document   : home
    Created on : 23-abr-2020, 10:57:05
    Author     : cuvil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Query"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SUPERHEROES</title>
        <link rel="stylesheet" href="mystyles.css">
    </head>
    <body>
     <div id="main-container">   
            <form name="frm_muestra_superheroe" method="post" action="controlador">
                <input type="hidden" name="op" value="MuestraSuperHeroe">
                <input type="hidden" name="idSuperheroe">
                <table>
                    
                    <thead>
                        <tr><td colspan="4" align="center"> SuperHeroes [<a href="javascript:void(0)" onclick="javascript:document.frm_muestra_superheroe.op.value = 'AltaSuperHeroe';document.frm_muestra_superheroe.submit();">Nuevo SuperHeroe</a>]</td></tr>
                    </thead>
                        <%
                            Session s = ORM.NewHibernateUtil.getInstance().getSessionFactory().openSession();
                            try {
                                Query q = s.createQuery("FROM Superheroes ORDER BY nomSuperheroe,idSuperheroe").setReadOnly(true);
                                List<ORM.Superheroes> listaSuperheroes = (List<ORM.Superheroes>) q.list();
                        if (listaSuperheroes.isEmpty()) {%>
                        <tr><td colspan="2">No existen SuperHeroes</td></tr>
                        <%
                } else {
                    for (ORM.Superheroes unsuperheroe : listaSuperheroes) {%>
                        <tr>
                            <td><%=unsuperheroe.getIdSuperheroe()%></td>
                            <td><a href="javascript:void(0)" onclick="javascript:document.frm_muestra_superheroe.idSuperheroe.value = '<%=unsuperheroe.getIdSuperheroe()%>';
                                    document.frm_muestra_superheroe.submit();"><%=unsuperheroe.getNomSuperheroe()%></a></td>
                                        <td><a href="javascript:void(0)" onclick="javascript:document.frm_muestra_superheroe.op.value = 'frmModificarSuperHeroe'; document.frm_muestra_superheroe.idSuperheroe.value = '<%=unsuperheroe.getIdSuperheroe()%>';
                                      document.frm_muestra_superheroe.submit();"> Editar </a></td>
                             <td><a href="javascript:void(0)" onclick="javascript:document.frm_muestra_superheroe.op.value = 'EliminarSuperheroe'; document.frm_muestra_superheroe.idSuperheroe.value = '<%=unsuperheroe.getIdSuperheroe()%>';
                                    document.frm_muestra_superheroe.submit();"> Eliminar </a></td>
                        </tr>
                        <%
                                    }
                                }
                            } catch (Exception e) {
                                e.printStackTrace(System.err);
                            }
                        %>
                </table>
            </form>
    </div>
    </body>
</html>
