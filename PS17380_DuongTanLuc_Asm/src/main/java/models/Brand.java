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
	@NamedQuery(name = "Brand.findByKeyword",
		query = "SELECT DISTINCT o FROM Brand o"
		+ " WHERE o.brandName LIKE :keyword"),
	@NamedQuery(name = "Brand.findAll",
		query = "SELECT o FROM Brand o"),
	@NamedQuery(name = "Brand.findOne",
		query = "SELECT o FROM Brand o"
		+ " WHERE o.brandID = :id")
})
@Entity
@Table(name="Brands")
public class Brand {
	
	@Id
	@Column(name="BrandID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int brandID;
	
	@Column(name="BrandName")
	private String brandName;
	
	@OneToMany(mappedBy = "brand")
	List<Product> products;
	
	public Brand() {
		
	}

	public int getBrandID() {
		return brandID;
	}

	public void setBrandID(int brandID) {
		this.brandID = brandID;
	}

	public String getBrandName() {
		return brandName;
	}

	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}

	public List<Product> getProducts() {
		return products;
	}

	public void setProducts(List<Product> products) {
		this.products = products;
	}
	
	
}
