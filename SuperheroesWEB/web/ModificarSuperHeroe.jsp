<%-- 
    Document   : ModificarSuperHeroe
    Created on : 18-may-2020, 22:30:32
    Author     : Ras
--%>

<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Query"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:useBean id="Superheroe" scope="request" class="ORM.Superheroes"/>
<jsp:setProperty name="Superheroe" property="*"/>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar SuperHeroe</title>
    </head>
    <body>
        <%
            ORM.Superheroes superheroeBean = (ORM.Superheroes) request.getAttribute("Superheroe");
            if (superheroeBean == null) {
        %>
        ERROR: no se proporcionaron datos de superheroe para crear.
        <%
        } else {
            Transaction t = null;
            Session s = ORM.NewHibernateUtil.getInstance().getSessionFactory().openSession();
            
            try {
                t = s.beginTransaction();%>
                 
                <%=superheroeBean.getIdSuperheroe()%>
                <%
                s.update(superheroeBean);
                t.commit();
        %>
        editad@ el/la SUPERHERO@: [<%=superheroeBean.getIdSuperheroe()%>] <%=superheroeBean.getNomSuperheroe()%><br/>
        <a href="controlador">Volver</a>
        <%
                } catch (Exception e) {
                    e.printStackTrace(System.err);
                    if (t != null) {
                        t.rollback();
                    }
                }
            }
        %>
    </body>
</html>


