<%-- 
    Document   : admin
    Created on : Jun 12, 2014, 11:51:28 PM
    Author     : stavros
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.io.PrintWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="main.css" media="screen" />
    </head>
    <body>
    <%@include file="navigationbar.jsp" %>

        <h1>Hello, <%= session.getAttribute("name")%> <%= session.getAttribute("surname")%>!!</h1>
        <form name="viewusers" method="post" action="adminhandle">
            <input type="submit" value="View Users" name ="ad" /> 
            <input type="submit" value="View Algorithms" name="ad" />
        </form>
        <% String message = (String) request.getAttribute("message");
            System.out.println("arxidia   " + message);

            if (message == "create dropdownlist") {
                //ftiaxnoume to drop down gia tous algorithmous
        %>
        <div class="adminresults" align="center">
            <span>Available Algorithms:</span>
            <select name='selectalgorithms'>
                <option value='saw' selected>SAW</option>
                <option value='topsis'>TOPSIS</option>
            </select>
        </div>
        <%
        } else if (message == "success") {
        //edw epistrefei to set, opte ftiaxnoume pinaka
        %>
        <%
            ArrayList set = (ArrayList) request.getAttribute("set");
        %>
        <div class="adminresults" id="user_confirm_table" align="center">
            <table>
                <!-- username | password | name   | surname  | email | phone | roles | confirmed -->
                <tr>
                    <th>
                        username
                    </th>
                    <th>
                        password
                    </th>
                    <th>
                        name
                    </th>
                    <th>
                        surname
                    </th>
                    <th>
                        email
                    </th>
                    <th>
                        phone
                    </th>
                    <th>
                        roles
                    </th>
                    <th>
                        confirmed
                    </th>
                </tr>
                <%
                    int no_users = 0;
                    if (set.size() == 1) {
                        // O monos user einai o admin ara o eautos sou 
                        no_users = 1;
                    }

                    for (int i = 0; i < set.size(); i++) {
                        String str = (String) set.get(i);
                        String delims = "[ ]+";
                        String[] tokens = str.split(delims);
                        if (tokens[0].equals(session.getAttribute("name"))) {
                            continue;

                        }
                %>
                
                <tr>
                    <td>
                        <a href=otherUserProfile?username='<%=tokens[0]%>'> <%=tokens[0]%></a>
                    </td>
                    <%
                        
                        for (int j = 1; j < 7; j++) {
                    
                    %>
                    <td>
                        <span>  <%=tokens[j]%> </span>
                    </td>
                    <%
                        }
                    %>
                <form method="post" action="confirm_user">
                    <%    if ("0".equals(tokens[7])) {
                    %>
                    <input type="hidden" name="username" value=<%=tokens[0]%>  />
                    <td>
                        <input style="margin-left:8px;" type="submit" value="confirm user" name="cnfusr"/>
                    </td>
                    <%
                    } else {
                    %>
                    <input type="hidden" name="username" value=<%=tokens[0]%>  >
                    <td>
                        <input style="alignment-adjust: central" type="submit" value="unconfirm user" name="cnfusr"/>
                    </td>
                    <%
                        }
                    %>
                </form>
                </tr>
                <%
                    }
                    if (no_users == 1) {
                %>
                <tr><td>No users in database!!!</td></tr>
                <%
                    }
                %>
            </table>
        </div>
    </html>
    <%
        }
    %>
<%@include file="footer.jsp" %>
</body>
</html>
