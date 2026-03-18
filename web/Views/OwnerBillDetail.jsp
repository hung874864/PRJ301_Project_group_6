<%-- 
    Document   : OwnerBillDetail
    Created on : Mar 17, 2026, 8:06:14 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <a href="Owner?action=dashboard">go back</a>
        <h1>Owner Bill Detail room: ${bill.roomID}</h1>

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
