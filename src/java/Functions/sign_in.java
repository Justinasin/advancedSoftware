package Functions;


import Functions.database_common_functions;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author stavros
 */
public class sign_in extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //HttpSession session =//= request.getSession(false);

        String username = (String) request.getParameter("username");
        //session.setAttribute("username", username);
        String password = (String) request.getParameter("pwd");

        String name = "";
        String surname = "";
//        String username= new String();
//        username=(String) request.getParameter("username");
//        String password= (String) request.getParameter("pwd");    
        String role = "";
        String confirmed = "";
        String url="/";
        try {
	    Connection connection = ConnPoolInit.ConnPoolInit.Datasource.getConnection();
	    Statement statement = connection.createStatement();
	    ResultSet set = null;
	    set = statement.executeQuery("SELECT name,surname,roles,confirmed FROM Users WHERE username = '"
                    + username + "' and password = '" + password + "' ");

            if (set.next()) {
                name = set.getString(1);
                surname = set.getString(2);
                role = set.getString(3);
                confirmed = set.getString(4);
                //System.out.println(role);
                if(!database_common_functions.isConfirmed(confirmed)){
                    //System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!UUUUUUUN CONFIRMED !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
                    url = "/pendingconfirmation.jsp";
                    //request.setAttribute("message",name+" "+surname);
                }else{
                request.setAttribute("message",name+" "+surname);
                request.getSession().setAttribute("name",name);
                request.getSession().setAttribute("surname",surname);
                request.getSession().setAttribute("role",role);
                request.getSession().setAttribute("username",username);
                
                //session.setAttribute("name",name);
                //session.setAttribute("surname",surname);
                //session.setAttribute("role", role);
                //session.setAttribute("username", username);
                
                if( database_common_functions.isAdmin(role)){
                    url = "/admin.jsp";
                }else if( database_common_functions.isLandlord(role) || database_common_functions.isSeller(role)){
                    url = "/seller_landlord.jsp";
                }else if(database_common_functions.isRenter(role) || database_common_functions.isBuyer(role)){
                    url = "/buyer_renter.jsp";
                } else {
                    url = "/userProfile.jsp";
                }
                }
                
            }else{
                request.setAttribute("message","Wrong username/password or not signed up");
                url = "/index.jsp";
            }

            statement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        RequestDispatcher dispatcher
                = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }
    
    

}