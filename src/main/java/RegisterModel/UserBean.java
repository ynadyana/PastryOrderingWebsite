package RegisterModel;

public class UserBean 
{
	private int custID;
	private String name;
    private String contact;
    private String email;
    private String username;
    private String password;

    
    // Getters
    public int getCustID() {return custID;}
    
    public String getName() {return name;}

    public String getContact() {return contact; }

    public String getEmail() { return email;}

    public String getUsername() {return username;}

    public String getPassword() { return password;}

    // Setters
    public void setName(String name) {this.name = name;}

    public void setContact(String contact) {this.contact = contact;}

    public void setEmail(String email) { this.email = email;}

    public void setUsername(String username) {this.username = username;}

    public void setPassword(String password) {this.password = password;}
    
    public void setCustID(int custID) {this.custID = custID;}
    
    public boolean validate() 
    {
	    if(password.isEmpty() || name.isEmpty() || username.isEmpty() || email.isEmpty() || contact.isEmpty()) 
	    	return false;
	    else
	    	return true;
	 }
    
    public boolean validate2() 
    {
	    if(password.isEmpty() || username.isEmpty()) 
	    	return false;
	    else
	    	return true;
	 }
    
    public boolean validate3() 
    {
	    if(email.isEmpty()) 
	    	return false;
	    else
	    	return true;
	 }
    
    public boolean validate4() 
    {
	    if(email != null) 
	    	return true;
	    else
	    	return false;
	 }
}
