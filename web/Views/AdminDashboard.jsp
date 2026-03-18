<%-- 
    Document   : AdminDashboard
    Created on : Mar 16, 2026, 10:14:09 PM
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
        <a href="Logout">Log Out</a>
        <h1>admin dashboard</h1>
        <a href="Views/AdminCreateAccount.jsp">Create Account</a>
        <form action='${pageContext.request.contextPath}/Admin' method='post'>
            Search by username <input type='text' name='username'>
            <select name="role">
                <option value="admin" >Admin</option>
                <option value="owner" >Owner</option>
                <option value="student" >Student</option>
            </select>
            <input type='submit' name='action' value='Search'>
        </form>
        <table border="1">
            <tr>
                <th>Username</th>
                <th>Password</th>
                <th>Role</th>
                <th>Action</th>
            </tr>

            <c:forEach items="${accounts}" var="a">
                <tr>
                    <td>${a.username}</td>
                    <td>${a.password}</td>
                    <td>${a.role}</td>
                    <td><a href="Admin?action=update&username=${a.username}">Update</a> | <a href="Admin?action=delete&username=${a.username}">Delete</a></td>
                </tr>
            </c:forEach>

        </table>

    </body>
</html>
