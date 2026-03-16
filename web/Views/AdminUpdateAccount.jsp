<%-- 
    Document   : AdminUpdateAccount
    Created on : Mar 16, 2026, 11:26:25 PM
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
        <h1>admin update account</h1>
        <form action="${pageContext.request.contextPath}/Admin" method="post">
            <table>

                <tr>
                    <td>Username:</td>
                    <td>
                        <input type="text" name="username" value="${acc.username}" readonly>
                    </td>
                </tr>

                <tr>
                    <td>Password:</td>
                    <td>
                        <input type="text" name="password" value="${acc.password}">
                    </td>
                </tr>

                <tr>
                    <td>Role:</td>
                    <td>
                        <select name="role">
                            <option value="admin" ${acc.role.equals("admin") ? "selected" : ""}>Admin</option>
                            <option value="owner" ${acc.role.equals("owner") ? "selected" : ""}>Owner</option>
                            <option value="student" ${acc.role.equals("student") ? "selected" : ""}>Student</option>
                        </select>
                    </td>
                </tr>

                <tr>
                    <td colspan="2">
                        <input type="submit" name="action" value="Update">
                    </td>
                </tr>

            </table>
        </form>
    </body>
</html>
