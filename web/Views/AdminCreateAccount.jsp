<%-- 
    Document   : AdminCreateAccount
    Created on : Mar 16, 2026, 11:15:14 PM
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
    <h1>Admin Create Account</h1>

    <form action="${pageContext.request.contextPath}/Admin" method="post">
        <table>

            <tr>
                <td>Username:</td>
                <td>
                    <input type="text" name="username" required>
                </td>
            </tr>

            <tr>
                <td>Password:</td>
                <td>
                    <input type="password" name="password" required>
                </td>
            </tr>

            <tr>
                <td>Role:</td>
                <td>
                    <select name="role">
                        <option value="admin">Admin</option>
                        <option value="owner">Owner</option>
                        <option value="student">Student</option>
                    </select>
                </td>
            </tr>

            <tr>
                <td colspan="2">
                    <input type="submit" name="action" value="Create">
                </td>
            </tr>

        </table>
    </form>

</body>
</html>
