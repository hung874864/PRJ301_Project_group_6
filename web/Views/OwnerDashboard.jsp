<%-- 
    Document   : OwnerDashboard
    Created on : Mar 16, 2026, 10:14:00 PM
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
        <h1>owner dashboard</h1>
        <a href="Owner?action=contract">Contracts</a><a href="Owner?action=bill">Bills</a>
            <a href="Views/OwnerCreateRoom.jsp">Create Room</a>
            <form action="${pageContext.request.contextPath}/Owner" method="post">
                <tr>Room ID: <input type="text" name="roomSearch" value="${roomSearch}"></tr>
                <input type="submit" name="action" value="Search">
                <tr>${error}</tr>
            </form>
        <table border="1">
            <tr>
                <th>Room Name</th>
                <th>Price</th>
                <th>Capacity</th>
                <th>Action</th>
            </tr>

            <c:forEach items="${rooms}" var="r">
                <tr>
                    <td>${r.roomName}</td>
                    <td>${r.price}</td>
                    <td>${r.status}/${r.maxStudents}</td>
                    <td>
                        <a href="Owner?id=${r.roomID}&action=detail">Detail</a>
                        <a href="Owner?id=${r.roomID}&action=update">Update</a>
                        <c:if test="${r.status==0}">
                            <a href="Owner?id=${r.roomID}&action=delete">Delete</a>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>

        </table>
    </body>
</html>
