<%-- 
    Document   : empty
    Created on : Aug 6, 2014, 3:20:05 PM
    Author     : stavros
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inbox Page</title>
        <link rel="stylesheet" type="text/css" href="main.css" media="screen" />
    </head>
    <body >

        <%@include file="navigationbar.jsp" %>
        <h1>Inbox: </h1>
        <div id="inbox">
            <table>
                <form action="/HouseGr/sendmessage.jsp" >
                    <input type="submit" value="New Message">
                </form>
                <%            ArrayList set = (ArrayList) request.getAttribute("inbox");
                    for (int i = 0; i < set.size(); i += 2) {
                %>
                
                    <tr>
                    <td style="width: 40%;">
                        Message from <%=(String) set.get(i + 1)%>: 
                    </td>
                    <td style="text-align:right; width: 60%;">
                        "<%=(String) set.get(i)%>"
                    </td>
                    <td style="text-align:right; width: 60%;">
                        <form id="reply" method="get" action="/HouseGr/sendmessage.jsp" >
                            <input type="hidden" id="replyto"  name="replyto" value=<%=(String) set.get(i + 1)%>>
                            <input type="submit" value="Reply"  >
                        </form>
                    </td>
                    <td>
                        <form id="deletemessage" method="get" action="deletemessage" >
                            <input type="hidden" id="message_to_delete"  name="message_to_delete" value= "<%=(String) set.get(i)%>" >
                            <input type="hidden" id="delete_from"  name="delete_from" value=<%=(String) set.get(i + 1)%>>
                            <input type="submit" value="Delete"  >
                        </form>
                    </td>
                </tr>

                <% }%>
            </table>
        </div>
        <%@include file="footer.jsp" %>
    </body>


</html>
