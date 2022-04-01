package models;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@NamedQueries({
	@NamedQuery(name = "Product.findByKeyword",
		query = "SELECT DISTINCT o FROM Product o"
		+ " WHERE o.productName LIKE :keyword"),
	@NamedQuery(name = "Product.findAll",
		query = "SELECT o FROM Product o"),
	@NamedQuery(name = "Product.findOne",
		query = "SELECT o FROM Product o"
		+ " WHERE o.productID = :id"),
	@NamedQuery(name = "Product.FindNotInOrder",
	query = "SELECT o FROM Product o"
	+ " WHERE o.productID NOT IN (SELECT a.product.productID FROM OrderDetail a WHERE a.order.orderID = :id)")
})
@Entity
@Table(name="Products")
public class Product {
	@Id
	@Column(name="ProductID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int productID;
	
	@Column(name="ProductName")
	private String productName;
	
	@Column(name="CreateDate")
	@Temporal(TemporalType.DATE)
	private Date createDate = new Date();
	
	@Column(name="Size")
	private String size;
	
	@Column(name="Color")
	private String color;
	
	@Column(name="Description")
	private String description;
	
	@Column(name="Price")
	private double price;
	
	@Column(name="Quantity")
	private int quantity;

	@Column(name="Sale")
	private int sale;


	@Column(name="Image")
	private String image;
	
	@OneToMany(mappedBy = "product")
	List<OrderDetail> orderDetails;

	@ManyToOne 
	@JoinColumn(name = "CategoryId")
	Category category;
	
	@ManyToOne 
	@JoinColumn(name = "BrandId")
	Brand brand;
	
	public Product() {
		super();
	}

	public int getProductID() {
		return productID;
	}

	public void setProductID(int productID) {
		this.productID = productID;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
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


	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}
	
	public double getSalePrice() {
		double d = (double) Math.round( (price-(price*((double)sale/100))) * 100) / 100;
		return d;
	}

	public List<OrderDetail> getOrderDetails() {
		return orderDetails;
	}

	public void setOrderDetails(List<OrderDetail> orderDetails) {
		this.orderDetails = orderDetails;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public Brand getBrand() {
		return brand;
	}

	public void setBrand(Brand brand) {
		this.brand = brand;
	}
	
}
