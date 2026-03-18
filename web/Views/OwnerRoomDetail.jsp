<%-- 
    Document   : OwnerRoomDetail
    Created on : Mar 17, 2026, 4:03:42 PM
    Author     : LENOVO
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <a href="Owner?action=dashboard">go back</a>
        <h1>Room ID: ${room.roomID}</h1>
        
        <table border="1">
            <tr><a href="Owner?action=billDetail&roomID=${room.roomID}">Bill</a></tr>
            <tr>
                <th>Room Name</th>
                <th>Price</th>
                <th>Capacity</th>
            </tr>
                    <tr>
                        <td>${room.roomName}</td>
                        <td>${room.price}</td>
                        <td>${room.status}/${room.maxStudents}</td>
                    </tr>
        </table>
                    <table>
                        <tr>
                            <td>username</td>
                            <td>fullName</td>
                            <td>birthDate</td>
                            <td>gender</td>
                            <td>phone</td>
                        </tr>
                    <c:forEach items="${students}" var="s">
                        <tr>
                            <td>${s.username}</td>
                            <td>${s.fullName}</td>
                            <td>${s.birthDate}</td>
                            <td>${s.gender}</td>
                            <td>${s.phone}</td>
                        </tr>
                    </c:forEach>
                    </table>
        
    </body>
</html>
