<%-- 
    Document    : OwnerBillDetail
    Created on : Mar 17, 2026, 8:06:14 PM
    Author      : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bill Detail - Owner</title>
        <style>
            /* Import font chữ hiện đại */
            @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap');

            body {
                font-family: 'Inter', 'Segoe UI', sans-serif;
                background-color: #f3f4f6; /* Nền xám nhạt */
                color: #1f2937;
                margin: 0;
                padding: 50px 20px;
                display: flex;
                flex-direction: column;
                align-items: center;
            }

            /* Tiêu đề */
            h1 {
                color: #2c3e50; /* Slate */
                font-size: 24px;
                margin-bottom: 30px;
                text-align: center;
            }

            /* Nút Quay lại */
            a[href*="dashboard"] {
                text-decoration: none;
                background-color: #ffffff;
                color: #3b82f6; /* Blue */
                padding: 10px 20px;
                border-radius: 8px;
                font-weight: 600;
                font-size: 14px;
                border: 1px solid #3b82f6;
                transition: 0.2s;
                margin-bottom: 20px;
                align-self: center;
            }

            a[href*="dashboard"]:hover {
                background-color: #3b82f6;
                color: white;
            }

            /* Bảng chi tiết (Card) */
            table {
                width: 100%;
                max-width: 500px;
                background-color: white;
                border-collapse: collapse;
                border-radius: 12px;
                overflow: hidden;
                box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1);
                border: none !important; /* Ghi đè border="1" */
            }

            td {
                padding: 16px 20px;
                border-bottom: 1px solid #f3f4f6;
                font-size: 15px;
            }

            /* Cột nhãn bên trái */
            tr td:first-child {
                background-color: #f9fafb;
                color: #6b7280;
                font-weight: 600;
                width: 40%;
            }

            /* Cột dữ liệu bên phải */
            tr td:last-child {
                color: #111827;
                font-weight: 500;
                text-align: right;
            }

            /* Dòng cuối (Total) - Làm nổi bật số tiền */
            tr:last-child td:last-child {
                color: #ef4444; /* Màu đỏ cho tổng tiền */
                font-size: 18px;
                font-weight: 700;
            }

            /* Xóa viền dòng cuối cùng */
            tr:last-child td {
                border-bottom: none;
            }
        </style>
    </head>
    <body>
        <a href="Owner?action=dashboard">Go back</a>
        <h1>Owner Bill Detail Room: ${bill.roomID}</h1>

        <table border="1">
            <tr>
                <td>Bill ID</td>
                <td>${bill.billID}</td>
            </tr>
            <tr>
                <td>Room ID</td>
                <td>${bill.roomID}</td>
            </tr>
            <tr>
                <td>Month</td>
                <td>${bill.month}</td>
            </tr>
            <tr>
                <td>Year</td>
                <td>${bill.year}</td>
            </tr>
            <tr>
                <td>Electricity</td>
                <td>${bill.electricity}</td>
            </tr>
            <tr>
                <td>Water</td>
                <td>${bill.water}</td>
            </tr>
            <tr>
                <td>Total</td>
                <td>${bill.total}</td>
            </tr>
        </table>
    </body>
</html>