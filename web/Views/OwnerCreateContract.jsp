<%-- 
    Document   : OwnerCreateContract
    Created on : Mar 18, 2026, 10:31:52 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <a href="Owner?action=contract">go back</a>
        <h1>Owner Create Contract</h1>
        <form action="${pageContext.request.contextPath}/Owner" method="post">
        
        </form>
        <tr>
            <td>${c.contractID}</td>
            <td>${c.studentUsername}</td>
            <td>${c.roomID}</td>
            <td>${c.startDate}</td>
            <td>${c.endDate}</td>
        </tr>
    </body>
</html>
