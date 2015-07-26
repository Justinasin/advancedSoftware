<%-- 
    Document   : empty
    Created on : Aug 6, 2014, 3:20:05 PM
    Author     : stavros
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="main.css" media="screen" />
    </head>
    <body >

        <%@include file="navigationbar.jsp" %>

        <div>
            <h1>New Message:</h1>
            <div>
                <form action="sendmessage" method="post">
                    <table>
                        <tr>
                            <td>
                                To:
                            </td>
                            <td>
                                <input type="text" id="sendto" name="sendto" value=<%=(request.getParameter("replyto"))!=null?(request.getParameter("replyto")):""%> >
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Message:
                            </td>
                            <td>
                                <textarea id="message" name="message" rows="7" cols="50" ></textarea>
                            </td>
                        </tr>
                    <input type="hidden" id="sendfrom"  name="sendfrom" value=<%=(String) session.getAttribute("username") %>>
                        <tr>
                            <td>
                            </td>
                            <td>
                    <input type="submit" style="float: right" value="Send"  >
                            </td>
                        </tr>
                    </table>
                    

                </form>
            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>


</html>
