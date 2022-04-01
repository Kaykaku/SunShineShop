package models;

import java.util.Date;

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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@NamedQueries({
	@NamedQuery(name = "News.findByKeyword",
		query = "SELECT DISTINCT o FROM News o"
		+ " WHERE o.title LIKE :keyword"),
	@NamedQuery(name = "News.findAll",
		query = "SELECT o FROM News o"),
	@NamedQuery(name = "News.findOne",
		query = "SELECT o FROM News o"
		+ " WHERE o.newId = :id")
})
@Entity
@Table(name="News")
public class News {
	@Id
	@Column(name="NewId")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int newId;
	
	@Column(name="Title")
	private String title;
	
	@Column(name="Description")
	private String description;
	
	@Column(name="Content")
	private String content;
	
	@Column(name="CreateDate")
	@Temporal(TemporalType.DATE)
	private Date createDate = new Date();
	
	@ManyToOne 
	@JoinColumn(name = "AccountId")
	Account account;

	public News() {
		super();
	}

	public int getNewId() {
		return newId;
	}

	public void setNewId(int newId) {
		this.newId = newId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}


}
