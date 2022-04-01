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
import dao.OrderDao;
import dao.PaymentmethodDao;
import models.Account;
import models.Order;
import models.OrderDetail;
import models.Paymentmethod;

@MultipartConfig
@WebServlet({ 
	"/admin/management-order/view", 
	"/admin/management-order/edit", 
	"/admin/management-order/delete",
	"/admin/management-order/update", 
	"/admin/management-order/create", 
		})
public class Management_Order_Servlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	HttpServletRequest req;
	HttpServletResponse resp;
	OrderDao dao = new OrderDao();
	List<Order> list;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.req = req;
		this.resp = resp;
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		String uri = req.getRequestURI();
		if (uri.contains("edit")) {
			int id = Integer.parseInt(req.getParameter("orderId"));
			edit(id);
		} else if (uri.contains("delete")) {
			delete();
			resp.sendRedirect("view");
			return;
		} else if (uri.contains("update")) {
			update();
			resp.sendRedirect("view");
			return;
		} else if (uri.contains("view")) {
			clear();
		} else if (uri.contains("create")) {
			create();
			resp.sendRedirect("view");
			return;
		}
		viewTable();
		req.getRequestDispatcher("/views/admin/management-order.jsp").forward(req, resp);
	}

	void viewTable() {
		list = dao.findAll();
		List<Paymentmethod> listPaymentmethods= new PaymentmethodDao().findAll();
		List<Account> listAccounts= new AccountDao().findAll();
		req.setAttribute("list", list);
		req.setAttribute("listPaymentmethods", listPaymentmethods);
		req.setAttribute("listAccounts", listAccounts);
	}

	void edit(int id) {
		Order order = dao.findOne(id);
		req.setAttribute("order", order);
	}

	void delete() {
		int id = Integer.parseInt(req.getParameter("orderId"));
		Order order = dao.findOne(id);
		dao.delete(order);
		clear();
	}

	void update() {
		Order order = getForm();
		dao.update(order);
		edit(order.getOrderID());
	}

	void clear() {
		Order order = new Order();
		req.setAttribute("order", order);
	}

	Order getForm() {
		Order order = new Order();
		try {
			int id = Integer.parseInt(req.getParameter("id"));		
			order.setOrderID(id);
			Account account = new AccountDao().findOne(Integer.parseInt(req.getParameter("accountID")));
			order.setCustomer(account);
			String dateString = req.getParameter("date");		
			Date date = dateString.isEmpty() ? new Date() : new SimpleDateFormat("yyyy-MM-dd").parse(dateString);
			order.setOrderDate(date);
			int paymentmethodId = Integer.parseInt(req.getParameter("paymentmethodId"));
			Paymentmethod paymentmethod = new PaymentmethodDao().findOne(paymentmethodId);
			order.setPaymentmethod(paymentmethod);
			order.setAddress(req.getParameter("address"));
			String status =req.getParameter("status");
			order.setStatus(status==null?0: Integer.parseInt(status));
			List<OrderDetail> listOrderDetails = new OrderDao().findOne(id).getOrderDetails();
			order.setOrderDetails(listOrderDetails);

			return order;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	void create() {
		Order order = getForm();
		order.setOrderID(0);
		order.setOrderDate(new Date());
		order.setOrderDetails(null);
		dao.create(order);
	}

}