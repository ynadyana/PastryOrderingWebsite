package paymentProject;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

import RegisterModel.UserBean;

public class PaymentControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public PaymentControl() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		try {
				
		HttpSession session=request.getSession();
		int orderId=(int)session.getAttribute("orderId");
		
		String deliveryType=request.getParameter("deliveryType");
		
		delivery beanDelivery=new delivery();
		Receipt beanReceipt=new Receipt();
		
		paymentDao up=new paymentDao();
		
		
		boolean success=false,success2=false;
		if (deliveryType.equalsIgnoreCase("standard")) {
			
	        // Retrieve other delivery details from request parameters
	        String name = request.getParameter("name");
	        String address = request.getParameter("address");
	        String city = request.getParameter("city");
	        String postalCode = request.getParameter("postalCode");
	        
	        
	        beanDelivery.setName(name);
	        beanDelivery.setAddress(address);
	        beanDelivery.setCity(city);
	        beanDelivery.setPostalCode(postalCode);
	        
	        // Insert delivery data into the database
	        success = up.insertDeliveryData(beanDelivery,orderId);
	     }else {
	    	 String pickupTime=request.getParameter("pickupTime");
	    	 String pickupDate=request.getParameter("pickupDate");
	    	 
	    	 success2=up.insertPickupData(pickupTime, pickupDate);
	     }
		
		String paymentType=request.getParameter("paymentType");
		String totalPaymentStr = request.getParameter("totalPayment");

        // Debugging statement
        System.out.println("Received totalPayment: " + totalPaymentStr);

        // Remove "RM " prefix and convert to double
        double totalPayment = 0.0;
        if (totalPaymentStr != null && totalPaymentStr.startsWith("RM ")) {
            try {
                totalPayment = Double.parseDouble(totalPaymentStr.substring(3));
            } catch (NumberFormatException e) {
                System.err.println("Error parsing totalPayment: " + e.getMessage());
            }
        }
        
		
		if(paymentType.equalsIgnoreCase("onlineBanking")) {
			int bank=Integer.parseInt(request.getParameter("bank"));
			if((bank==1 && success==true)|| (bank==1 && success2==true)) {
				RequestDispatcher rd=request.getRequestDispatcher("bsn.jsp");
				rd.forward(request, response);
			}
			
			else {
				RequestDispatcher rd=request.getRequestDispatcher("maybank.jsp");
				rd.forward(request, response);
			}
			
			String receiptDate=request.getParameter("paymentDate");
			String receiptTime=request.getParameter("paymentTime");
			String paymentMethod=request.getParameter("paymentType");
			String delivery=request.getParameter("deliveryType");
			
			beanReceipt.setOrderID(orderId);
			beanReceipt.setReceiptDate(receiptDate);
			beanReceipt.setReceiptTime(receiptTime);
			beanReceipt.setPaymentMethod(paymentMethod);
			beanReceipt.setDeliveryType(delivery);
			beanReceipt.setTotalPayment(totalPayment);
		
			
			boolean success3= false;
			success3=up.insertReceipt(beanReceipt);
			if(success3) {
				RequestDispatcher rd=request.getRequestDispatcher("/receipt-new");
				rd.forward(request, response);
			}
			
		}else {
			
			String receiptDate=request.getParameter("paymentDate");
			String receiptTime=request.getParameter("paymentTime");
			String paymentMethod=request.getParameter("paymentType");
			String delivery=request.getParameter("deliveryType");
			
			beanReceipt.setOrderID(orderId);
			beanReceipt.setReceiptDate(receiptDate);
			beanReceipt.setReceiptTime(receiptTime);
			beanReceipt.setPaymentMethod(paymentMethod);
			beanReceipt.setDeliveryType(delivery);
			beanReceipt.setTotalPayment(totalPayment);
			
			boolean success4= false;
			success4=up.insertReceipt(beanReceipt);
			
			if(success4) {
				RequestDispatcher rd=request.getRequestDispatcher("/receipt-new");
				rd.forward(request, response);
			}

		}
		
	        
	        
		}catch(Throwable theException) {System.out.println(theException);}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
