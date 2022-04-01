package models;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@NamedQueries({
	@NamedQuery(name = "Order.findByKeyword",
		query = "SELECT DISTINCT o FROM Order o"
		+ " WHERE o.orderID LIKE :keyword"),
	@NamedQuery(name = "Order.findAll",
		query = "SELECT o FROM Order o"),
	@NamedQuery(name = "Order.findOne",
		query = "SELECT o FROM Order o"
		+ " WHERE o.orderID = :id"),
	@NamedQuery(name = "Order.findLastOne",
	query = "SELECT o FROM Order o ORDER BY o.orderID DESC ")
})

@Entity
@Table(name="Orders")
public class Order {
	
	@Id
	@Column(name="OrderID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int orderID;
	
	@Column(name="OrderDate")
	private Date orderDate= new Date();
	
	@Column(name="Address")
	private String address;
	
	@Column(name="Status")
	private int status;
	
	
	@ManyToOne
	@JoinColumn(name="CustomerId")
	private Account customer;
	
	@ManyToOne 
	@JoinColumn(name = "PaymentmethodId")
	Paymentmethod paymentmethod;
	
	@OneToMany(mappedBy = "order",fetch = FetchType.EAGER)
	List<OrderDetail> orderDetails;

	public int getOrderID() {
		return orderID;
	}

	public void setOrderID(int orderID) {
		this.orderID = orderID;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	

	public Account getCustomer() {
		return customer;
	}

	public void setCustomer(Account customer) {
		this.customer = customer;
	}

	public Paymentmethod getPaymentmethod() {
		return paymentmethod;
	}

	public void setPaymentmethod(Paymentmethod paymentmethod) {
		this.paymentmethod = paymentmethod;
	}

	public List<OrderDetail> getOrderDetails() {
		return orderDetails;
	}

	public void setOrderDetails(List<OrderDetail> orderDetails) {
		this.orderDetails = orderDetails;
	}

	public double getTotal() {
		double total =0;
		for (OrderDetail orderDetail : orderDetails) {
			double subTotal = orderDetail.getQuantity()*(orderDetail.getPrice()*(100-orderDetail.getSale())/100);
			total+=subTotal;
		}
		total =(double) Math.round(total*100)/100;
		return total;
	}
}
