import paymentProject.*;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/OrderHistoryServlet1")
public class OrderHistoryServlet1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public OrderHistoryServlet1() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Retrieve CustID from the session
		HttpSession session = request.getSession(false); // Ensure we have an existing session
		if (session == null) {
			response.sendRedirect("signin.jsp?error=Please log in first");
			return;
		}

		Integer custId = (Integer) session.getAttribute("CustID");
		if (custId == null) {
			response.sendRedirect("signin.jsp?error=Session expired");
			return;
		}

		String jdbcUrl = "jdbc:mysql://localhost:3306/finalproject2";
		String jdbcUser = "root";
		String jdbcPassword = "root";

		try (Connection con = DriverManager.getConnection(jdbcUrl, jdbcUser, jdbcPassword)) {
			OrderHistoryDao orderHistoryDao = new OrderHistoryDao(con);
			List<Order> orders = orderHistoryDao.getOrdersByCustomerId(custId);

			session.setAttribute("OrderHistory", orders);
			RequestDispatcher dispatcher = request.getRequestDispatcher("OrderHistory.jsp");
			dispatcher.forward(request, response);

		} catch (SQLException e) {
			e.printStackTrace();
			// Optionally log the error or handle it as needed
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error occurred.");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}