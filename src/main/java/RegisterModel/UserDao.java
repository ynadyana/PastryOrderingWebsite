package RegisterModel;

import java.sql.*;

public class UserDao {
	private Connection con;

	private String query;
    private PreparedStatement pst;
    private ResultSet rs;

	public UserDao(Connection con) {
		this.con = con;
	}
	
	public UserBean userLogin(String username, String password) {
		UserBean user = null;
        try {
            query = "select * from customer where Username=? and Pass=?";
            pst = this.con.prepareStatement(query);
            pst.setString(1, username);
            pst.setString(2, password);
            rs = pst.executeQuery();
            if(rs.next()){
            	user = new UserBean();
            	user.setCustID(rs.getInt("CustID"));
            	user.setUsername(rs.getString("Username"));
            	user.setPassword(rs.getString("Pass"));
            }
        } catch (SQLException e) {
            System.out.print(e.getMessage());
        }
        return user;
    }
	
	public AdminBean adminLogin(String username, String password) {
		AdminBean admin = null;
        try {
            query = "select * from admin where Username=? and Pass=?";
            pst = this.con.prepareStatement(query);
            pst.setString(1, username);
            pst.setString(2, password);
            rs = pst.executeQuery();
            if(rs.next()){
            	admin = new AdminBean();
            	admin.setAdminID(rs.getInt("AdminID"));
            	admin.setUsername(rs.getString("Username"));
            	admin.setPassword(rs.getString("Pass"));
            }
        } catch (SQLException e) {
            System.out.print(e.getMessage());
        }
        return admin;
    }
}
