<%-- 
    Document   : OwnerCreateBill
    Created on : Mar 18, 2026, 10:33:12 PM
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
        <a href="${pageContext.request.contextPath}/Owner?action=bill">go back</a>
        <h1>Owner create bill</h1>
        <form action="${pageContext.request.contextPath}/Owner" method="post">
    <table>
        <tr>
            <td>Room ID:</td>
            <td><input type="number" name="roomID" required></td>
        </tr>

        <tr>
            <td>Month:</td>
            <td><input type="number" name="month" min="1" max="12" required></td>
        </tr>

        <tr>
            <td>Year:</td>
            <td><input type="number" name="year" required></td>
        </tr>

        <tr>
            <td>Electricity:</td>
            <td><input type="number" step="0.01" name="electricity" required></td>
        </tr>

        <tr>
            <td>Water:</td>
            <td><input type="number" step="0.01" name="water" required></td>
        </tr>

        <tr>
            <td colspan="2">
                <input type="submit" name="action" value="Create Bill">
            </td>
        </tr>
    </table>
</form>
    </body>
</html>
