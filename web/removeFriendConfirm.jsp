<%-- 
    Document   : DeleteAccountConfirm
    Created on : Sep 9, 2014, 9:48:17 PM
    Author     : vijani
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Social Network :: Delete Confirm Page</title>
    </head>
    <body>
         <%
                    
  Long id = (Long.parseLong(request.getParameter("id")));
         %>
        <h1>Are you sure you want to remove this friend?</h1>
        <form action="remove" method="post">
            <input type="hidden" name="id" value="<%= id %>">
            <input type="submit" value= "yes">
        </form>
            <a href="friendList.jsp"><input type ="button" value="no" > </a>
    </body>
</html>
