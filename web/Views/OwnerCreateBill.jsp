<%-- 
    Document    : OwnerCreateBill
    Created on : Mar 18, 2026, 10:33:12 PM
    Author      : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Bill - Owner</title>
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
            a[href*="bill"] {
                text-decoration: none;
                color: #3b82f6;
                font-weight: 600;
                font-size: 14px;
                margin-bottom: 15px;
                display: inline-block;
                transition: 0.2s;
            }

            a[href*="bill"]:hover {
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

            /* CHIÊU CSS: Biến Table thành Form dọc hiện đại */
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

            /* Style cho các ô nhập liệu (Input) */
            input[type="number"] {
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

            input[type="number"]:focus {
                outline: none;
                border-color: #3b82f6;
                background-color: #ffffff;
                box-shadow: 0 0 0 4px rgba(59, 130, 246, 0.15);
            }

            /* Nút bấm Create Bill */
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

            /* Tinh chỉnh cột colspan để nút bấm không bị lệch */
            td[colspan="2"] {
                text-align: center;
            }
        </style>
    </head>
    <body>
        <a href="${pageContext.request.contextPath}/Owner?action=bill">← Go back</a>
        <h1>Owner Create Bill</h1>
        
        <form action="${pageContext.request.contextPath}/Owner" method="post">
            <table>
                <tr>
                    <td>Room ID:</td>
                    <td><input type="number" name="roomID" required></td>
                </tr>

                <tr>
                    <td>Month:</td>
                    <td><input type="number" name="month" min="1" max="12" required></td>
                </tr>

                <tr>
                    <td>Year:</td>
                    <td><input type="number" name="year" required></td>
                </tr>

                <tr>
                    <td>Electricity:</td>
                    <td><input type="number" step="0.01" name="electricity" required></td>
                </tr>

                <tr>
                    <td>Water:</td>
                    <td><input type="number" step="0.01" name="water" required></td>
                </tr>

                <tr>
                    <td colspan="2">
                        <input type="submit" name="action" value="Create Bill">
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>