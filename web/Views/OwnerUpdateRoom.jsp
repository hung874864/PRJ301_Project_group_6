<%-- 
    Document    : OwnerUpdateRoom
    Created on : Mar 18, 2026, 7:11:21 PM
    Author      : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Room - Owner</title>
        <style>
            /* Import font chữ hiện đại */
            @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap');

            body {
                font-family: 'Inter', 'Segoe UI', sans-serif;
                background-color: #f3f4f6;
                margin: 0;
                padding: 40px 20px;
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                min-height: 100vh;
            }

            /* Tiêu đề */
            h1 {
                color: #1f2937;
                font-size: 26px;
                margin-bottom: 25px;
                font-weight: 600;
                text-align: center;
            }

            /* Nút Quay lại */
            a[href*="dashboard"] {
                text-decoration: none;
                color: #3b82f6;
                font-weight: 600;
                font-size: 14px;
                margin-bottom: 15px;
                display: inline-block;
                transition: 0.2s;
            }

            a[href*="dashboard"]:hover {
                text-decoration: underline;
                color: #2563eb;
            }

            /* Khung Form (Card) */
            form {
                background: #ffffff;
                padding: 35px;
                border-radius: 12px;
                box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
                width: 100%;
                max-width: 400px;
                box-sizing: border-box;
            }

            /* Biến Table thành Form dọc */
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

            /* Style cho nhãn (Label) */
            td:first-child:not([colspan="2"]) {
                margin-bottom: 8px;
                font-size: 14px;
                font-weight: 500;
                color: #4b5563;
            }

            /* Style cho các ô nhập liệu */
            input[type="text"] {
                width: 100%;
                padding: 12px 14px;
                border: 1px solid #d1d5db;
                border-radius: 8px;
                font-size: 14px;
                color: #1f2937;
                background-color: #f9fafb;
                box-sizing: border-box;
                transition: all 0.2s ease;
            }

            /* Hiệu ứng focus cho các ô được phép sửa */
            input[type="text"]:not([readonly]):focus {
                outline: none;
                border-color: #3b82f6;
                background-color: #ffffff;
                box-shadow: 0 0 0 4px rgba(59, 130, 246, 0.15);
            }

            /* Style riêng cho ô Readonly (Room ID) */
            input[readonly] {
                background-color: #e5e7eb;
                color: #6b7280;
                cursor: not-allowed;
                border-color: #d1d5db;
            }

            /* Nút bấm Update */
            input[type="submit"] {
                width: 100%;
                padding: 14px;
                background-color: #f59e0b; /* Màu vàng cam đặc trưng cho Update */
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
                background-color: #d97706;
            }

            /* Dòng hiển thị lỗi */
            tr:last-child td {
                color: #ef4444;
                font-size: 14px;
                font-weight: 500;
                text-align: center;
                margin-top: 10px;
            }
        </style>
    </head>
    <body>
        <a href="${pageContext.request.contextPath}/Owner?action=dashboard">← Go back</a>
        <h1>Owner Update Room at ID: ${r.roomID}</h1>
        
        <form action="${pageContext.request.contextPath}/Owner" method="post">
            <table>
                <tr>
                    <td>Room ID: </td>
                    <td><input type="text" name="roomID" value="${r.roomID}" readonly></td>
                </tr>
                <tr>
                    <td>Room Name: </td>
                    <td><input type="text" name="roomName" value="${r.roomName}"></td>
                </tr>
                <tr>
                    <td>Room Price: </td>
                    <td><input type="text" name="roomPrice" value="${r.price}"></td>
                </tr>
                <tr>
                    <td><input type="submit" name="action" value="Update"></td>
                </tr>
                <tr>
                    <td>${error}</td>
                </tr>
            </table>
        </form>
    </body>
</html>