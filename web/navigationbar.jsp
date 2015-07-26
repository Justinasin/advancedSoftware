<%-- 
    Document   : navigationbar
    Created on : Jun 28, 2014, 6:00:13 PM
    Author     : stavros
--%>

<%@page import="Functions.database_common_functions"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="main.css">
    <script type="text/javascript" src="javascript/jquery-1.10.2.js"></script>
    <script src="javascript/script.js"></script>

</head>

<!--<div id="container">-->

<!--    <div >
        <a href ="index.jsp">Welcome page! </a>
    </div>
-->
<div id="header" class="header">
    <!-- div for logo-->
    <div id="logo">
        <div id="image_logo">
            <a href="index.jsp">
                <img   alt="Logo HouseGr" src="img/HouseGrLogo.png"/>
            </a>
        </div>
    </div>
    <!--div for login-->
    <div id="login">
        <%
            if (session.isNew()) {
                session.setAttribute("username", "guest");
            }
        %>
        <%
            String usr = (String) session.getAttribute("username");
            if ("guest".equals(usr)) {
        %>
        <fieldset class="fieldset">
            <legend class="legend">
                Login:</legend>
            <form method="post" action="sign_in">

                <div class="field_names">
                    Username:
                    Password:
                </div>
                <div>
                    <input class="input" type="text" name="username" autocomplete="off">
                    <input class="input" type="password" name="pwd" autocomplete="off">
                    <input class="submit" type="submit" value="Sign In">
                </div>

            </form>
        </fieldset>
        <span>or <a href="register.jsp">Register</a></span>
        <%
        } else {
        %>
        <fieldset class="fieldset" style="text-align: right">
            <div>
                <div>Welcome,</div>
                <div style="padding-top: 23px;">
                    <%=(String) session.getAttribute("username")%>

                </div>
                <div style="padding-top: 18px">
                    <a href="userProfile" style="font-size:12px" >My account</a>
                    <a href="${pageContext.request.contextPath}/logout"  style="width: 100px;font-size:12px;  margin-left: 10px;" >logout </a>
                </div>
            </div>
        </fieldset>
        <%
            }
        %>

    </div>


    <div id="cssmenu">
        <ul>
            <li> <a href="home"><span>Home</span></a> </li>
            <li> <a href="buyer_renter.jsp" ><span>Search for Houses</span></a> </li>
            <li> <a href="aboutUs.jsp"><span>About Us</span></a> </li>
            <li> <a href="contactUs.jsp"> <span>Contact</span></a></li>
                <%
                    if (!(request.getSession().getAttribute("username").equals("guest"))) {
                %>
            <li> <a href= "inbox"> <span>Inbox</span></a></li>
                <%
                    String role = (String) request.getSession().getAttribute("role");
                    if (database_common_functions.isAdmin(role)) {
                %>
            <li> <a href= "admin.jsp"> <span>Admin Panel</span></a></li>
                <%
                }
                    if (database_common_functions.isLandlord(role) || database_common_functions.isSeller(role)) {
                %>
            <li> <a href= "seller_landlord.jsp"> <span>My Estates</span></a></li>
                <%                        } else if (database_common_functions.isRenter(role) || database_common_functions.isBuyer(role)) {
                        } else {
                        }
                    }%>

        </ul>
    </div>
</div>
<div id="mainbody" class="mainbody">
    <%
        usr = (String) session.getAttribute("username");
        if (false) {//!("guest".equals(usr))) {
    %>
    <%@include file="sidebar.jsp" %>
    <%
        }
    %>

