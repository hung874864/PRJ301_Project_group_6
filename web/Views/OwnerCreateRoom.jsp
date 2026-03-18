<%-- 
    Document   : OwnerCreateRoom
    Created on : Mar 17, 2026, 8:22:09 PM
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
        <a href="Owner?action=dashboard">go back</a>
        <h1>Owner Create Room</h1>
        <form action="${pageContext.request.contextPath}/Owner" method="post">
            <table>
                <tr>
                    <td>Room Name: </td>
                    <td><input type="text" name="roomName" value="${roomName}"></td>
                </tr>
                <tr>
                    <td>Room Price: </td>
                    <td><input type="text" name="roomPrice" value="${roomPrice}"></td>
                </tr>
                <tr>
                    <td>Max student: </td>
                    <td><input type="text" name="maxStudent" value="${maxStudent}"></td>
                </tr>
                <tr>
                    <td><input type="submit" name="action" value="Create"></td>
                </tr>
                <tr>
                    <td>${error}</td>
                </tr>
            </table>
        </form>
    </body>
</html>
