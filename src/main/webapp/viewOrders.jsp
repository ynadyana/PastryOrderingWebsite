<!-- viewOrders.jsp -->
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Orders</title>
<style>
    body {
        font-family: Arial, sans-serif;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }
    table, th, td {
        border: 1px solid #ddd;
    }
    th, td {
        padding: 8px;
        text-align: left;
    }
    th {
        background-color: #f2f2f2;
    }
</style>
</head>
<body>
    <h1>Customer Orders</h1>
    <table>
        <thead>
            <tr>
                <th>Order ID</th>
                <th>Order Date</th>
                <th>Total Amount</th>
                <th>Status</th>
                <th>Item ID</th>
                <th>Product Name</th>
                <th>Quantity</th>
                <th>Price</th>
            </tr>
        </thead>
        <tbody>
            <%
                ResultSet orders = (ResultSet) request.getAttribute("orders");
                try {
                    while (orders.next()) {
            %>
            <tr>
                <td><%= orders.getInt("orderId") %></td>
                <td><%= orders.getDate("orderDate") %></td>
                <td><%= orders.getBigDecimal("totalAmount") %></td>
                <td><%= orders.getString("status") %></td>
                <td><%= orders.getInt("itemId") %></td>
                <td><%= orders.getString("productName") %></td>
                <td><%= orders.getInt("quantity") %></td>
                <td><%= orders.getBigDecimal("price") %></td>
            </tr>
            <%
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            %>
        </tbody>
    </table>
</body>
</html>
