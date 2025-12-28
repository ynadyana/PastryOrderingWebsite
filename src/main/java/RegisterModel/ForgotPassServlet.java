package RegisterModel;

import java.io.IOException;
import java.util.Properties;
import java.util.Random;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name="ForgotPassServlet", urlPatterns="/forgot-pass")
public class ForgotPassServlet extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException 
	{
		UserBean bean = new UserBean();
		
		String email = request.getParameter("email");
		
		bean.setEmail(email);
		
		RequestDispatcher dispatcher = null;
		
		int otpvalue = 0;
		
		HttpSession mySession = request.getSession();
		
		boolean status1 = bean.validate4();
		
		if(status1) 
		{
			// sending otp
			Random rand = new Random();
			otpvalue = rand.nextInt(1255650);

			String to = email;// change accordingly
			
			// Get the session object
			Properties props = new Properties();
			props.put("mail.smtp.host", "smtp.gmail.com");
			props.put("mail.smtp.socketFactory.port", "465");
			props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.port", "465");
			Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() 
				{
					return new PasswordAuthentication("lolafun56@gmail.com", "erpxhfylthjcspmq");
				}
			});
			
			// compose message
			try {
				MimeMessage message = new MimeMessage(session);
				message.setFrom(new InternetAddress(email));// change accordingly
				message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
				message.setSubject("Hello");
				message.setText("your OTP is: " + otpvalue);
				// send message
				Transport.send(message);
				System.out.println("message sent successfully");
			}

			catch (MessagingException e) 
			{
				throw new RuntimeException(e);
			}
			
			dispatcher = request.getRequestDispatcher("successEmail.jsp");
			request.setAttribute("message","OTP is sent to your email id");
			
			mySession.setAttribute("otp",otpvalue); 
			mySession.setAttribute("email",email); 
			dispatcher.forward(request, response);
			
		}
		
		else 
		{
			request.setAttribute("bean",bean);
        	RequestDispatcher ds = request.getRequestDispatcher("failedEmail.jsp");
        	ds.forward(request, response);
		}
		
	}

}
