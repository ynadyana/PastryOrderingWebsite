package paymentProject;

import java.util.List;

public class OrderProduct{
	private int orderID,prodID,productQuantity;
	private double totalAmount;
	private String productName;
	private double productPrice;
	
	
	
	public int getOrderID() {return orderID;}
	public int getProdID() {return prodID;}
	public String getProductName() {return productName;}
	public int getProductQuantity() {return productQuantity;}
	public double getTotalAmount() {return totalAmount;}
	public double getProductPrice() {return productPrice;}
	
	public void setOrderID(int orderID) {this.orderID=orderID;}
	public void setProdID(int prodID) {this.prodID=prodID;}
	public void setProductName(String productName) {this.productName= productName;}
	public void setProductQuantity(int productQuantity) {this.productQuantity=productQuantity;}
	public void setTotalAmount(double totalAmount) {this.totalAmount=totalAmount;}
	public void setProductPrice(double productPrice) {this.productPrice= productPrice;}
	
	public OrderProduct(String productName,double productPrice, int productQuantity) {
		this.productName=productName;
		this.productPrice=productPrice;
		this.productQuantity=productQuantity;}
		
		
		
	
}
