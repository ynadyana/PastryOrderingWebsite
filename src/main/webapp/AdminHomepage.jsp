<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Homepage</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #F9F9F9;
        }

        header {
            background-color: #8B4513;
            color: white;
            padding: 20px;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        nav ul {
            list-style: none;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0;
        }

        nav ul li {
            margin: 0 20px;
        }

        nav ul li a {
            color: white;
            text-decoration: none;
            font-weight: bold;
            transition: color 0.3s ease;
        }

        nav ul li a:hover {
            color: #FFD700;
        }

        main {
            padding: 40px 20px;
            max-width: 1200px;
            margin: 0 auto;
        }

        section {
            margin-bottom: 40px;
        }

        .statistics {
            display: flex;
            justify-content: space-between;
            margin-bottom: 40px;
        }

        .stat-card {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            width: 100%;
            text-align: center;
            margin: 0 10px;
        }

        .stat-card h3 {
            margin: 0;
            color: #8B4513;
        }

        .stat-card p {
            font-size: 24px;
            margin: 10px 0 0;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            background-color: white;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 12px 15px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
            font-weight: bold;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .header-container {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 10px;
        }

        .logo-section img {
            max-height: 50px;
        }

        .nav-container {
            display: flex;
            align-items: center;
        }

        .nav-container nav {
            margin-left: 20px;
        }

        h2 {
            color: #333;
            margin-bottom: 20px;
            font-size: 24px;
            text-align: center;
        }

        .view-orders-button {
            background-color: #8B4513;
            color: white;
            padding: 15px 25px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            display: block;
            margin: 0 auto;
        }

        .view-orders-button:hover {
            background-color: #6B3210;
        }

        .view-orders-button:focus {
            outline: none;
        }

        #orders-notification {
            background-color: #FFD700;
            color: black;
            padding: 10px;
            border-radius: 5px;
            margin-bottom: 20px;
            text-align: center;
            font-weight: bold;
            display: none; /* Hide initially */
        }

        footer {
            background-color: #8B4513;
            color: white;
            padding: 10px;
            text-align: center;
            position: fixed;
            width: 100%;
            bottom: 0;
        }
    </style>
    
</head>
<body>
<header>
    <div class="header-container">
        <div class="logo-section">
            <a href="index.html"><img src="images/lyssaalogo.png" alt="Logo"/></a>
        </div>
        <div class="nav-container">
            <nav>
                <ul>
                    <li><a class="logout-link" href="logout.jsp">Logout</a></li>
                </ul>
            </nav>
        </div>
    </div>
    <h1>Admin Dashboard</h1>
</header>

<main>
 <section id="home">
        <h2>Welcome, Admin!</h2>
    </section>

    <section class="statistics">
        <div class="stat-card">
            <h3>Total Sales</h3>
            <p id="total-sales">RM<%= request.getAttribute("totalSales") != null ? request.getAttribute("totalSales") : "0.00" %></p>
        </div>
        <div class="stat-card">
            <h3>Total Orders</h3>
            <p id="total-orders"><%= request.getAttribute("totalOrders") != null ? request.getAttribute("totalOrders") : "0" %></p>
        </div>
    </section>

    <div id="orders-notification"></div> <!-- Notification element -->
    <section>
        <h2>Orders</h2>
        <button class="view-orders-button" onclick="window.location.href='admin.jsp'">View Orders</button>
        
    </section>
</main>

<footer>
    &copy; 2024 Lyssaa Liciousss. All rights reserved.
</footer>

</body>
</html>

