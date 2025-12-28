package paymentProject;

public class Receipt {
	private int OrderID;
	private String ReceiptDate,ReceiptTime,PaymentMethod,DeliveryType;
	private double totalPayment;
	

	public int getOrderID() {return OrderID;}
	public String getReceiptDate() {return ReceiptDate;}
	public String getReceiptTime() {return ReceiptTime;}
	public String getPaymentMethod() {return PaymentMethod;}
	public String getDeliveryType() {return DeliveryType;}
	public double getTotalPayment() {return totalPayment;}
	

	public void setOrderID(int OrderID) {this.OrderID=OrderID;}
	public void setReceiptDate(String ReceiptDate) {this.ReceiptDate= ReceiptDate;}
	public void setReceiptTime(String ReceiptTime) {this.ReceiptTime= ReceiptTime;}
	public void setPaymentMethod(String PaymentMethod) {this.PaymentMethod= PaymentMethod;}
	public void setDeliveryType(String DeliveryType) {this.DeliveryType= DeliveryType;}
	public void setTotalPayment(double totalPayment) {this.totalPayment=totalPayment;}
	
}
