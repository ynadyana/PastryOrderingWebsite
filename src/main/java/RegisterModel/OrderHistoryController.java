package RegisterModel;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import paymentProject.DbCon;
import paymentProject.Order;
import paymentProject.OrderDao1;
import paymentProject.OrderHistoryDao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name="OrderHistoryController",urlPatterns="/order-history-get")
public class OrderHistoryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderHistoryController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		HttpSession session=request.getSession(false);
        UserBean auth = (UserBean) request.getSession().getAttribute("auth"); 
        System.out.print("disini");
        if (session == null) {
            response.sendRedirect("signin.jsp?error=Please log in first");
            return;
        }

        Integer custId = (Integer) auth.getCustID();
        System.out.print(custId);
        

        try {
        	Class.forName("com.mysql.jdbc.Driver");
        	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/finalproject2?useSSL=false","root","root");
            OrderHistoryDao orderHistoryDao = new OrderHistoryDao(con);
            List<Order> orders = orderHistoryDao.getOrdersByCustomerId(custId);

            request.setAttribute("OrderHistory", orders);
            RequestDispatcher dispatcher = request.getRequestDispatcher("OrderHistory.jsp");
            dispatcher.forward(request, response);

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            // Optionally log the error or handle it as needed
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error occurred.");
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
