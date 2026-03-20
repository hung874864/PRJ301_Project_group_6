<%-- 
    Document    : OwnerContract
    Created on : Mar 17, 2026, 1:43:19 PM
    Author      : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Owner Contract Management</title>
        <style>
            /* Import font hiện đại */
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

            /* Header Section */
            h1 {
                color: #2c3e50;
                font-size: 26px;
                text-transform: uppercase;
                margin-bottom: 20px;
                border-bottom: 3px solid #3b82f6;
                padding-bottom: 5px;
                text-align: center;
            }

            /* Navigation Links - Biến thẻ <a> thành các nút bấm */
            .nav-links {
                margin-bottom: 30px;
                display: flex;
                gap: 12px;
            }

            .nav-links a {
                text-decoration: none;
                padding: 10px 20px;
                border-radius: 8px;
                font-weight: 600;
                font-size: 14px;
                transition: 0.2s ease;
                box-shadow: 0 2px 4px rgba(0,0,0,0.05);
            }

            /* Màu cho các nút điều hướng */
            a[href*="dashboard"], a[href*="bill"] {
                background-color: #ffffff;
                color: #3b82f6;
                border: 1px solid #3b82f6;
            }

            a[href*="dashboard"]:hover, a[href*="bill"]:hover {
                background-color: #3b82f6;
                color: white;
            }

            a[href="Logout"] {
                background-color: #ef4444;
                color: white;
                border: 1px solid #ef4444;
            }

            a[href="Logout"]:hover {
                background-color: #dc2626;
            }

            /* Search Form */
            form {
                background: white;
                padding: 20px 35px;
                border-radius: 12px;
                box-shadow: 0 4px 6px -1px rgba(0,0,0,0.05);
                display: flex;
                align-items: center;
                gap: 15px;
                margin-bottom: 25px;
            }

            input[type="text"] {
                padding: 12px;
                border: 1px solid #d1d5db;
                border-radius: 8px;
                outline: none;
                width: 200px;
                transition: border-color 0.2s;
            }

            input[type="text"]:focus {
                border-color: #3b82f6;
            }

            input[type="submit"] {
                background-color: #3b82f6;
                color: white;
                border: none;
                padding: 12px 24px;
                border-radius: 8px;
                font-weight: 600;
                cursor: pointer;
                transition: background-color 0.2s;
            }

            input[type="submit"]:hover {
                background-color: #2563eb;
            }

            /* Create Contract Link */
            a[href*="CreateContract"] {
                display: inline-block;
                background-color: #10b981; /* Màu xanh lá */
                color: white;
                text-decoration: none;
                padding: 14px 28px;
                border-radius: 8px;
                font-weight: 600;
                margin-bottom: 30px;
                transition: background 0.2s;
                box-shadow: 0 4px 6px rgba(16, 185, 129, 0.2);
            }

            a[href*="CreateContract"]:hover {
                background-color: #059669;
            }

            /* Table Style - Không viền, hiện đại */
            table {
                width: 100%;
                max-width: 1100px;
                background: white;
                border-collapse: collapse;
                border-radius: 12px;
                overflow: hidden;
                box-shadow: 0 10px 15px -3px rgba(0,0,0,0.05);
                border: none !important;
            }

            th {
                background-color: #2c3e50; /* Slate đậm */
                color: white;
                padding: 18px;
                text-align: left;
                font-size: 14px;
                text-transform: uppercase;
                letter-spacing: 0.05em;
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

            tr:last-child td {
                border-bottom: none;
            }

            /* Style nhãn văn bản trong form */
            .search-label {
                font-weight: 600;
                color: #4b5563;
            }
        </style>
    </head>
    <body>
        <h1>owner contract</h1>
        
        <div class="nav-links">
            <a href="Owner?action=dashboard">Rooms</a>
            <a href="Owner?action=bill">Bills</a>
            <a href="Logout">Log Out</a>
        </div>
        
        <form action="${pageContext.request.contextPath}/Owner" method="post">
            <span class="search-label">Student username:</span> 
            <input type="text" name="contractSearch" value="${contractSearch}">
            <input type="submit" name="action" value="Search Contract">
        </form>
        
        <a href="Views/OwnerCreateContract.jsp">Create Contract</a>
        
        <h1>Contract List</h1>

        <table border="1">
            <thead>
                <tr>
                    <th>Contract ID</th>
                    <th>Student Username</th>
                    <th>Room ID</th>
                    <th>Start Date</th>
                    <th>End Date</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${contracts}" var="c">
                    <tr>
                        <td>${c.contractID}</td>
                        <td>${c.studentUsername}</td>
                        <td>${c.roomID}</td>
                        <td>${c.startDate}</td>
                        <td>${c.endDate}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </body>
</html>