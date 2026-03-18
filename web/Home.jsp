<%-- 
    Document   : Home
    Created on : Mar 15, 2026, 3:28:15 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Home: Student Dorm management</h1>
        <h1>Available rooms</h1>
        <a href='Views/Login.jsp'>Login</a><a href='Views/Register.jsp'>Register</a>
        <table border="1">
            <tr>
                <th>Room Name</th>
                <th>Price</th>
                <th>Capacity</th>
            </tr>

            <c:forEach items="${rooms}" var="r">
                <c:if test="${r.status < r.maxStudents}">
                    <tr>
                        <td>${r.roomName}</td>
                        <td>${r.price}</td>
                        <td>${r.status}/${r.maxStudents}</td>
                    </tr>
                </c:if>
            </c:forEach>

        </table>
    </body>
</html>
