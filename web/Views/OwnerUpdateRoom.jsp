<%-- 
    Document   : OwnerUpdateRoom
    Created on : Mar 18, 2026, 7:11:21 PM
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
        <a href="${pageContext.request.contextPath}/Owner?action=dashboard">go back</a>
        <h1>Owner Update Room at ID: ${r.roomID}</h1>
        <form action="${pageContext.request.contextPath}/Owner" method="post">
            <table>
                <tr>
                    <td>Room ID: </td>
                    <td><input type="text" name="roomID" value="${r.roomID}" readonly></td>
                </tr>
                <tr>
                    <td>Room Name: </td>
                    <td><input type="text" name="roomName" value="${r.roomName}"></td>
                </tr>
                <tr>
                    <td>Room Price: </td>
                    <td><input type="text" name="roomPrice" value="${r.price}"></td>
                </tr>
                <tr>
                    <td><input type="submit" name="action" value="Update"></td>
                </tr>
                <tr>
                    <td>${error}</td>
                </tr>
            </table>
        </form>
    </body>
</html>
