<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            /* Import font chữ hiện đại */
            @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap');

            /* Tổng thể trang */
            body {
                font-family: 'Inter', 'Segoe UI', Tahoma, sans-serif;
                background-color: #f3f4f6;
                margin: 0;
                min-height: 100vh;
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
            }

            h1 {
                color: #1f2937;
                font-size: 26px;
                margin-bottom: 24px;
                text-align: center;
                font-weight: 600;
            }

            /* Khung Form (Card) */
            form {
                background: #ffffff;
                padding: 40px;
                border-radius: 12px;
                box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
                width: 100%;
                max-width: 400px;
                box-sizing: border-box;
            }

            /* CHIÊU CSS: Biến Table thành Form dọc */
            table, tbody, tr, td {
                display: block;
                width: 100%;
            }

            tr {
                margin-bottom: 18px;
            }

            td {
                padding: 0;
            }

            /* Tiêu đề (Label) - Loại trừ td chứa nút Submit */
            td:first-child:not([colspan="2"]) {
                margin-bottom: 8px;
                font-size: 14px;
                font-weight: 500;
                color: #4b5563;
            }

            /* Ô Nhập liệu & Thẻ Select */
            input[type="text"],
            input[type="password"],
            select {
                width: 100%;
                padding: 12px 14px;
                border: 1px solid #d1d5db;
                border-radius: 8px;
                font-size: 14px;
                color: #1f2937;
                background-color: #f9fafb;
                box-sizing: border-box;
                transition: all 0.2s ease;
                font-family: inherit;
                cursor: pointer;
            }

            /* Fix con trỏ cho input text/password */
            input[type="text"],
            input[type="password"] {
                cursor: text;
            }

            /* Hiệu ứng khi click (Focus) */
            input:focus,
            select:focus {
                outline: none;
                border-color: #3b82f6;
                background-color: #ffffff;
                box-shadow: 0 0 0 4px rgba(59, 130, 246, 0.15);
            }

            /* Nút Create */
            input[type="submit"] {
                width: 100%;
                padding: 14px;
                background-color: #3b82f6;
                color: white;
                border: none;
                border-radius: 8px;
                font-size: 16px;
                font-weight: 600;
                cursor: pointer;
                transition: background-color 0.2s;
                margin-top: 10px;
            }

            input[type="submit"]:hover {
                background-color: #2563eb;
            }
        </style>
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