package paymentProject;

import java.util.List;

public class Order extends Product {
    private int orderId;
    private int custId;
    private int quantity;
    private String orderDate;
    private String productName;
    private double price;
    private List<Cart> cartList;
	private String receiptDate;
	private int receiptId;

    public Order() {
        super();
    }

    public Order(int orderId, int custId, int quantity, int ProdID, String ProdName, Double ProdPrice, String orderDate, String productName, double price) {
        super(ProdID, ProdName, ProdPrice);
        this.orderId = orderId;
        this.custId = custId;
        this.quantity = quantity;
        this.orderDate = orderDate;
        this.productName = productName;
        this.price = price;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getCustId() {
        return custId;
    }

    public void setCustId(int custId) {
        this.custId = custId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "Order [orderId=" + orderId + ", custId=" + custId + ", quantity=" + quantity + ", orderDate=" + orderDate + ", productName=" + productName + ", price=" + price + ", " + super.toString() + "]";
    }
    
    public List<Cart> getCartList() {
        return cartList;
    }

    public void setCartList(List<Cart> cartList) {
        this.cartList = cartList;
    }

	public void setReceiptDate(String receiptDate) {
		this.receiptDate=receiptDate;
		
		
	}

	public void setReceiptId(int receiptId) {
		this.receiptId=receiptId;	
	}
	
	public String getReceiptDate() {
		return receiptDate;
		
		
	}
}
