<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            /* Import font chữ hiện đại */
            @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap');

            /* Thiết lập chung cho Dashboard */
            body {
                font-family: 'Inter', 'Segoe UI', Tahoma, sans-serif;
                background-color: #f3f4f6; /* Nền xám nhạt */
                color: #1f2937;
                padding: 40px;
                max-width: 1100px;
                margin: 0 auto; /* Căn giữa toàn bộ nội dung */
                position: relative; /* Dùng để định vị nút Logout */
            }

            /* Tiêu đề H1 */
            h1 {
                text-align: center;
                color: #2c3e50; /* Slate */
                text-transform: uppercase;
                font-size: 28px;
                letter-spacing: 1px;
                margin-bottom: 40px;
            }

            /* Gạch chân dưới tiêu đề cho đẹp */
            h1::after {
                content: '';
                display: block;
                width: 80px;
                height: 4px;
                background: #3b82f6; /* Blue */
                margin: 10px auto 0;
                border-radius: 2px;
            }

            /* Nút Log Out (Định vị ở góc trên bên phải) */
            a[href="Logout"] {
                position: absolute;
                top: 30px;
                right: 40px;
                background-color: #ef4444; /* Màu đỏ */
                color: white;
                padding: 10px 18px;
                border-radius: 6px;
                text-decoration: none;
                font-weight: 600;
                font-size: 14px;
                transition: background-color 0.2s;
                box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            }

            a[href="Logout"]:hover {
                background-color: #dc2626;
            }

            /* Nút Create Account */
            a[href="Views/AdminCreateAccount.jsp"] {
                display: inline-block;
                background-color: #10b981; /* Màu xanh lá */
                color: white;
                padding: 12px 24px;
                border-radius: 8px;
                text-decoration: none;
                font-weight: 600;
                margin-bottom: 25px;
                transition: background-color 0.2s;
                box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            }

            a[href="Views/AdminCreateAccount.jsp"]:hover {
                background-color: #059669;
            }

            /* Thanh Tìm kiếm (Form) */
            form {
                background: white;
                padding: 20px 25px;
                border-radius: 10px;
                box-shadow: 0 4px 6px -1px rgba(0,0,0,0.05);
                display: flex; /* Dàn ngang các phần tử */
                align-items: center;
                gap: 15px;
                margin-bottom: 35px;
                font-weight: 500;
            }

            form input[type="text"],
            form select {
                padding: 10px 14px;
                border: 1px solid #d1d5db;
                border-radius: 6px;
                font-family: inherit;
                font-size: 14px;
                outline: none;
                transition: 0.2s;
            }

            form input[type="text"]:focus,
            form select:focus {
                border-color: #3b82f6;
                box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.15);
            }

            /* Nút Search */
            form input[type="submit"] {
                background-color: #3b82f6;
                color: white;
                border: none;
                padding: 10px 24px;
                border-radius: 6px;
                font-weight: 600;
                cursor: pointer;
                transition: 0.2s;
            }

            form input[type="submit"]:hover {
                background-color: #2563eb;
            }

            /* Bảng dữ liệu (Table) */
            table {
                width: 100%;
                background: white;
                border-collapse: collapse;
                border-radius: 10px;
                overflow: hidden; /* Cắt góc bo tròn cho bảng */
                box-shadow: 0 4px 6px -1px rgba(0,0,0,0.05);
                border: none !important; /* Ghi đè border="1" */
            }
            
            th, td {
                border: none !important; /* Xóa viền đen mặc định */
            }

            th {
                background-color: #2c3e50;
                color: white;
                padding: 18px 20px;
                text-align: left;
                font-weight: 600;
                font-size: 14px;
                text-transform: uppercase;
                letter-spacing: 0.5px;
            }

            td {
                padding: 16px 20px;
                border-bottom: 1px solid #f3f4f6 !important; /* Viền dưới mỏng */
                color: #374151;
                font-size: 15px;
            }

            /* Xóa viền dưới của dòng cuối cùng */
            tr:last-child td {
                border-bottom: none !important;
            }

            /* Hiệu ứng hover khi di chuột qua dòng */
            tr:hover td {
                background-color: #f9fafb;
            }

            /* Các link Update và Delete trong bảng */
            td a {
                text-decoration: none;
                font-weight: 600;
                transition: 0.2s;
            }

            td a[href*="update"] {
                color: #3b82f6; /* Xanh dương cho Update */
            }

            td a[href*="update"]:hover {
                color: #2563eb;
                text-decoration: underline;
            }
            
            td a[href*="delete"] {
                color: #ef4444; /* Đỏ cho Delete */
                margin-left: 5px;
            }

            td a[href*="delete"]:hover {
                color: #dc2626;
                text-decoration: underline;
            }
        </style>
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