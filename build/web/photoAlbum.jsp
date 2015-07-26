<%-- 
    Document   : empty
    Created on : Aug 6, 2014, 3:20:05 PM
    Author     : john
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Functions.database_common_functions"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Photo Album Page</title>
        <link rel="stylesheet" type="text/css" href="main.css" media="screen" />
        <script src="javascript/jquery-1.10.2.js"></script>
        <script src="javascript/lightbox.min.js"></script>
        <link href="lightbox.css" rel="stylesheet" />
    </head>
    <body >

        <%@include file="navigationbar.jsp" %>
        <%            String username = (String) session.getAttribute("username");
            String role = (String) session.getAttribute("role");
            String houseId = request.getParameter("houseId");//ta xw perasei san orisma sto url!
            String houseOwner = request.getParameter("houseOwner");
            ArrayList<String> results = new ArrayList<String>();
            results = database_common_functions.fetchHouseImagesByHouseId(houseId);
            if (!results.isEmpty()) {
                %>
        

            <h1>Photo Gallery</h1>
            <div>
                Click the picture for a slide show!
            </div>
        <%
                for (String image : results) {


        %>

        <div >

            <% if (username.equals(houseOwner)) {  
            %>
            <form action="DeleteFileServlet" method="post">
                <input type="hidden" name="houseId" id="houseId" value="<%=houseId%>" >
                <input type="hidden" name="image" id="image" value="<%=image%>" >
                <input type="hidden" name="houseOwner" id="houseOwner" value="<%=houseOwner%>" >
                <%
                    }
                %>


                <a href="images/<%=image%>" data-lightbox="image-1" data-title="Click the right half of the image to move forward">
                    <img alt="house pics" src="images/<%=image%>" height="160"/> </a>

                <%
                    if (username.equals(houseOwner)) {
                %>

                <input type="submit" value="Delete photo" >
            </form>

            <%
                }
            %>

            
        </div>
        <%
            } %>
            <a href="Estateprofile.jsp?houseId=<%=houseId%>&houseOwner=<%=houseOwner%>" >Back to house description</a>
            <%
        } else {
                
        %>
        <h2>No images available</h2>
        <a href="Estateprofile.jsp?houseId=<%=houseId%>&houseOwner=<%=houseOwner%>" >Back to house description</a>

        <%
            }
        %>
        <%@include file="footer.jsp" %>
    </body>


</html>
