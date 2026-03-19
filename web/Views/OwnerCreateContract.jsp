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
        <a href="${pageContext.request.contextPath}/Owner?action=contract">go back</a>
        <h1>Owner Create Contract</h1>
        <form action="${pageContext.request.contextPath}/Owner" method="post">
            <table>

                <tr>
                    <td>Student Username:</td>
                    <td><input type="text" name="studentUsername" value="${studentUsername}" required></td>
                </tr>

                <tr>
                    <td>Room ID:</td>
                    <td><input type="number" name="roomID" value="${roomID}" required></td>
                </tr>

                <tr>
                    <td>Start Date:</td>
                    <td><input type="date" name="startDate" value="${startDate}" required></td>
                </tr>

                <tr>
                    <td>End Date:</td>
                    <td><input type="date" name="endDate" value="${endDate}" required></td>
                </tr>

                <tr>
                    <td colspan="2">
                        <input type="submit" name="action" value="Create Contract">
                    </td>
                </tr>

                <tr><td>${error}</td></tr>
            </table>
        </form>
    </body>
</html>
