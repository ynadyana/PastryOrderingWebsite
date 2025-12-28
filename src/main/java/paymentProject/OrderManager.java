package paymentProject;

import java.sql.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

public class OrderManager {

    // Method to create a new order
    public static String createNewOrder(HttpServletRequest request) throws SQLException, ClassNotFoundException {
        int orderID = 0;

        try {
            // Database connection
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/finalproject","root","root");

            // Retrieve the last OrderID from the database and increment by 1
            String getLastOrderIDSQL = "SELECT MAX(OrderID) AS LastOrderID FROM `order`"; // Query to get the last OrderID
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(getLastOrderIDSQL);

            if (rs.next()) {
                orderID = rs.getInt("LastOrderID") + 1; // Increment the last OrderID by 1
            } else {
                // Handle case when no orders exist yet (start from 1, for example)
                orderID = 301; // Set initial orderID if no orders exist yet
            }

            // Insert a new order
            String insertOrderSQL = "INSERT INTO `order` (OrderID, TotalPrice) VALUES (?, ?)";
            PreparedStatement pstmt = con.prepareStatement(insertOrderSQL);
            pstmt.setInt(1, orderID); // Set the new OrderID
            pstmt.setDouble(2, 0.00); // Replace with actual order details (TotalPrice)

            pstmt.executeUpdate();

            // Save OrderID to session
            HttpSession session = request.getSession();
            session.setAttribute("OrderID", String.valueOf(orderID));

            // Close resources
            rs.close();
            stmt.close();
            pstmt.close();
            con.close();

        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return String.valueOf(orderID);
    }
}


