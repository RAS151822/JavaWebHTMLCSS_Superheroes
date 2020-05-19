/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;
import org.hibernate.Session;

public class controlador extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");

        String oper = request.getParameter("op");
        if (oper == null) {
            oper = "";
        }
        
        System.out.println("DEBUG:" + request.getParameter("idSuperheroe"));
        System.out.println("DEBUG:" + request.getParameter("op"));

        RequestDispatcher rd;

        switch (oper) {
            case "AltaSuperHeroe":
                response.sendRedirect("frmNuevoSuperHeroe.jsp");
                break;
            case "InsertSuperHeroe":
                rd = request.getRequestDispatcher("InsertNuevoSuperHeroe.jsp");
                rd.forward(request, response);
                break;
            case "MuestraSuperHeroe":
                System.out.println("LLega");
                rd = request.getRequestDispatcher("muestraSuperHeroe.jsp");
                rd.forward(request, response);
                break;
            case "frmModificarSuperHeroe":
                rd = request.getRequestDispatcher("frmModificarSuperHeroe.jsp");
                rd.forward(request, response);
                break;
            case "ModificarSuperHeroe":
                rd = request.getRequestDispatcher("ModificarSuperHeroe.jsp");
                rd.forward(request, response);
                break;
            case "EliminarSuperheroe":
                int idSede = Integer.parseInt(request.getParameter("idSuperheroe"));
                ORM.Superheroes aux = new ORM.Superheroes();
                aux.setIdSuperheroe(idSede);
                aux.setNomSuperheroe("Yies");
                aux.setHabilidad("");
                
                Session s2 = ORM.NewHibernateUtil.getInstance().getSessionFactory().openSession();
                s2.beginTransaction();
                s2.delete(aux);
                s2.getTransaction().commit();
                s2.close();
     
            default:
                response.sendRedirect("home.jsp");
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

