package models;

import java.util.Date;
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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@NamedQueries({
	@NamedQuery(name = "Account.findByKeyword",
		query = "SELECT DISTINCT o FROM Account o"
		+ " WHERE o.accountName LIKE :keyword"),
	@NamedQuery(name = "Account.findAll",
		query = "SELECT o FROM Account o"),
	@NamedQuery(name = "Account.findOne",
		query = "SELECT o FROM Account o"
		+ " WHERE o.accountId = :id")
})
@Entity
@Table(name="Accounts")
public class Account {

	@Id
	@Column(name="AccountId")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int accountId;
	
	@Column(name="AccountName")
	private String accountName;
	
	@Column(name="Address")
	private String address;
	
	@Column(name="BirthDay")
	@Temporal(TemporalType.DATE)
	private Date birthDay;
	
	@Column(name="PhoneNumber")
	private String phoneNumber;
	
	@Column(name="Email")
	private String email;
	
	@Column(name="Active")
	private boolean active;
	
	@Column(name="Gender")
	private boolean gender;
	
	@Column(name="CreateDate")
	@Temporal(TemporalType.DATE)
	private Date createDate = new Date();
	
	@Column(name="UserName")
	private String username;
	
	@Column(name="Password")
	private String password;
	
	@Column(name="Role")
	private int role;
	
	@OneToMany(mappedBy = "customer")
	List<Order> orders;
	
	@OneToMany(mappedBy = "account")
	List<News> newss;

	public int getAccountId() {
		return accountId;
	}

	public void setAccountId(int accountId) {
		this.accountId = accountId;
	}

	public String getAccountName() {
		return accountName;
	}

	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Date getBirthDay() {
		return birthDay;
	}

	public boolean isGender() {
		return gender;
	}

	public void setGender(boolean gender) {
		this.gender = gender;
	}

	public void setBirthDay(Date birthDay) {
		this.birthDay = birthDay;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getRole() {
		return role;
	}

	public void setRole(int role) {
		this.role = role;
	}

	public List<Order> getOrders() {
		return orders;
	}

	public void setOrders(List<Order> orders) {
		this.orders = orders;
	}

	public List<News> getNewss() {
		return newss;
	}

	public void setNewss(List<News> newss) {
		this.newss = newss;
	}
	
	
}
