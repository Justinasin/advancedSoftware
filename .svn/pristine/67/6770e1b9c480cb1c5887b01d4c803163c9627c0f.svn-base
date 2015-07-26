<%-- 
    Document   : sign_up
    Created on : Jun 12, 2014, 12:23:31 AM
    Author     : stavros
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="main.css" media="screen" /> 
        <script type="text/javascript" src="javascript/registration_form_javascript.js">var externalScriptLoaded = false;</script>

    </head>
    <body>
        <%@include file="navigationbar.jsp" %>

        <h1>sign up here re mouni!</h1>

        <form name='registration' method="post" action="register"  onsubmit="return validate_form();" >
            <table>
                <tr>
                    <td>
                        Username:
                    </td>
                    <td>
                        <input type="text" id="username" name="username" value="" class="input" onchange="usernameLength()" > 
                    </td>
                    <td id="tdusernameid" style="color:red"></td>
                </tr>
                <tr>
                    <td>
                        Password:
                    </td>
                    <td>
                        <input type="password" id="pwd" name="pwd" value="" class="input" onchange="validatePassword()"> 
                    </td>
                </tr>
                <tr>
                    <td>
                        Retype Password:
                    </td>
                    <td>
                        <input type="password" id="repwd" name="repwd" value="" class="input" onchange="validatePassword()"> 
                    </td>
                    <td id="tdrepwdid" style="color:red"></td>
                </tr>
                <tr>
                    <td>
                        Name:
                    </td>
                    <td>
                        <input type="text" id="name" name="name" value="" class="input" onchange="onlyLettersName()";> 
                    </td>
                    <td id="tdnameid" style="color:red"></td>
                </tr>
                <tr>
                    <td>
                        Surname:
                    </td>
                    <td>
                        <input type="text" id="Surname" name="Surname" value="" class="input" onchange="onlyLettersSurname()";> 
                    </td>
                    <td id="tdsurnameid" style="color:red"></td>
                </tr>
                <tr>
                    <td>
                        e-mail:
                    </td>
                    <td>
                        <input type="email" id="email" name="email" value="" class="input" onchange="validateEmail()";> 
                    </td>
                    <td id="tdmailid" style="color:red"></td>
                </tr>
                <tr>
                    <td>
                        phone:
                    </td>
                    <td>
                        <input type="text" id="phone_n" name="phone" value="" class="input" onchange="onlyNumbersPhone()"; > 
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
                    <td>
                        Administrator <input type="checkbox" id="admin" name="admin" value="yes">
                    </td>
                    <td>
                        Landlord <input type="checkbox" id="landlord" name="landlord" value="yes">
                    </td>
                    <td>
                        Seller <input type="checkbox" id="seller" name="seller" value="yes">
                    </td>
                    <td>
                        Renter <input type="checkbox" id="Renter" name="Renter" value="yes">
                    </td>
                    <td>
                        Buyer <input type="checkbox" id="Buyer" name="Buyer" value="yes">
                </tr>

            </table>
            <input type="submit" value="Register" >
            <% String message = (String) request.getAttribute("message");
                if (message != null) {
                    out.println(message);
                }
            %>
        </form> 

        <%@include file="footer.jsp" %>
    </body>
</html>
