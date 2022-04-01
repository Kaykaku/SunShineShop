package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AccountDao;
import models.Account;

@WebServlet({
	"/sign-in",
	"/sign-out",
	"/sign-up"
	})
public class LoginServlet extends HttpServlet{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	HttpServletRequest req;
	HttpServletResponse resp;
	AccountDao dao= new AccountDao();
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.req=req;
		this.resp=resp;
		String oldUri = req.getParameter("uri");
		String oldId = req.getParameter("id");
		req.setAttribute("id",oldId);
		String uri = req.getRequestURI();
		if(uri.contains("sign-in")) {
			signIn();
		}else if(uri.contains("sign-out")) {
			signOut();
		}if(uri.contains("sign-up")) {
			signUp();
		}
		resp.sendRedirect(oldUri+"?id="+oldId);
	}
	
	boolean signIn() {
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		String message="";
		try {
			Account account = dao.findByUsername(username);
			if(!account.getPassword().equals(password)) {
				message+="Message : Wrong password!";
			}
			else {
				req.getSession().removeAttribute("message");
				req.getSession().setAttribute("user", account);	
				return true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			message+="Message : Wrong id!";
		}
		req.getSession().setAttribute("message", message);
		return false;
	}
	void signOut() {		
		if(req.getSession().getAttribute("user")!=null) {
			req.setAttribute("message", "Message : Sign out!");
		}
		req.getSession().setAttribute("user", null);
	}
	void signUp() {
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		String email = req.getParameter("email");
		String message="";
		try {
			Account account = dao.findByUsername(username);
			 if(account!=null) {
				message+="Message : User already exists !";
			}
			else {
				req.getSession().removeAttribute("message");
				Account user = new Account();
				user.setUsername(username);
				user.setPassword(password);
				user.setEmail(email);
				user.setActive(true);
				user.setRole(1);
				new AccountDao().create(user);
				req.getSession().setAttribute("user", user);	
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			message+="Message : Error!";
		}
		req.getSession().setAttribute("message", message);
	}
}
