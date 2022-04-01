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
import dao.OrderDetailDao;
import dao.PaymentmethodDao;
import dao.ProductDao;
import models.Account;
import models.Order;
import models.OrderDetail;
import models.Paymentmethod;
import models.Product;

@MultipartConfig
@WebServlet({ 
	"/admin/management-order-detail/view", 
	"/admin/management-order-detail/edit", 
	"/admin/management-order-detail/delete",
	"/admin/management-order-detail/update", 
	"/admin/management-order-detail/create", 
		})
public class Management_OrderDetailServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	HttpServletRequest req;
	HttpServletResponse resp;
	OrderDao orderDao = new OrderDao();
	OrderDetailDao orderDetailDao = new OrderDetailDao();
	ProductDao productDao = new ProductDao();
	List<Order> listOrders;
	List<OrderDetail> listOrderDetails;
	List<Product> listProducts;
	Order order = new Order();

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.req = req;
		this.resp = resp;
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		String uri = req.getRequestURI();
		String orderId = req.getParameter("orderId");
		if(orderId==null) {
			req.getRequestDispatcher("/views/admin/management-order-detail.jsp").forward(req, resp);
			return;
		}
		order = orderDao.findOne(Integer.parseInt(orderId));
		req.setAttribute("order", order);
		if (uri.contains("edit")) {
			int id = Integer.parseInt(req.getParameter("orderDetailId"));
			edit(id);
		} else if (uri.contains("delete")) {
			delete();
			resp.sendRedirect("view?orderId="+order.getOrderID());
			return;
		} else if (uri.contains("update")) {
			update();
			resp.sendRedirect("view?orderId="+order.getOrderID());
			return;
		} else if (uri.contains("view")) {
			clear();
		} else if (uri.contains("create")) {
			create();
			resp.sendRedirect("view?orderId="+order.getOrderID());
			return;
		}
		viewTable();
		req.getRequestDispatcher("/views/admin/management-order-detail.jsp").forward(req, resp);
	}

	void viewTable() {
		listProducts = productDao.FindNotInOrder(order.getOrderID());
		listOrders = orderDao.findAll();
		listOrderDetails = orderDetailDao.findByOrder(order.getOrderID());
		req.setAttribute("listOrders", listOrders);
		req.setAttribute("listOrderDetails", listOrderDetails);
		req.setAttribute("listProducts", listProducts);
	}

	void edit(int id) {
		OrderDetail orderDetail = orderDetailDao.findOne(id);
		req.setAttribute("orderDetail", orderDetail);
	}

	void delete() {
		int id = Integer.parseInt(req.getParameter("orderDetailId"));
		OrderDetail orderDetail = orderDetailDao.findOne(id);
		orderDetailDao.delete(orderDetail);
		clear();
	}

	void update() {
		OrderDetail orderDetail = getForm();
		orderDetailDao.update(orderDetail);
		edit(orderDetail.getOrderDetailID());
	}

	void clear() {
		OrderDetail orderDetail = new OrderDetail();
		req.setAttribute("orderDetail", orderDetail);
	}

	OrderDetail getForm() {
		OrderDetail orderDetail = new OrderDetail();
		try {
			int id = Integer.parseInt(req.getParameter("id"));		
			orderDetail.setOrderDetailID(id);
			orderDetail.setOrder(order);
			Double price = Double.parseDouble(req.getParameter("price"));	
			int quantity = Integer.parseInt(req.getParameter("quantity"));	
			int sale = Integer.parseInt(req.getParameter("sale"));	
			int productId = Integer.parseInt(req.getParameter("productId"));	
			orderDetail.setPrice(price);
			orderDetail.setQuantity(quantity);
			orderDetail.setSale(sale);
			orderDetail.setProduct(productDao.findOne(productId));
			
			return orderDetail;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	void create() {
		OrderDetail orderDetail = new OrderDetail();
		int productId = Integer.parseInt(req.getParameter("productId"));
		Product product = productDao.findOne(productId);
		orderDetail.setProduct(product);
		orderDetail.setOrder(order);
		orderDetail.setPrice(product.getPrice());
		orderDetail.setQuantity(1);
		orderDetail.setSale(product.getSale());
		orderDetail.setOrderDetailID(0);
		orderDetailDao.create(orderDetail);
	}
}