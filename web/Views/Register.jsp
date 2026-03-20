<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register</title>
    <style>
        /* Import font chữ hiện đại */
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap');

        /* Tổng thể trang */
        body {
            font-family: 'Inter', 'Segoe UI', Tahoma, sans-serif;
            background-color: #f3f4f6; /* Màu xám nhạt */
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
            max-width: 420px;
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

        /* Tiêu đề (Label) */
        td:first-child {
            margin-bottom: 8px;
            font-size: 14px;
            font-weight: 500;
            color: #4b5563;
        }

        /* Ẩn cái ô TD trống trơn trước nút Register để nút lấy toàn bộ chiều rộng */
        td:empty {
            display: none;
        }

        /* Ô Nhập liệu (Input) */
        input[type="text"],
        input[type="password"],
        input[type="date"] {
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
        }

        input:focus {
            outline: none;
            border-color: #3b82f6;
            background-color: #ffffff;
            box-shadow: 0 0 0 4px rgba(59, 130, 246, 0.15); /* Quầng sáng xanh */
        }

        /* Tinh chỉnh phần chọn Giới tính */
        td:last-child {
            color: #4b5563;
            font-size: 15px;
        }

        input[type="radio"] {
            accent-color: #3b82f6; /* Nút tick màu xanh */
            transform: scale(1.1);
            margin: 0 6px 0 0;
            cursor: pointer;
        }

        /* Nút Register */
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

        /* Style lại dòng báo lỗi */
        p[style="color:red"] {
            color: #dc2626 !important;
            background-color: #fee2e2;
            padding: 12px 20px;
            border-radius: 8px;
            font-size: 14px;
            font-weight: 500;
            margin-top: 24px;
        }

        /* CSS thông minh: Tự động ẩn thẻ P nếu không có lỗi */
        p:empty {
            display: none;
        }
    </style>
</head>
<body>

<h1>Student Register</h1>

<form action="${pageContext.request.contextPath}/Register" method="post">

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