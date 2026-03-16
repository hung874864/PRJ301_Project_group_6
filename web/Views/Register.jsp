<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register</title>
</head>
<body>

<h1>Student Register</h1>

<form action="Register" method="post">

    <table>

        <tr>
            <td>Username:</td>
            <td><input type="text" name="username" required></td>
        </tr>

        <tr>
            <td>Password:</td>
            <td><input type="password" name="password" required></td>
        </tr>

        <tr>
            <td>Full Name:</td>
            <td><input type="text" name="fullName" required></td>
        </tr>

        <tr>
            <td>Birth Date:</td>
            <td><input type="date" name="birthDate" required></td>
        </tr>

        <tr>
            <td>Gender:</td>
            <td>
                <input name="gender" type="radio" value="Male">Male | <input name="gender" type="radio" value="Female"> Female
            </td>
        </tr>

        <tr>
            <td>Phone:</td>
            <td><input type="text" name="phone" required></td>
        </tr>

        <tr>
            <td></td>
            <td>
                <input type="submit" value="Register">
            </td>
        </tr>

    </table>

</form>

<p style="color:red">${error}</p>

</body>
</html>