package paymentProject;

public class Product {
	private int ProdID;
	private String ProdName;
	private Double ProdPrice;
	
	
	
	public Product() {
	}

	
	public Product(int ProdID, String ProdName,  Double ProdPrice) {
		super();
		this.ProdID = ProdID;
		this.ProdName = ProdName;
		
		this.ProdPrice = ProdPrice;
		
	}


	public int getId() {
		return ProdID;
	}

	public void setId(int ProdID) {
		this.ProdID = ProdID;
	}

	public String getName() {
		return ProdName;
	}

	public void setName(String ProdName) {
		this.ProdName = ProdName;
	}

	public Double getPrice() {
		return ProdPrice;
	}

	public void setPrice(Double ProdPrice) {
		this.ProdPrice = ProdPrice;
	}

	@Override
	public String toString() {
		return "Product [id=" + ProdID + ", name=" + ProdName + ",price=" + ProdPrice + "]";
	}
	
	
}
