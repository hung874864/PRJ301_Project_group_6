<%-- 
    Document    : OwnerRoomDetail
    Created on : Mar 17, 2026, 4:03:42 PM
    Author      : LENOVO
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Room Detail - Owner</title>
        <style>
            /* Import font chữ hiện đại */
            @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap');

            body {
                font-family: 'Inter', 'Segoe UI', sans-serif;
                background-color: #f3f4f6;
                color: #1f2937;
                margin: 0;
                padding: 40px;
                display: flex;
                flex-direction: column;
                align-items: center;
            }

            /* Tiêu đề */
            h1 {
                color: #2c3e50;
                font-size: 26px;
                margin-bottom: 25px;
                border-bottom: 3px solid #3b82f6;
                padding-bottom: 5px;
            }

            /* Nút Quay lại & Xem Hóa đơn */
            a {
                text-decoration: none;
                padding: 10px 18px;
                border-radius: 8px;
                font-weight: 600;
                font-size: 14px;
                transition: 0.2s;
                display: inline-block;
                margin-bottom: 20px;
            }

            a[href*="dashboard"] {
                background-color: #ffffff;
                color: #3b82f6;
                border: 1px solid #3b82f6;
            }

            a[href*="dashboard"]:hover {
                background-color: #3b82f6;
                color: white;
            }

            a[href*="billDetail"] {
                background-color: #f59e0b; /* Màu vàng cam */
                color: white;
                margin-left: 10px;
            }

            a[href*="billDetail"]:hover {
                background-color: #d97706;
            }

            /* Style chung cho Table */
            table {
                width: 100%;
                max-width: 900px;
                background: white;
                border-collapse: collapse;
                border-radius: 12px;
                overflow: hidden;
                box-shadow: 0 4px 10px rgba(0,0,0,0.05);
                margin-bottom: 30px;
                border: none !important;
            }

            th, td {
                padding: 15px 20px;
                text-align: left;
                border: none !important;
                border-bottom: 1px solid #f3f4f6 !important;
            }

            /* Header bảng */
            th, tr:first-child td {
                background-color: #2c3e50;
                color: white;
                font-weight: 600;
                text-transform: uppercase;
                font-size: 13px;
            }

            /* Style riêng cho bảng danh sách sinh viên */
            table:last-of-type tr:first-child td {
                background-color: #34495e;
            }

            /* Hover dòng */
            tr:hover td {
                background-color: #f9fafb;
            }

            /* Phần caption/header giả cho danh sách sinh viên */
            .section-title {
                align-self: flex-start;
                max-width: 900px;
                width: 100%;
                margin: 0 auto 15px;
                font-weight: 700;
                color: #4b5563;
                font-size: 18px;
            }
        </style>
    </head>
    <body>
        <div style="width: 100%; max-width: 900px;">
            <a href="Owner?action=dashboard">← Go back</a>
            <a href="Owner?action=billDetail&roomID=${room.roomID}">View Bills</a>
        </div>

        <h1>Room ID: ${room.roomID}</h1>
        
        <table border="1">
            <tr>
                <th>Room Name</th>
                <th>Price</th>
                <th>Capacity (Current/Max)</th>
            </tr>
            <tr>
                <td>${room.roomName}</td>
                <td>${room.price} VND</td>
                <td style="font-weight: bold; color: #10b981;">${room.status} / ${room.maxStudents}</td>
            </tr>
        </table>

        <div class="section-title">Current Students in Room</div>
        
        <table border="1">
            <tr>
                <td>Username</td>
                <td>Full Name</td>
                <td>Birth Date</td>
                <td>Gender</td>
                <td>Phone</td>
            </tr>
            <c:forEach items="${students}" var="s">
                <tr>
                    <td>${s.username}</td>
                    <td>${s.fullName}</td>
                    <td>${s.birthDate}</td>
                    <td>${s.gender}</td>
                    <td>${s.phone}</td>
                </tr>
            </c:forEach>
            <c:if test="${empty students}">
                <tr>
                    <td colspan="5" style="text-align: center; color: #9ca3af; padding: 30px;">
                        No students currently assigned to this room.
                    </td>
                </tr>
            </c:if>
        </table>
        
    </body>
</html>