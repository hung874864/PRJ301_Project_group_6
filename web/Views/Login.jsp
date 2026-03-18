<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
</head>
<body>

<h1>Login</h1>

<form action="${pageContext.request.contextPath}/Login" method="post">

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
            <td></td>
            <td>
                <input type="submit" value="Login">
            </td>
        </tr>
    </table>

</form>

<p style="color:red">
    ${error}
</p>

<p>
    Don't have an account? 
    <a href="Register.jsp">Register here</a>
</p>

</body>
</html>