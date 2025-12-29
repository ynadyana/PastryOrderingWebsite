<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="paymentProject.*"%>
<%

	List<Order> orderHistory = (List<Order>) request.getSession().getAttribute("OrderHistory");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order History</title>
    <link rel="stylesheet" href="path/to/your/css/styles.css">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f2f2f2;
        }
        .container {
            width: 80%;
            margin: 0 auto;
        }
        h2 {
            text-align: center;
            color: #833517;
            margin-top: 20px;
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
            text-align: center;
        }
        th {
            background-color: #833517;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #ddd;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Order History</h2>
       
        <%
            if (orderHistory == null) {
        %>
            <p>No orders found.</p>
        <%
            } else {
        %>
            <table>
                <thead>
                    <tr>
                        <th>Order ID</th>
                        <th>Date</th>
                        <th>Product</th>
                        <th>Quantity</th>
                        <th>Price</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        for (Order order : orderHistory) {
                    %>
                        <tr>
                            <td><%= order.getOrderId() %></td>
                            <td><%= order.getReceiptDate() %></td>
                            <td><%= order.getProductName() %></td>
                            <td><%= order.getQuantity() %></td>
                            <td><%= order.getPrice() %></td>
                        </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        <%
            }
        %>
       <a href="index.jsp" class="back-button" style="
    display: block;
    width: 200px;
    margin: 30px auto;
    padding: 10px 20px;
    text-align: center;
    background-color: #833517;
    color: white;
    text-decoration: none;
    border-radius: 5px;
    font-family: Arial, sans-serif;
    font-size: 16px;
    font-weight: bold;
    transition: background-color 0.3s ease;
	">Back to Homepage</a>
    </div>
     
</body>
</html>