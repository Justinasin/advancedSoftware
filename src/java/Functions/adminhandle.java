package Functions;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import Functions.database_common_functions;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author stavros
 */
public class adminhandle extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = "/";
        String name = request.getParameter("ad");
        String message = "empty";
        System.out.println("mphklyfyutf" + name);
        if ("View Users".equals(name)) {
            message = "success";

            url = "/admin.jsp";
            ArrayList<String> results = new ArrayList<String>();

            results = database_common_functions.selectAllUsers();

            request.setAttribute("set", results);
            request.setAttribute("message", message);

        } else if ("View Algorithms".equals(name)) {
            System.out.println("asdasl   " + name);
            message = "create dropdownlist";
            request.setAttribute("message", message);
            url = "/admin.jsp";
        }

        RequestDispatcher dispatcher
                = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);

    }
}
