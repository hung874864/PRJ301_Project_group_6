<%-- 
    Document    : Home
    Created on : Mar 15, 2026, 3:28:15 PM
    Author      : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Dorm Management</title>
        <style>
            /* Thiết lập chung */
            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background-color: #f4f7f6;
                color: #333;
                margin: 0;
                padding: 20px;
                display: flex;
                flex-direction: column;
                align-items: center;
            }

            .container {
                width: 90%;
                max-width: 1000px;
                background: #fff;
                padding: 30px;
                border-radius: 12px;
                box-shadow: 0 10px 25px rgba(0,0,0,0.1);
            }

            h1 {
                color: #2c3e50;
                margin-bottom: 10px;
                font-weight: 600;
            }

            h1:nth-of-type(2) {
                font-size: 1.5rem;
                color: #34495e;
                border-left: 5px solid #3498db;
                padding-left: 15px;
                margin-top: 20px;
            }

            /* Menu điều hướng */
            .nav-links {
                margin: 20px 0;
                display: flex;
                gap: 15px;
            }

            .nav-links a {
                text-decoration: none;
                color: white;
                background-color: #3498db;
                padding: 10px 20px;
                border-radius: 6px;
                transition: background 0.3s ease;
                font-weight: 500;
            }

            .nav-links a:hover {
                background-color: #2980b9;
            }

            .nav-links a:last-child {
                background-color: #95a5a6;
            }

            .nav-links a:last-child:hover {
                background-color: #7f8c8d;
            }

            /* Bảng dữ liệu */
            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
                overflow: hidden;
                border-radius: 8px;
            }

            th {
                background-color: #34495e;
                color: white;
                text-align: left;
                padding: 15px;
                text-transform: uppercase;
                font-size: 0.9rem;
                letter-spacing: 0.5px;
            }

            td {
                padding: 15px;
                border-bottom: 1px solid #eee;
            }

            tr:last-child td {
                border-bottom: none;
            }

            tr:hover {
                background-color: #f9f9f9;
            }

            /* Trạng thái công suất */
            .capacity-badge {
                display: inline-block;
                padding: 4px 10px;
                background: #e8f4fd;
                color: #2980b9;
                border-radius: 20px;
                font-size: 0.85rem;
                font-weight: bold;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>Home: Student Dorm Management</h1>
            
            <div class="nav-links">
                <a href='Views/Login.jsp'>Login</a>
                <a href='Views/Register.jsp'>Register</a>
            </div>

            <h1>Available rooms</h1>

            <table>
                <thead>
                    <tr>
                        <th>Room Name</th>
                        <th>Price</th>
                        <th>Capacity</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${rooms}" var="r">
                        <c:if test="${r.status < r.maxStudents}">
                            <tr>
                                <td><strong>${r.roomName}</strong></td>
                                <td style="color: #27ae60; font-weight: bold;">$${r.price}</td>
                                <td>
                                    <span class="capacity-badge">
                                        ${r.status} / ${r.maxStudents}
                                    </span>
                                </td>
                            </tr>
                        </c:if>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </body>
</html>