<%-- 
    Document    : OwnerDashboard
    Created on : Mar 16, 2026, 10:14:00 PM
    Author      : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Owner Dashboard - Room Management</title>
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

            /* Tiêu đề chính */
            h1 {
                color: #2c3e50;
                font-size: 28px;
                text-transform: uppercase;
                margin-bottom: 30px;
                border-bottom: 3px solid #3b82f6;
                padding-bottom: 8px;
                text-align: center;
                letter-spacing: 1px;
            }

            /* Thanh điều hướng (Navigation) */
            .nav-container {
                display: flex;
                gap: 12px;
                margin-bottom: 25px;
            }

            .nav-container a, a[href*="CreateRoom"] {
                text-decoration: none;
                padding: 10px 20px;
                border-radius: 8px;
                font-weight: 600;
                font-size: 14px;
                transition: 0.2s;
                box-shadow: 0 2px 4px rgba(0,0,0,0.05);
            }

            /* Màu sắc nút điều hướng */
            a[href*="contract"], a[href*="bill"] {
                background-color: #ffffff;
                color: #3b82f6;
                border: 1px solid #3b82f6;
            }

            a[href*="contract"]:hover, a[href*="bill"]:hover {
                background-color: #3b82f6;
                color: white;
            }

            a[href="Logout"] {
                background-color: #ef4444;
                color: white;
            }

            a[href="Logout"]:hover {
                background-color: #dc2626;
            }

            /* Nút Create Room */
            a[href*="CreateRoom"] {
                background-color: #10b981;
                color: white;
                margin-bottom: 20px;
                display: inline-block;
            }

            a[href*="CreateRoom"]:hover {
                background-color: #059669;
            }

            /* Thanh tìm kiếm (Search Bar) */
            form {
                background: white;
                padding: 15px 25px;
                border-radius: 12px;
                box-shadow: 0 4px 6px rgba(0,0,0,0.05);
                display: flex;
                align-items: center;
                gap: 15px;
                margin-bottom: 30px;
                width: 100%;
                max-width: 500px;
            }

            input[type="text"] {
                padding: 10px 14px;
                border: 1px solid #d1d5db;
                border-radius: 8px;
                outline: none;
                flex-grow: 1;
            }

            input[type="submit"] {
                background-color: #3b82f6;
                color: white;
                border: none;
                padding: 10px 20px;
                border-radius: 8px;
                font-weight: 600;
                cursor: pointer;
                transition: 0.2s;
            }

            input[type="submit"]:hover {
                background-color: #2563eb;
            }

            /* Bảng dữ liệu */
            table {
                width: 100%;
                max-width: 1000px;
                background: white;
                border-collapse: collapse;
                border-radius: 12px;
                overflow: hidden;
                box-shadow: 0 10px 15px -3px rgba(0,0,0,0.05);
                border: none !important;
            }

            th {
                background-color: #2c3e50;
                color: white;
                padding: 18px;
                text-align: left;
                font-size: 14px;
                text-transform: uppercase;
            }

            td {
                padding: 16px 18px;
                border-bottom: 1px solid #f3f4f6;
                font-size: 15px;
                color: #374151;
            }

            tr:hover td {
                background-color: #f9fafb;
            }

            /* Nút Action trong bảng */
            td a {
                text-decoration: none;
                font-weight: 600;
                font-size: 13px;
                margin-right: 8px;
                padding: 4px 8px;
                border-radius: 4px;
            }

            a[href*="detail"] { color: #3b82f6; border: 1px solid #3b82f6; }
            a[href*="detail"]:hover { background: #3b82f6; color: white; }

            a[href*="update"] { color: #f59e0b; border: 1px solid #f59e0b; }
            a[href*="update"]:hover { background: #f59e0b; color: white; }

            a[href*="delete"] { color: #ef4444; border: 1px solid #ef4444; }
            a[href*="delete"]:hover { background: #ef4444; color: white; }

            /* Thông báo lỗi */
            .error-msg { color: #ef4444; font-size: 14px; font-weight: 500; }
        </style>
    </head>
    <body>
        <h1>owner dashboard</h1>
        
        <div class="nav-container">
            <a href="Owner?action=contract">Contracts</a>
            <a href="Owner?action=bill">Bills</a>
            <a href="Logout">Log Out</a>
        </div>
        
        <a href="Views/OwnerCreateRoom.jsp">Create Room</a>

        <form action="${pageContext.request.contextPath}/Owner" method="post">
            <span>Room ID:</span> 
            <input type="text" name="roomSearch" value="${roomSearch}">
            <input type="submit" name="action" value="Search">
            <span class="error-msg">${error}</span>
        </form>

        <table border="1">
            <thead>
                <tr>
                    <th>Room Name</th>
                    <th>Price</th>
                    <th>Capacity (Occupied/Max)</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${rooms}" var="r">
                    <tr>
                        <td>${r.roomName}</td>
                        <td>${r.price} VND</td>
                        <td>
                            <span style="font-weight: bold; color: ${r.status >= r.maxStudents ? '#ef4444' : '#10b981'}">
                                ${r.status}
                            </span> / ${r.maxStudents}
                        </td>
                        <td>
                            <a href="Owner?id=${r.roomID}&action=detail">Detail</a>
                            <a href="Owner?id=${r.roomID}&action=update">Update</a>
                            <c:if test="${r.status==0}">
                                <a href="Owner?id=${r.roomID}&action=delete">Delete</a>
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </body>
</html>