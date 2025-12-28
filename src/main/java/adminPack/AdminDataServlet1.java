package adminPack;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet(name="AdminDataServlet1", urlPatterns="/get-admin-data")
public class AdminDataServlet1 extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AdminDataServlet1() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String jdbcURL = "jdbc:mysql://localhost:3306/finalproject2";
        String jdbcUsername = "root";
        String jdbcPassword = "root";

        Connection connection = null;
        PreparedStatement psTotalSales = null;
        PreparedStatement psTotalOrders = null;
        ResultSet rsTotalSales = null;
        ResultSet rsTotalOrders = null;

        double totalSales = 0.0;
        int totalOrders = 0;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

            // Get total sales
            String sqlTotalSales = "SELECT SUM(TotalPayment) AS totalSales FROM finalproject2.receipt";
            psTotalSales = connection.prepareStatement(sqlTotalSales);
            rsTotalSales = psTotalSales.executeQuery();
            if (rsTotalSales.next()) {
                totalSales = rsTotalSales.getDouble("totalSales");
            }

            // Get total orders
            String sqlTotalOrders = "SELECT COUNT(ReceiptID) AS totalOrders FROM finalproject2.receipt";
            psTotalOrders = connection.prepareStatement(sqlTotalOrders);
            rsTotalOrders = psTotalOrders.executeQuery();
            if (rsTotalOrders.next()) {
                totalOrders = rsTotalOrders.getInt("totalOrders");
            }

            // Log the values for debugging
            System.out.println("Total Sales: " + totalSales);
            System.out.println("Total Orders: " + totalOrders);

            request.setAttribute("totalSales", totalSales);
            request.setAttribute("totalOrders", totalOrders);
            request.getRequestDispatcher("AdminHomepage.jsp").forward(request, response);

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            throw new ServletException("Database error");
        } finally {
            try {
                if (rsTotalSales != null) rsTotalSales.close();
                if (psTotalSales != null) psTotalSales.close();
                if (rsTotalOrders != null) rsTotalOrders.close();
                if (psTotalOrders != null) psTotalOrders.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
