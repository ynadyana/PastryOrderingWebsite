package paymentProject;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ControllerContactUs")
public class ControllerContactUs extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ControllerContactUs() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		try {
			contactUsBean bean=new contactUsBean();
			
			updateC up=new updateC();
			
			String name=request.getParameter("Name");
			String email=request.getParameter("Email");
			String phoneNum=request.getParameter("Phone Number");
			String message=request.getParameter("message");
			
			bean.setName(name);
			bean.setEmail(email);
			bean.setPhoneNum(phoneNum);
			bean.setMessage(message);
			
			boolean status=up.insertNew(bean);
			
			if(status) {
				request.setAttribute("bean", bean);
				RequestDispatcher rd=request.getRequestDispatcher("index.html");
				rd.forward(request, response);
			}
	
		}catch(Throwable theException) {System.out.println(theException);}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
