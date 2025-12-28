package paymentProject;

public class delivery {
	private String name,address,city,postalCode;
	private int receiptId;
	
	public int getReceiptId() {return receiptId;}
	public String getName() {return name;}
	public String getAddress() {return address;}
	public String getCity() {return city;}
	public String getPostalCode() {return postalCode;}
	
	public void setReceiptId(int receiptId) {this.receiptId=receiptId;}
	public void setName(String name) {this.name=name;}
	public void setAddress(String address) {this.address=address;}
	public void setCity(String city) {this.city=city;}
	public void setPostalCode(String postalCode) {this.postalCode=postalCode;}
	
	
}
