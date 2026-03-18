<%-- 
    Document   : OwnerBill
    Created on : Mar 17, 2026, 1:43:39 PM
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
        <h1>Owner Bill</h1>
        <a href="Owner?action=dashboard">Rooms</a><a href="Owner?action=contract">Contracts</a><a href="Logout">Log Out</a>

        <form action="${pageContext.request.contextPath}/Owner" method="post">
            <tr>Room ID: <input type="text" name="roomSearch" value="${roomSearch}"></tr>
            <input type="submit" name="action" value="Search Bill">
            <tr>${error}</tr>
        </form>
        <a href="Views/OwnerCreateBill.jsp">Create Bill</a>
        <h1>Bill List</h1>


        <table border="1">
            <tr>
                <th>Bill ID</th>
                <th>Room ID</th>
                <th>Month</th>
                <th>Year</th>
                <th>Electricity</th>
                <th>Water</th>
                <th>Total</th>
                <th>Action</th>
            </tr>

            <c:forEach items="${bills}" var="bill">
                <tr>
                    <td>${bill.billID}</td>
                    <td>${bill.roomID}</td>
                    <td>${bill.month}</td>
                    <td>${bill.year}</td>
                    <td>${bill.electricity}</td>
                    <td>${bill.water}</td>
                    <td>${bill.total}</td>
                    <td><a href="Owner?action=billDetail&roomID=${bill.roomID}">Detail</a></td>
                </tr>
            </c:forEach>


        </table>
    </body>
</html>
