package Functions;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import Functions.database_common_functions;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpUtils;

/**
 *
 * @author stavros
 */
@WebServlet(urlPatterns = {"/admin"})
public class confirm_user extends HttpServlet {

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
        //processRequest(request, response);
                
        String action = request.getParameter("cnfusr");
        String message = "success";
        String username = request.getParameter("username");
        String url="/admin.jsp";
        request.setAttribute("message", message);
        
            try {
                //confirm user :P
                
        if("confirm user".equals(action)){
                Connection connection = ConnPoolInit.ConnPoolInit.Datasource.getConnection();
                Statement statement = connection.createStatement();
                            System.out.println("mphke sto confirm user,me action-="+action+" username = "+username);
    
                statement.executeUpdate("update Users " + "set confirmed=1 " + "where username='"+username+"';");
                
        }else{
            if("unconfirm user".equals(action)){
                Connection connection = ConnPoolInit.ConnPoolInit.Datasource.getConnection();
                Statement statement = connection.createStatement();
                
                statement.executeUpdate("UPDATE Users " + "SET confirmed=0 " + "WHERE username='"+username+"';");
            }
        }
                
               message = "success";
                
                
                //url = "/admin.jsp";
                ArrayList<String> results=new ArrayList<String>();
                results = database_common_functions.selectAllUsers();
                request.setAttribute("set", results);
                request.setAttribute("message", message);
                
                
                
            } catch (SQLException ex) {
                Logger.getLogger(confirm_user.class.getName()).log(Level.SEVERE, null, ex);
            }
            
       RequestDispatcher dispatcher
                = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
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
