package paymentProject;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class paymentDao {

	public double totalAmount(int orderId)throws SQLException{
		
		
		String sql="SELECT TotalPrice FROM orders WHERE OrderID=?";
		double totalAmount=0;
		try {
			//i.initialize JDBC connection and prepared statement
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/finalproject2?useSSL=false","root","root");
			PreparedStatement statement=con.prepareStatement(sql);
			
			statement.setInt(1,orderId);
			ResultSet rs=statement.executeQuery();
			
			if(rs.next()) {
				totalAmount+=rs.getDouble("TotalPrice");
			}
			
			con.close();		
		}catch(Exception ex){System.out.println(ex);}
		
		return totalAmount;
		
	}
	
	public int getLastReceiptId(int orderId) throws SQLException {
	    int receiptId = -1;
	    Connection con = null;
	    PreparedStatement pst = null;
	    ResultSet rs = null;
	    
	    try {
	        Class.forName("com.mysql.jdbc.Driver");
	        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/finalproject2", "root", "root");

	        // Logging
	        System.out.println("Connection established.");

	        pst = con.prepareStatement("SELECT ReceiptID FROM receipt WHERE OrderID = ?");
	        pst.setInt(1, orderId);  // Set the orderId parameter

	        // Logging
	        System.out.println("Executing query: SELECT ReceiptID FROM receipt WHERE OrderID = " + orderId);
	        
	        rs = pst.executeQuery();
	        if (rs.next()) {
	            receiptId = rs.getInt("ReceiptID");
	            // Logging
	            System.out.println("ReceiptID found: " + receiptId);
	        } else {
	            // Logging
	            System.out.println("No ReceiptID found for OrderID: " + orderId);
	        }
	    } catch (SQLException | ClassNotFoundException e) {
	        System.out.println(e.getMessage());
	    } finally {
	        try {
	            if (rs != null) rs.close();
	            if (pst != null) pst.close();
	            if (con != null) con.close();
	        } catch (SQLException e) {
	            System.out.println(e.getMessage());
	        }
	    }
	    
	    // Logging
	    System.out.println("Returning receiptId: " + receiptId);
	    
	    return receiptId;
	}



	public boolean insertDeliveryData(delivery beanDelivery,int orderId) throws SQLException {
	    boolean success = false;
	    Connection con = null;
	    PreparedStatement ps = null;

	    try {
	        Class.forName("com.mysql.jdbc.Driver");
	        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/finalproject2", "root", "root");
	        
	        int receiptId=getLastReceiptId(orderId);
	        ps = con.prepareStatement("INSERT INTO delivery(ReceiptId, Name, Address, City, PostalCode) VALUES(?,?, ?, ?, ?)");

	        ps.setInt(1, receiptId);
	        ps.setString(2, beanDelivery.getName());
	        ps.setString(3, beanDelivery.getAddress());
	        ps.setString(4, beanDelivery.getCity());
	        ps.setString(5, beanDelivery.getPostalCode());

	        int rowsInserted = ps.executeUpdate();
	        if (rowsInserted > 0) {
	            success = true;
	        }
	    } catch (Exception ex) {
	        System.out.println(ex);
	    } finally {
	        if (ps != null) {
	            try {
	                ps.close();
	            } catch (SQLException e) {
	                System.out.println(e.getMessage());
	            }
	        }
	        if (con != null) {
	            try {
	                con.close();
	            } catch (SQLException e) {
	                System.out.println(e.getMessage());
	            }
	        }
	    }
	    return success;
	}

	
	public boolean insertReceipt(Receipt beanReceipt) throws SQLException {
	    boolean success = false;
	    
	    try {
	    	Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/finalproject2","root","root");
			PreparedStatement ps=con.prepareStatement("insert into receipt(OrderID, ReceiptDate, ReceiptTime, PaymentMethod, TotalPayment,DeliveryType) values(?,?,?,?,?,?)");
	        
			int a=beanReceipt.getOrderID();
	        String n=beanReceipt.getReceiptDate();
	        String p=beanReceipt.getReceiptTime();
	        String q=beanReceipt.getPaymentMethod();
	        Double b=beanReceipt.getTotalPayment();
	        String s=beanReceipt.getDeliveryType();
	        
	        ps.setInt(1, a);
	        ps.setString(2, n);
	        ps.setString(3, p);
	        ps.setString(4, q);
	        ps.setDouble(5, b);
	        ps.setString(6, s);
	        
	        
	        int rowsInserted = ps.executeUpdate();
	        if (rowsInserted>0) {
	            success = true;
	        }
	    } catch(Exception ex){System.out.println(ex);}
	    
	    
	    return success;
	}

	public boolean insertPickupData(String PickupTime,String PickupDate) {
	    boolean success2 = false;
	    
	    try  {
	    	Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/finalproject2","root","root");
			PreparedStatement ps=con.prepareStatement("insert into pickup(PickupTime,PickupDate) values(?,?)");
			
			
	        ps.setString(1, PickupTime);
	        ps.setString(2, PickupDate);
	        
	        int rowsInserted = ps.executeUpdate();
	        if (rowsInserted > 0) {
	            success2 = true;
	        }
	    } catch(Exception ex){System.out.println(ex);}
	    
	    return success2;
	}


	public List<OrderProduct> getCartDetailsByOrderId(int orderId) throws SQLException {
	    List<OrderProduct> cartDetails = new ArrayList<>();

	    try {
	        Class.forName("com.mysql.jdbc.Driver");
	        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/finalproject2?useSSL=false", "root", "root");

	        String query = "SELECT p.ProdName, p.ProdPrice, op.ProdQuantity " +
	                   "FROM receipt r " +
	                   "JOIN orders o ON r.OrderID = o.OrderID " +
	                   "JOIN order_product op ON o.OrderID = op.OrderID " +
	                   "JOIN product p ON op.ProdID = p.ProdID " +
	                   "WHERE r.OrderID = ?"; 
	        
	        PreparedStatement ps = con.prepareStatement(query);
	        ps.setInt(1, orderId);
	        ResultSet rs = ps.executeQuery();

	        while (rs.next()) {
	        	 String productName = rs.getString("ProdName");
	             double productPrice = rs.getDouble("ProdPrice");
	             int productQuantity = rs.getInt("ProdQuantity");

	            OrderProduct orderProduct = new OrderProduct(productName, productPrice, productQuantity);
	            cartDetails.add(orderProduct);
	        }

	        rs.close();
	        ps.close();
	        con.close();
	    } catch (Exception ex) {
	        System.out.println("Error: " + ex.getMessage());
	    }

	    return cartDetails;
	}


public Receipt getReceiptByOrderId(int orderId) throws SQLException {
    Receipt receipt = null;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/finalproject2?useSSL=false", "root", "root");

        String sql = "SELECT ReceiptDate, ReceiptTime, PaymentMethod, DeliveryType FROM receipt WHERE OrderID = ?";
        PreparedStatement statement = con.prepareStatement(sql);
        statement.setInt(1, orderId);
        ResultSet rs = statement.executeQuery();

        if (rs.next()) {
        	
            String receiptDate = rs.getString("ReceiptDate");
            String receiptTime = rs.getString("ReceiptTime");
            String paymentMethod = rs.getString("PaymentMethod");
            String deliveryType = rs.getString("DeliveryType");

            receipt = new Receipt();
            receipt.setReceiptDate(receiptDate);
            receipt.setReceiptTime(receiptTime);
            receipt.setPaymentMethod(paymentMethod);
            receipt.setDeliveryType(deliveryType);
        }

        rs.close();
        statement.close();
        con.close();
    } catch (Exception ex) {
        System.out.println("Error: " + ex.getMessage());
        throw new SQLException("Error retrieving receipt for orderId: " + orderId, ex);
    }

    return receipt;
}
}

