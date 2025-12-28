
package paymentProject;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;


public class updateC {
	public boolean insertNew(contactUsBean bean) throws SQLException{
		boolean status=false;
		try {
			//i.initialize JDBC connection and prepared statement
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/finalproject2","root","root");
			PreparedStatement ps=con.prepareStatement("insert into contact_us values(?,?,?,?)");
			
			//ii.Retrieve each attribute from the object received
			String n=bean.getName();
			String p=bean.getEmail();
			String q=bean.getPhoneNum();
			String r=bean.getMessage();
			
			//iii.Set values to the placeholder in sql statement
			ps.setString(1, n);
			ps.setString(2, p);
			ps.setString(3, q);
			ps.setString(4, r);
			
			//iv.Execute sql statement
			int res=ps.executeUpdate();
			
			//if one record change, that means insert is successful//change insertStatus to true
			if(res==1)
				status=true;
			//v.close connection and statement
			con.close();		
		}
	
	catch(Exception ex){System.out.println(ex);}
	return status;
}
}
