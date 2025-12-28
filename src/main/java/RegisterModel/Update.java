package RegisterModel;

import java.sql.Connection;
import java.sql.DriverManager; 
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Update 
{
	public boolean insertNew (UserBean bean) 
			throws SQLException 
	{
		boolean status = false;

		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/finalproject2?useSSL=false","root","root");
	        PreparedStatement ps = con.prepareStatement("insert into customer(CustName, Username, CustEmail, CustPhoneNum, Pass) values(?,?,?,?,?)");
	        
	        String n = bean.getName();
	        String u = bean.getUsername();
	        String e = bean.getEmail();
	        String p = bean.getPassword();
	        String c = bean.getContact();
	        
	        ps.setString(1, n);
	        ps.setString(2, u);
	        ps.setString(3, e);
	        ps.setString(4, c);
	        ps.setString(5, p);
	        
	        int rowCount = ps.executeUpdate();
	        
	        if(rowCount > 0) 
	            status = true;
	   
		con.close();

		} 
		
		catch (Exception ex) 
		{ 
			System.out.println(ex);
		}

		return status;
	}
	
	public boolean checkValidation (UserBean bean) 
			throws SQLException 
	{
		boolean status = false;

		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/finalproject2?useSSL=false","root","root");
            PreparedStatement ps = con.prepareStatement("select * from customer where Username = ? and Pass = ?");
            
	        String u = bean.getUsername();
	        String p = bean.getPassword();
	       
            
            ps.setString(1,  u);
            ps.setString(2,  p);
            
            ResultSet rs = ps.executeQuery();
            
            if(rs.next())
            	status = true;
	   
		con.close();

		} 
		
		catch (Exception ex) 
		{ 
			System.out.println(ex);
		}

		return status;
	}
	
	public boolean checkAdmin (AdminBean ad) 
			throws SQLException 
	{
		boolean status = false;

		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/finalproject2?useSSL=false","root","root");
            PreparedStatement ps = con.prepareStatement("select * from admin where Username = ? and Pass = ?");
            
	        String u = ad.getUsername();
	        String p = ad.getPassword();
	       
            
            ps.setString(1,  u);
            ps.setString(2,  p);
            
            ResultSet rs = ps.executeQuery();
            
            if(rs.next())
            	status = true;
	   
		con.close();

		} 
		
		catch (Exception ex) 
		{ 
			System.out.println(ex);
		}

		return status;
	}

	
	public boolean checkEmail(UserBean bean) 
			throws SQLException 
	{
	    boolean status = false;
	    String e = bean.getEmail();
	    try {
	        Class.forName("com.mysql.jdbc.Driver");
	        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/finalproject2?useSSL=false", "root", "root");
	        Statement stmt = con.createStatement();
	        String sql = "select * from customer where CustEmail='" + e + "'";
	        ResultSet rs = stmt.executeQuery(sql);
	        if (rs.next())
	            status = true;
	        con.close();
	    } catch (Exception ex) {
	        System.out.println(ex);
	    }
	    
	    return status;
	}
}
