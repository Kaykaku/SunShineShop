package models;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@NamedQueries({
	@NamedQuery(name = "Paymentmethod.findByKeyword",
		query = "SELECT DISTINCT o FROM Paymentmethod o"
		+ " WHERE o.paymentmethodName LIKE :keyword"),
	@NamedQuery(name = "Paymentmethod.findAll",
		query = "SELECT o FROM Paymentmethod o"),
	@NamedQuery(name = "Paymentmethod.findOne",
		query = "SELECT o FROM Paymentmethod o"
		+ " WHERE o.paymentmethodId = :id")
})
@Entity
@Table(name="Paymentmethods")
public class Paymentmethod {
	
	@Id
	@Column(name="PaymentmethodId")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int paymentmethodId;
	
	@Column(name="PaymentmethodName")
	private String paymentmethodName;
	
	@OneToMany(mappedBy = "paymentmethod")
	List<Order> orders;
	
	public Paymentmethod() {
		
	}

	public int getPaymentmethodId() {
		return paymentmethodId;
	}

	public void setPaymentmethodId(int paymentmethodId) {
		this.paymentmethodId = paymentmethodId;
	}

	public String getPaymentmethodName() {
		return paymentmethodName;
	}

	public void setPaymentmethodName(String paymentmethodName) {
		this.paymentmethodName = paymentmethodName;
	}

	public List<Order> getOrders() {
		return orders;
	}

	public void setOrders(List<Order> orders) {
		this.orders = orders;
	}

	
	
	
}
