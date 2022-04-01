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
	@NamedQuery(name = "Category.findByKeyword",
		query = "SELECT DISTINCT o FROM Category o"
		+ " WHERE o.categoryName LIKE :keyword"),
	@NamedQuery(name = "Category.findAll",
		query = "SELECT o FROM Category o"),
	@NamedQuery(name = "Category.findOne",
		query = "SELECT o FROM Category o"
		+ " WHERE o.categoryID = :id")
})
@Entity
@Table(name="Categories")
public class Category {
	
	@Id
	@Column(name="CategoryID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int categoryID;
	
	@Column(name="CategoryName")
	private String categoryName;
	
	@OneToMany(mappedBy = "category")
	List<Product> products;
	
	public Category() {
		
	}
	
	public int getCategoryID() {
		return categoryID;
	}
	public void setCategoryID(int categoryID) {
		this.categoryID = categoryID;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public List<Product> getProducts() {
		return products;
	}

	public void setProducts(List<Product> products) {
		this.products = products;
	}
	
}
