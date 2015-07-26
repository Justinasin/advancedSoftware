<%--
    Document   : userProfile
    Created on : Jun 11, 2014, 2:12:12 AM
    Author     : stavros
--%>

<%@page import="Functions.database_common_functions"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript" src="registration_form_javascript.js">var externalScriptLoaded = false;</script>
        <link rel="stylesheet" type="text/css" href="main.css" media="screen" />
    </head>
    <body>
        <%@include file="navigationbar.jsp" %>

        <h1>Hello <% String message = (String) session.getAttribute("username");
            if (message != null) {
                out.println(message);
            }
            %>! Welcome to <%= (String) request.getAttribute("username")%>'s Profile Page</h1>


        <form name='edit_user' method="post" action="edit_user"  onsubmit='return validate_form();' >
            <table>
                <tr>
                    <td>
                        Username:
                    </td>
                    <td>
                        <%=request.getAttribute("username")%> 
                    </td>
                </tr>
                <tr>
                    <td>
                        Password:
                    </td>
                    <td>
                        <%=request.getAttribute("password")%>
                    </td>
                </tr>
                <tr>
                    <td>
                        Retype Password:
                    </td>
                    <td>
                        <%=request.getAttribute("password")%>
                    </td>
                </tr>
                <tr>
                    <td>
                        Name:
                    </td>
                    <td>
                        <%=request.getAttribute("name")%>
                    </td>
                </tr>
                <tr>
                    <td>
                        Surname:
                    </td>
                    <td>
                        <%=request.getAttribute("surname")%>
                    </td>
                </tr>
                <tr>
                    <td>
                        e-mail:
                    </td>
                    <td>
                        <%=request.getAttribute("email")%>
                    </td>
                </tr>
                <tr>
                    <td>
                        phone:
                    </td>
                    <td>
                        <%=request.getAttribute("phone")%>
                    </td>
                </tr>
                <tr>
                    <td>
                        Roles:
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <%if (database_common_functions.isAdmin((String) request.getAttribute("roles"))) {%>
                    <td>
                        Administrator <input type="checkbox" id="admin" name="admin" value="yes" checked disabled>
                    </td>
                    <%} else {%>
                    <td>
                        Administrator <input type="checkbox" id="admin" name="admin" value="yes" disabled>
                    </td>
                    <%}%>
                    <%if (database_common_functions.isLandlord((String) request.getAttribute("roles"))) {%>
                    <td>
                        Landlord <input type="checkbox" id="landlord" name="landlord" value="yes" checked disabled>
                    </td>
                    <%} else {%>
                    <td>
                        Landlord <input type="checkbox" id="landlord" name="landlord" value="yes"  disabled>
                    </td>

                    <%}
                    if (database_common_functions.isSeller((String) request.getAttribute("roles"))) {%>
                    <td>
                        Seller <input type="checkbox" id="seller" name="seller" value="yes" checked disabled>
                    </td>
                    <%} else {%>
                    <td>
                        Seller <input type="checkbox" id="seller" name="seller" value="yes" disabled>
                    </td>
                    <%}
                    if (database_common_functions.isRenter((String) request.getAttribute("roles"))) {%>
                    <td>
                        Renter <input type="checkbox" id="Renter" name="Renter" value="yes" checked disabled>
                    </td>
                    <%} else {%>
                    <td>
                        Renter <input type="checkbox" id="Renter" name="Renter" value="yes" disabled>
                    </td>

                    <%}
                    if (database_common_functions.isBuyer((String) request.getAttribute("roles"))) {%>
                    <td>
                        Buyer <input type="checkbox" id="Buyer" name="Buyer" value="yes" checked disabled>
                    </td>
                    <%} else {%>
                    <td>
                        Buyer <input type="checkbox" id="Buyer" name="Buyer" value="yes"  disabled>
                    </td>
                    <%}%>

                </tr>

            </table>
            <!--<input type="submit" value="Apply changes" onclick="popup()">-->
            <%
                if (message != null) {
                    //out.println(message);
                }
            %>

        </form>
        <table>
            <tr>
                <td>
                    Confirmed:
                </td>
            <form method="post" action="confirm_user">
                <%    if ("0".equals((String) request.getAttribute("confirmed"))) {
                %>
                <input type="hidden" name="username" value=<%=request.getAttribute("username")%>  />
                <td>
                    <input style="margin-left:8px;" type="submit" value="confirm user" name="cnfusr"/>
                </td>
                <%
                } else {
                %>
                <input type="hidden" name="username" value=<%=request.getAttribute("username")%>  >
                <td>
                    <input style="alignment-adjust: central" type="submit" value="unconfirm user" name="cnfusr"/>
                </td>
                <%
                    }
                %>
            </form>
        </tr>
    </table>

    <%@include file="footer.jsp" %>
</body>
</html>
