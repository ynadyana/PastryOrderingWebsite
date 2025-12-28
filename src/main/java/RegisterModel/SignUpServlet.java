package RegisterModel;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.RequestDispatcher;

@WebServlet(name="SignUpServlet", urlPatterns="/sign-up")
public class SignUpServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	
	public SignUpServlet()
	{
		super();
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
	{
		response.setContentType("text/html");
		
		try 
		{
			
			UserBean bean = new UserBean();
			
			Update up = new Update();
			
			String name = request.getParameter("name");
	        String username = request.getParameter("username");
	        String email = request.getParameter("email");
	        String contact = request.getParameter("contact");
	        String password = request.getParameter("pass");
	        
	        bean.setName(name);
	        bean.setUsername(username);
	        bean.setEmail(email);
	        bean.setContact(contact);
	        bean.setPassword(password);
	        
	        boolean status1 = up.insertNew(bean);
	        boolean status2 = bean.validate();
	        
	        if(status1 && status2)
	        {
	        	request.setAttribute("bean",bean);
	        	RequestDispatcher ds = request.getRequestDispatcher("successSignup.jsp");
	        	ds.forward(request, response);
	        }
	        else
	        {
	        	request.setAttribute("bean",bean);
	        	RequestDispatcher ds = request.getRequestDispatcher("failedSignup.jsp");
	        	ds.forward(request, response);
	        }
	    
		}
		
		catch (Exception e) 
		{
            e.printStackTrace();
        }
	}
}
