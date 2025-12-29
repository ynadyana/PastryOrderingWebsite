<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin View Order</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #F0F0F0;
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
        }

        nav ul li a:hover {
            text-decoration: underline;
        }

        main {
            padding: 40px 20px;
            max-width: 1000px;
            margin: 0 auto;
        }

        section {
            margin-bottom: 40px;
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
        }
        
        .back-link {
            display: inline-block;
            margin-top: 20px;
            color: #8B4513;
            text-decoration: none;
            font-weight: bold;
            border: 2px solid #8B4513;
            padding: 10px 20px;
            border-radius: 5px;
            transition: background-color 0.3s, color 0.3s;
        }

        .back-link:hover {
            background-color: #8B4513;
            color: white;
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

    <section id="orders">
        <h2>Customer Orders</h2>
        <table>
            <thead>
                <tr>
                    <th>Receipt ID</th>
                    <th>Order ID</th>
                    <th>Date</th>
                    <th>Time</th>
                    <th>Payment method</th>
                    <th>Total Price</th>
                    
                </tr>
            </thead>
            <tbody>
                <!-- Retrieve and display orders from database -->
                <%@ page import="java.sql.*" %>
                <%@ page import="java.util.*" %>
                <%@ page import="javax.sql.DataSource, javax.naming.InitialContext" %>
                
                <% 
                Connection conn = null;
                Statement stmt = null;
                ResultSet rs = null;
                
                try {
                    // Load MySQL JDBC driver
                    Class.forName("com.mysql.jdbc.Driver");
                    
                    // Connect to database (replace with your database credentials)
                    String dbURL = "jdbc:mysql://localhost:3306/finalproject2";
                    String dbUsername = "root";
                    String dbPassword = "root";
                    
                    conn = DriverManager.getConnection(dbURL, dbUsername, dbPassword);
                    
                    // Query to retrieve orders
                    String query = "SELECT * FROM receipt ORDER BY ReceiptDate DESC";
                    stmt = conn.createStatement();
                    rs = stmt.executeQuery(query);
                    
                    // Display orders in table rows
                    while (rs.next()) {
                %>
                    <tr>
                        <td><%= rs.getInt("ReceiptID") %></td>
                         <td><%= rs.getInt("OrderID") %></td>
                        <td><%= rs.getString("ReceiptDate") %></td>
                        <td><%= rs.getString("ReceiptTime") %></td>
                        <td><%= rs.getString("PaymentMethod") %></td>
                        <td><%= rs.getDouble("TotalPayment") %></td>
                       
                    </tr>
                <% 
                
                    }
                } catch (SQLException ex) {
                    ex.printStackTrace();
                } catch (ClassNotFoundException ex) {
                    ex.printStackTrace();
                } finally {
                    // Close resources
                    try {
                        if (rs != null) rs.close();
                        if (stmt != null) stmt.close();
                        if (conn != null) conn.close();
                    } catch (SQLException ex) {
                        ex.printStackTrace();
                    }
                }
                %>
            </tbody>
        </table>
         <a class="back-link" href="/LyssaaLiciouss/get-admin-data">Back to Homepage</a>
    </section>
</main>

</body>
</html>
