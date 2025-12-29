<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="paymentProject.*"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Receipt</title>
    <link rel="stylesheet" href="css/style.css"> 
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #fff6e5; 
            color: #000; 
            padding: 20px;
            max-width: 800px; 
            margin: auto; 
            border: 1px solid #ddd; 
            border-radius: 5px; 
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); 
        }
        h2 {
            color: #fff;
            background-color: #833517;
            padding: 10px;
            border-radius: 5px;
            text-align: center;
        }
        h3 {
            color: #000;
            text-align: center;
        }
        p {
            font-size: 16px;
            margin: 5px 0;
            color: #000;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            margin-left: auto;
            margin-right: auto;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 10px;
            text-align: left;
            color: #000;
        }
        th {
            background-color: #833517; 
            color: #fff; 
        }
        .order-summary {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <h2>Receipt for Order ID ${orderId}</h2>
    <div class="order-summary">
        <p><strong>Date:</strong> ${receiptDate}</p>
        <p><strong>Total Amount:</strong> RM${totalAmount}</p>
        <p><strong>Payment Method:</strong> ${paymentMethod}</p>
        <p><strong>Delivery Type:</strong> ${deliveryType}</p>
    </div>
    <br>
    
    <h3>Order Items</h3>
    <table>
    <tr>
        <th>Item</th>
        <th>Quantity</th>
        <th>Price</th>
    </tr>
    <% 
        List<OrderProduct> cartDetails = (List<OrderProduct>) request.getAttribute("cartDetails");
        for (OrderProduct item : cartDetails) { 
    %>
        <tr>
            <td><%= item.getProductName() %></td>
            <td><%= item.getProductQuantity() %></td>
            <td>RM<%= item.getProductPrice() %></td>
        </tr>
    <% } %>
</table>
    <form action="index.jsp" method="get">
        <input type="submit" value="Back to Homepage">
    </form>
</body>
</html>
