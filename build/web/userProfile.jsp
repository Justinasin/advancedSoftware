<%--
    Document   : userProfile
    Created on : Jun 11, 2014, 2:12:12 AM
    Author     : stavros
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Profile Page</title>
        <script type="text/javascript" src="javascript/registration_form_javascript.js">var externalScriptLoaded = false;</script>
        <link rel="stylesheet" type="text/css" href="main.css" media="screen" />
    </head>
        <body>

    <%@include file="navigationbar.jsp" %>

        <h1>Hello <% String message=(String) session.getAttribute("username");
    if(message!=null)
        out.println(message);
%>!</h1>


       <form name='edit_user' method="post" action="edit_user"  onsubmit='return validate_form();' >
            <table>
                <tr>
                <td>
            Username:
                </td>
                <td>
                    <input type="text" id="username" name="username" value="<%=session.getAttribute("username")%>" class="input" onchange="usernameLength()" > 
                </td>
                <td id="tdusernameid" style="color:red"></td>
                </tr>
                <tr>
                <td>
            Password:
                </td>
                <td>
            <input type="password" id="pwd" name="pwd" value="<%=session.getAttribute("password")%>" class="input" onchange="validatePassword()"> 
                </td>
                </tr>
                <tr>
                <td>
            Retype Password:
                </td>
                <td>
                    <input type="password" id="repwd" name="repwd" value="<%=session.getAttribute("password")%>" class="input" onchange="validatePassword()"> 
                </td>
                <td id="tdrepwdid" style="color:red"></td>
                </tr>
                <tr>
                <td>
            Name:
                </td>
                <td>
            <input type="text" id="name" name="name" value="<%=session.getAttribute("name")%>" class="input" onchange="onlyLettersName()"> 
                </td>
                <td id="tdnameid" style="color:red"></td>
                </tr>
                <tr>
                <td>
            Surname:
                </td>
                <td>
            <input type="text" id="Surname" name="Surname" value="<%=session.getAttribute("surname")%>" class="input" onchange="onlyLettersSurname()"> 
                </td>
                <td id="tdsurnameid" style="color:red"></td>
                </tr>
                <tr>
                <td>
            e-mail:
                </td>
                <td>
            <input type="email" id="email" name="email" value="<%=session.getAttribute("email")%>" class="input" onchange="validateEmail()"> 
                </td>
                <td id="tdmailid" style="color:red"></td>
                </tr>
                <tr>
                <td>
            phone:
                </td>
                <td>
            <input type="text" id="phone_n" name="phone" value="<%=session.getAttribute("phone")%>" class="input" onchange="onlyNumbersPhone()" > 
                </td>
                <td id="tdphoneid" style="color:red"></td>
                </tr>
                <tr>
                <td>
            Roles:
                </td>
                </tr>
            </table>
            <table>
                <tr>
                <%if(true){%>
                <td>
            Administrator <input type="checkbox" id="admin" name="admin" value="yes" checked disabled>
                </td>
                <%}%>
                <%if(true){%>
                <td>
            Landlord <input type="checkbox" id="landlord" name="landlord" value="yes" checked disabled>
                </td>
                <%}if(true){%>
                <td>
            Seller <input type="checkbox" id="seller" name="seller" value="yes" checked disabled>
                </td>
                <%}if(true){%>
                <td>
            Renter <input type="checkbox" id="Renter" name="Renter" value="yes" checked disabled>
                </td>
                <%}if(true){%>
                <td>
            Buyer <input type="checkbox" id="Buyer" name="Buyer" value="yes" checked disabled>
                </tr>
                <%}%>
            </table>
            <input type="submit" value="Apply changes" onclick="popup()">
        </form>
    <%@include file="footer.jsp" %>
    </body>

</html>
