package paymentProject;

public class User {
	private int CustID;
	private String CustName;
	private String CustPhoneNumber;
	private String CustEmail;
	private String Username;
	private String Password;

	public User() {
	}

	public User(int id, String name, String phoneNum, String email, String username,String password) {
		this.CustID = id;
		this.CustName = name;
		this.CustPhoneNumber= phoneNum;
		this.CustEmail = email;
		this.Username=username;
		this.Password = password;
	}

	public int getId() {
		return CustID;
	}

	public void setId(int id) {
		this.CustID = id;
	}

	public String getName() {
		return CustName;
	}

	public void setName(String name) {
		this.CustName = name;
	}
	
	public String getPhoneNum() {
		return CustPhoneNumber;
	}

	public void setPhoneNum(String CustPhoneNumber) {
		this.CustPhoneNumber = CustPhoneNumber;
	}

	public String getEmail() {
		return CustEmail;
	}

	public void setEmail(String email) {
		this.CustEmail = email;
	}

	public String getUsername() {
		return Username;
	}

	public void setUsername(String username) {
		this.Username = username;
	}
	
	public String getPassword() {
		return Password;
	}

	public void setPassword(String password) {
		this.Password = password;
	}

	@Override
	public String toString() {
		return "User [id=" + CustID + ", name=" + CustName + ",Phone Number=" + CustPhoneNumber + ", email=" + CustEmail + ", Username=" + Username + ", password=" + Password + "]";
	}
	
}
