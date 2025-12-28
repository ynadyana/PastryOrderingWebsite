package adminPack;

//ViewOrdersServlet.java
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name= "ViewOrdersServlet", urlPatterns="/viewOrder")
public class viewOrdersServlet extends HttpServlet {
 private static final long serialVersionUID = 1L;

 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     try {
         Connection connection = DBConnection.getConnection();
         String sql = "SELECT * FROM finalproject2.orders";
         PreparedStatement statement = connection.prepareStatement(sql);
         ResultSet resultSet = statement.executeQuery();
         
         request.setAttribute("orders", resultSet);
         request.getRequestDispatcher("viewOrders.jsp").forward(request, response);
     } catch (SQLException | ClassNotFoundException e) {
         e.printStackTrace();
     }
 }
}
