package models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;


@NamedQueries({
	@NamedQuery(name = "OrderDetail.findByKeyword",
		query = "SELECT DISTINCT o FROM OrderDetail o"),
	@NamedQuery(name = "OrderDetail.findAll",
		query = "SELECT o FROM OrderDetail o"),
	@NamedQuery(name = "OrderDetail.findOne",
		query = "SELECT o FROM OrderDetail o"
		+ " WHERE o.orderDetailID = :id"),
	@NamedQuery(name = "OrderDetail.findByOrder",
	query = "SELECT o FROM OrderDetail o"
	+ " WHERE o.order.orderID = :id")
	
})
@Entity
@Table(name="OrderDetails")
public class OrderDetail {
	
	@Id
	@Column(name="OrderDetailID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int orderDetailID;
	
	@Column(name="Price")
	private double price;
	
	@Column(name="Quantity")
	private int quantity;
	
	@Column(name="Sale")
	private int sale;
	
	@ManyToOne 
	@JoinColumn(name = "OrderId")
	Order order;
	
	@ManyToOne 
	@JoinColumn(name = "ProductId")
	Product product;

	public int getOrderDetailID() {
		return orderDetailID;
	}

	public void setOrderDetailID(int orderDetailID) {
		this.orderDetailID = orderDetailID;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getSale() {
		return sale;
	}

	public void setSale(int sale) {
		this.sale = sale;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}
	public double getSubTotal() {
		double subTotal = quantity*(price*(100-sale)/100);
		subTotal =(double) Math.round(subTotal*100)/100;
		return  subTotal;
	}
}