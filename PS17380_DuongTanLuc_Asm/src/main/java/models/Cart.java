package models;

public class Cart {
	private Product product;
	private int quantity;
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public Cart(Product product, int quantity) {
		super();
		this.product = product;
		this.quantity = quantity;
	}
	
	public double getSubTotal() {
		double total =quantity*(product.getPrice()*(100-product.getSale())/100);
		total =(double) Math.round(total * 100) / 100 ;
		return total;
	}
}
