package Functions;


import Functions.database_common_functions;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author stavros
 */
public class register extends HttpServlet
{
    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {

        String Username = (String) request.getParameter("username");
        String Password = (String) request.getParameter("pwd");
        String RetypePassword = (String) request.getParameter("repwd");
        String Name = (String) request.getParameter("name");
        String Surname = (String) request.getParameter("Surname");
        String email = (String) request.getParameter("email");
        String phone = (String) request.getParameter("phone");
        String[] role=new String[5];
         /*Administrator*/ role[0] = (String) request.getParameter("admin");
         /*Landlord*/ role[1]=(String) request.getParameter("landlord");
         /*Seller*/ role[2]=(String) request.getParameter("seller");
         /*Renter*/ role[3]=(String) request.getParameter("Renter");
         /*Buyer*/ role[4]=(String) request.getParameter("Buyer");
         
        int[] roles=new int[5];
        System.out.println("fraoules"+roles);
        for (int i = 0; i < 5; i++) {
                System.out.println(role[i]);
            if ("yes".equals(role[i])) {
                roles[i] = 1;
            } else {
                roles[i] = 0;
            }
            System.out.println("fraoules" + roles[i]);
        }
        System.out.println("fraoules"+roles);
        String message="";
        String url="/n,desmrn";
        System.out.println("eimai exsw");

        try {
	    Connection connection = ConnPoolInit.ConnPoolInit.Datasource.getConnection();
	    System.out.println("eimai mesa");   
	    Statement st=connection.createStatement();
            ResultSet set = null;
            set = st.executeQuery("SELECT username FROM Users WHERE username = '"
                    + Username + "' ");
            if(database_common_functions.isInDatabase(Username) == 1){            
                message = "Username already registered";
            
                url = "/register.jsp";
            } else if (!Password.equals(RetypePassword)) {
                message = "Passwords didn't match";
            
                url = "/register.jsp";
            } else if (roles[0] == 0 && roles[1] == 0 && roles[2] == 0 && roles[3] == 0 && roles[4] == 0 ) {
                message = "You must select at least one role for your account";
            
                url = "/register.jsp";
            } else {
            System.out.println("skata"+roles[0]+roles[1]+roles[2]);
            
                String final_role= "'"+roles[0]+roles[1]+roles[2]+roles[3]+roles[4]+"'";
                database_common_functions.insertIntoBase(Username, Password,
                                                            Name, Surname, email,phone
                                                            ,final_role );
            
                
                
                message = "You have registered successfully. Your account is on our list to be confirmed :)";
                url = "/pendingconfirmation.jsp";
            }
            request.setAttribute("message", message);
            st.close();
	    connection.close();
	} catch (SQLException e) {
            System.out.println("catch edw");
	}
        RequestDispatcher dispatcher =
                getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }
    
}