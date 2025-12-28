package RegisterModel;

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
import java.sql.PreparedStatement;


public class NewPassword1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public NewPassword1() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String newPassword = request.getParameter("password");
		String confPassword = request.getParameter("confPassword");
		RequestDispatcher dispatcher = null;
		
		if (newPassword != null && confPassword != null && newPassword.equals(confPassword)) {

			try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/finalproject2?useSSL=false", "root",
						"root");
				PreparedStatement pst = con.prepareStatement("update customer set Pass = ? where CustEmail = ? ");
				pst.setString(1, newPassword);
				pst.setString(2, (String) session.getAttribute("email"));

				int rowCount = pst.executeUpdate();
				if (rowCount > 0) {
					request.setAttribute("status", "resetSuccess");
					dispatcher = request.getRequestDispatcher("successNewPass.jsp");
				} else {
					request.setAttribute("status", "resetFailed");
					dispatcher = request.getRequestDispatcher("failedNewPass.jsp");
				}
				dispatcher.forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

}
