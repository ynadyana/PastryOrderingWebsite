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

@WebServlet(name="ReceiptServlet", urlPatterns="/receipt")
public class ReceiptServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ReceiptServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			// Retrieve orderId from session
            HttpSession session = request.getSession();
            int orderId = (int) session.getAttribute("orderId");

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
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
