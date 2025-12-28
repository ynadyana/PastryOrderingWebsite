package paymentProject;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import RegisterModel.UserBean;

@WebServlet(name= "PaymentControl1", urlPatterns = "/payment1")
public class PaymentControl1 extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public PaymentControl1() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		try {
		int orderId = Integer.parseInt(request.getParameter("orderId"));	
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
			
			beanReceipt.setReceiptDate(receiptDate);
			beanReceipt.setReceiptTime(receiptTime);
			beanReceipt.setPaymentMethod(paymentMethod);
			beanReceipt.setDeliveryType(delivery);
			
			boolean success3= false;
			success3=up.insertReceipt(beanReceipt);
			if(success3) {
				RequestDispatcher rd=request.getRequestDispatcher("/LyssaaLiciouss/receipt-new");
				rd.forward(request, response);
			}
			
		}else {
			
			String receiptDate=request.getParameter("paymentDate");
			String receiptTime=request.getParameter("paymentTime");
			String paymentMethod=request.getParameter("paymentType");
			String delivery=request.getParameter("deliveryType");
			
			beanReceipt.setReceiptDate(receiptDate);
			beanReceipt.setReceiptTime(receiptTime);
			beanReceipt.setPaymentMethod(paymentMethod);
			beanReceipt.setDeliveryType(delivery);
			
			boolean success4= false;
			success4=up.insertReceipt(beanReceipt);
			
			if(success4) {
				RequestDispatcher rd=request.getRequestDispatcher("/LyssaaLiciouss/receipt-new");
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
