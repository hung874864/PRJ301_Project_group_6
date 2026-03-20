<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>

    <style>
        /* ===== GLOBAL ===== */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f7f6;
            margin: 0;
            padding: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        /* ===== CONTAINER ===== */
        .container {
            width: 100%;
            max-width: 400px;
            background: #fff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
        }

        h1 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 25px;
        }

        /* ===== FORM ===== */
        .form-group {
            margin-bottom: 18px;
        }

        label {
            display: block;
            margin-bottom: 6px;
            font-weight: 500;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 6px;
            box-sizing: border-box;
            outline: none;
            transition: 0.3s;
        }

        input:focus {
            border-color: #3498db;
            box-shadow: 0 0 5px rgba(52,152,219,0.3);
        }

        /* ===== BUTTON ===== */
        input[type="submit"] {
            width: 100%;
            padding: 12px;
            background-color: #3498db;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 15px;
            font-weight: 500;
            cursor: pointer;
            transition: 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #2980b9;
        }

        /* ===== ERROR ===== */
        .error {
            color: #e74c3c;
            text-align: center;
            margin-top: 10px;
            font-size: 14px;
            min-height: 1.2em;
        }

        /* ===== LINK ===== */
        .register-link {
            text-align: center;
            margin-top: 18px;
        }

        .register-link a {
            text-decoration: none;
            color: #3498db;
            font-weight: 500;
        }

        .register-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>

<body>

<div class="container">
    <h1>Login</h1>

    <form action="${pageContext.request.contextPath}/Login" method="post">

        <div class="form-group">
            <label>Username:</label>
            <input type="text" name="username" required>
        </div>

        <div class="form-group">
            <label>Password:</label>
            <input type="password" name="password" required>
        </div>

        <input type="submit" value="Login">

    </form>

    <%-- Hiển thị lỗi --%>
    <p class="error">${error}</p>

    <div class="register-link">
        Don't have an account?
        <%-- CHỖ NÀY LÀ QUAN TRỌNG NHẤT: Dùng path tuyệt đối để fix lỗi 404 --%>
        <a href="${pageContext.request.contextPath}/Views/Register.jsp">Register here</a>
    </div>
</div>

</body>
</html>