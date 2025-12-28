package RegisterModel;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.RequestDispatcher;

import paymentProject.*;

public class SignInServlet1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public SignInServlet1() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
response.setContentType("text/html");
		
		try 
		{
			
			UserBean bean = new UserBean();
			
			AdminBean ad = new AdminBean();
			
			Update up = new Update();
			
	        String username = request.getParameter("username");
	        String password = request.getParameter("password");
	        
	        boolean status1;
	        boolean status2;
	        
	        
	        if(username.contains("admin"))
	        {
	        	ad.setUsername(username);
	 	        ad.setPassword(password);
	 	        
	 	        status1 = up.checkAdmin(ad);
	 	        status2 = ad.validate();
	 	        
	 	        UserDao udao = new UserDao(DbCon.getConnection());
				AdminBean admin = udao.adminLogin(username, password);
	 	        
	        	if(status1 && status2)
		        {
	        		if (admin != null) 
		        	{
						request.getSession().setAttribute("auth", admin);
						response.sendRedirect("/get-admin-data");
					}
		        }
	        	else
		        {
		        	request.setAttribute("ad",ad);
		        	RequestDispatcher ds = request.getRequestDispatcher("failedSignin.jsp");
		        	ds.forward(request, response);
		        }
	        }
	        else
	        {
	        	bean.setUsername(username);
	 	        bean.setPassword(password);
	 	        
	 	        status1 = up.checkValidation(bean);
		        status2 = bean.validate2();
		        
		        UserDao udao = new UserDao(DbCon.getConnection());
				UserBean user = udao.userLogin(username, password);
	 	        
		        if(status1 && status2)
		        {
		        	if (user != null) 
		        	{
		        		HttpSession session = request.getSession();
						session.setAttribute("auth", user);
						session.setAttribute("CustID", user.getCustID());
						response.sendRedirect("index.jsp");
					}
		        	
		        }
		        else
		        {
		        	request.setAttribute("bean",bean);
		        	RequestDispatcher ds = request.getRequestDispatcher("failedSignin.jsp");
		        	ds.forward(request, response);
		        }
		     
	        }
	    
		}
		
		catch (Exception e) 
		{
            e.printStackTrace();
        }

    
	}

}