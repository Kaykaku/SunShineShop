package controllers;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AccountDao;
import models.Account;

@MultipartConfig
@WebServlet({
	"/admin/management-account/view",
	"/admin/management-account/edit",
	"/admin/management-account/delete",
	"/admin/management-account/update",
	"/admin/management-account/update-info",
	"/admin/management-account/create",
	})
public class Management_AccountServlet extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	HttpServletRequest req;
	HttpServletResponse resp;
	AccountDao dao = new AccountDao();
	List<Account> list;	
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp)
	throws ServletException, IOException {
		this.req=req;
		this.resp=resp;
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		String uri = req.getRequestURI();
		if(uri.contains("edit")) {
			int id = Integer.parseInt(req.getParameter("accountId"));
			edit(id);
		}else if(uri.contains("delete")) {
			delete();
			resp.sendRedirect("view");
			return;
		}else if(uri.contains("update-info")) {
			updateInfo();
			resp.sendRedirect("view");
			return;
		}else if(uri.contains("update")) {
			update();
			resp.sendRedirect("view");
			return;
		}else if(uri.contains("view")) {
			clear();
		}else if(uri.contains("create")) {
			create();
		}
		viewTable();
		req.getRequestDispatcher("/views/admin/management-account.jsp").forward(req, resp);
	}
	void viewTable() {
		list = dao.findAll();
		req.setAttribute("list", list);
	}
	void edit(int id) {	
		Account account = dao.findOne(id);
		req.setAttribute("account", account);
	}
	void delete() {
		int id = Integer.parseInt(req.getParameter("accountId"));
		Account account = dao.findOne(id);
		dao.delete(account);
		clear();
	}
	void update() {
		Account account = getForm();
		Account account2 = dao.findOne(account.getAccountId());
		account2.setEmail(account.getEmail());
		account2.setPassword(account.getPassword());
		account2.setActive(account.isActive());
		account2.setRole(account.getRole());
		dao.update(account2);
		edit(account.getAccountId());
	}
	void updateInfo() {
		Account account = getFormInfo();
		Account account2 = dao.findOne(account.getAccountId());
		account.setUsername(account2.getUsername());
		account.setEmail(account2.getEmail());
		account.setPassword(account2.getPassword());
		account.setActive(account2.isActive());
		account.setRole(account2.getRole());
		System.out.println(123);
		dao.update(account);
		edit(account.getAccountId());
	}
	void clear() {
		Account account =new Account();
		req.setAttribute("account", account);
	}
	Account getForm() {
		Account account= new Account();
		try {
			int id =Integer.parseInt(req.getParameter("id"));
			account.setAccountId(id);
			account.setEmail(req.getParameter("email"));

			account.setUsername(req.getParameter("username"));
			account.setPassword(req.getParameter("password"));
			account.setActive(Boolean.parseBoolean(req.getParameter("active")));
			account.setRole(Boolean.parseBoolean(req.getParameter("role"))?0:1);
			
			
			return account;
		} catch (Exception e) { 
			e.printStackTrace();
		}
		return null;
	}
	Account getFormInfo() {
		Account account= new Account();
		try {
			int id =Integer.parseInt(req.getParameter("id"));
			account.setAccountId(id);
			account.setAccountName(req.getParameter("name"));		
			account.setGender(Boolean.parseBoolean(req.getParameter("gender")));
			String bdate=req.getParameter("birthdate");
			Date date = bdate.isEmpty()?new Date(): new SimpleDateFormat("yyyy-MM-dd").parse(bdate);
			account.setBirthDay(date);
			account.setPhoneNumber(req.getParameter("phone"));
			
			account.setAddress(req.getParameter("address"));
			account.setCreateDate(new Date());
			return account;
		} catch (Exception e) { 
			e.printStackTrace();
		}
		return null;
	}
	void create() {
		Account account = getForm();
		account.setAccountId(0);
		dao.create(account);
	}
}