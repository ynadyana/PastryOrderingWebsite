package paymentProject;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name="ReceiptServlet1", urlPatterns="/receipt-get")
public class ReceiptServlet1 extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
        	// Initialize DAO
            OrderDao1 order = null;
			try {
				order = new OrderDao1(DbCon.getConnection());
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

            // Get the last order ID
            int orderId = order.getLastOrderId();
            if (orderId == -1) {
                // Handle the case where no order ID was found
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Order ID not found.");
                return;
            }

            // Retrieve necessary data from DAO
            paymentDao paymentDao = new paymentDao();
            List<OrderProduct> cartDetails = paymentDao.getCartDetailsByOrderId(orderId);
            double totalAmount = paymentDao.totalAmount(orderId);
            Receipt receipt = paymentDao.getReceiptByOrderId(orderId);

            // Set attributes for receipt.jsp
            request.setAttribute("orderId", orderId); 
            request.setAttribute("cartDetails", cartDetails);
            request.setAttribute("totalAmount", totalAmount);
            request.setAttribute("paymentMethod", receipt.getPaymentMethod());
            request.setAttribute("deliveryType", receipt.getDeliveryType());

            // Forward to getReceipt.jsp to display the receipt
            RequestDispatcher dispatcher = request.getRequestDispatcher("GetReceipt.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error: " + e.getMessage());
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
