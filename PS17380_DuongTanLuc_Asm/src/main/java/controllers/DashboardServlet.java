package controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AccountDao;
import dao.OrderDao;
import dao.ProductDao;
import dao.StatictisDao;
import models.Order;


@WebServlet({"/admin/home"})
public class DashboardServlet extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp)
	throws ServletException, IOException {
		int users = new AccountDao().findAll().size();
		int orders = new OrderDao().findAll().size();
		int products = new ProductDao().findAll().size();
		req.setAttribute("users", users);
		req.setAttribute("orders", orders);
		req.setAttribute("products", products);
		double total=0;
		for (Order order : new OrderDao().findAll()) {
			total+=order.getTotal();
		}
		req.setAttribute("total", total);
		req.getRequestDispatcher("/views/admin/index_admin.jsp").forward(req, resp);
	}
	

}