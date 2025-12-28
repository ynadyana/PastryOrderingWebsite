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

@WebServlet(name="ReceiptServlet2", urlPatterns="/receipt-new")
public class ReceiptServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ReceiptServlet2() {
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
            
            printCartDetails(cartDetails);

            // Set attributes for receipt.jsp
            request.setAttribute("orderId", orderId); 
            request.setAttribute("cartDetails", cartDetails);
            request.setAttribute("totalAmount", totalAmount);
            request.setAttribute("paymentMethod", receipt.getPaymentMethod());
            request.setAttribute("deliveryType", receipt.getDeliveryType());
            request.setAttribute("receiptDate", receipt.getReceiptDate());
            request.setAttribute("receiptTime", receipt.getReceiptTime());
            
            

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

	public void printCartDetails(List<OrderProduct> cartDetails) {
	    if (cartDetails != null && !cartDetails.isEmpty()) {
	        for (OrderProduct item : cartDetails) {
	            System.out.println("Product Name: " + item.getProductName());
	            System.out.println("Quantity: " + item.getProductQuantity());
	            System.out.println("Price: RM" + item.getProductPrice());
	            System.out.println("--------");
	        }
	    } else {
	        System.out.println("No items in the cart.");
	    }
	}

}
