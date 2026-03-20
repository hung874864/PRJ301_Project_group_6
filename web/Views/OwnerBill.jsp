<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Owner Bill Management</title>
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
            }

            /* Navigation Links */
            .nav-links {
                margin-bottom: 30px;
                display: flex;
                gap: 10px;
            }

            .nav-links a {
                text-decoration: none;
                padding: 8px 16px;
                border-radius: 6px;
                font-weight: 600;
                font-size: 14px;
                transition: 0.2s;
            }

            a[href*="dashboard"], a[href*="contract"] {
                background-color: #ffffff;
                color: #3b82f6;
                border: 1px solid #3b82f6;
            }

            a[href*="dashboard"]:hover, a[href*="contract"]:hover {
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

            /* Search Form */
            form {
                background: white;
                padding: 20px 30px;
                border-radius: 12px;
                box-shadow: 0 4px 6px rgba(0,0,0,0.05);
                display: flex;
                align-items: center;
                gap: 15px;
                margin-bottom: 20px;
            }

            input[type="text"] {
                padding: 10px;
                border: 1px solid #d1d5db;
                border-radius: 6px;
                outline: none;
            }

            input[type="submit"] {
                background-color: #3b82f6;
                color: white;
                border: none;
                padding: 10px 20px;
                border-radius: 6px;
                font-weight: 600;
                cursor: pointer;
            }

            /* Create Bill Link */
            a[href*="CreateBill"] {
                display: inline-block;
                background-color: #10b981;
                color: white;
                text-decoration: none;
                padding: 12px 24px;
                border-radius: 8px;
                font-weight: 600;
                margin: 20px 0;
            }

            /* Table Style */
            table {
                width: 100%;
                max-width: 1000px;
                background: white;
                border-collapse: collapse;
                border-radius: 10px;
                overflow: hidden;
                box-shadow: 0 4px 10px rgba(0,0,0,0.05);
                border: none !important;
            }

            th {
                background-color: #2c3e50;
                color: white;
                padding: 15px;
                text-align: left;
                font-size: 14px;
            }

            td {
                padding: 15px;
                border-bottom: 1px solid #f3f4f6;
                font-size: 14px;
            }

            tr:hover td {
                background-color: #f9fafb;
            }

            /* Action Link in Table */
            td a {
                color: #3b82f6;
                text-decoration: none;
                font-weight: 600;
            }

            td a:hover {
                text-decoration: underline;
            }

            /* Error message */
            .error-text {
                color: #ef4444;
                font-weight: 500;
                margin-left: 10px;
            }
        </style>
    </head>
    <body>
        <h1>Owner Bill</h1>
        
        <div class="nav-links">
            <a href="Owner?action=dashboard">Rooms</a>
            <a href="Owner?action=contract">Contracts</a>
            <a href="Logout">Log Out</a>
        </div>

        <form action="${pageContext.request.contextPath}/Owner" method="post">
            Room ID: <input type="text" name="roomSearch" value="${roomSearch}">
            <input type="submit" name="action" value="Search Bill">
            <span class="error-text">${error}</span>
        </form>

        <a href="Views/OwnerCreateBill.jsp">Create Bill</a>
        
        <h1>Bill List</h1>

        <table border="1">
            <thead>
                <tr>
                    <th>Bill ID</th>
                    <th>Room ID</th>
                    <th>Month</th>
                    <th>Year</th>
                    <th>Electricity</th>
                    <th>Water</th>
                    <th>Total</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${bills}" var="bill">
                    <tr>
                        <td>${bill.billID}</td>
                        <td>${bill.roomID}</td>
                        <td>${bill.month}</td>
                        <td>${bill.year}</td>
                        <td>${bill.electricity}</td>
                        <td>${bill.water}</td>
                        <td>${bill.total}</td>
                        <td><a href="Owner?action=billDetail&roomID=${bill.roomID}">Detail</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </body>
</html>