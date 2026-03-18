<%-- 
    Document   : OwnerContract
    Created on : Mar 17, 2026, 1:43:19 PM
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
        <h1>owner contract</h1>
        <a href="Owner?action=dashboard">Rooms</a><a href="Owner?action=bill">Bills</a><a href="Logout">Log Out</a>
        
        <form action="${pageContext.request.contextPath}/Owner" method="post">
            <tr>Student username: <input type="text" name="contractSearch" value="${contractSearch}"></tr>
            <input type="submit" name="action" value="Search Contract">
        </form>
            <br><!-- comment -->
            <a href="Views/OwnerCreateContract">Create Contract</a>
        
        <h1>Contract List</h1>

<table border="1">
    <tr>
        <th>Contract ID</th>
        <th>Student Username</th>
        <th>Room ID</th>
        <th>Start Date</th>
        <th>End Date</th>
    </tr>

    <c:forEach items="${contracts}" var="c">
        <tr>
            <td>${c.contractID}</td>
            <td>${c.studentUsername}</td>
            <td>${c.roomID}</td>
            <td>${c.startDate}</td>
            <td>${c.endDate}</td>
        </tr>
    </c:forEach>

</table>
    </body>
</html>
