package controllers;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import contraints.Common;
import dao.OrderDao;
import dao.OrderDetailDao;
import dao.PaymentmethodDao;
import models.Account;
import models.Cart;
import models.OrderDetail;

@WebServlet({
	"/checkout/step-1",
	"/checkout/step-2",
	"/checkout/step-3",
	"/checkout/step-4",
	"/checkout/done",
	})
public class CheckoutServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	Map<Integer,Cart> cart =null ;
	HttpServletRequest req;
	HttpServletResponse resp;
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String requestUri = req.getRequestURI();
		this.req=req;
		this.resp=resp;	
		cart = (Map<Integer,Cart>) req.getSession().getAttribute("cart");
		if(cart==null) {
			cart = new HashMap<Integer,Cart> ();
		}
		if(requestUri.contains("step-1")) {

			req.getRequestDispatcher("/views/checkout-step1.jsp").forward(req, resp);
		}else if(requestUri.contains("step-2")){
			req.getRequestDispatcher("/views/checkout-step2.jsp").forward(req, resp);
		}else if(requestUri.contains("step-3")){
			req.getRequestDispatcher("/views/checkout-step3.jsp").forward(req, resp);
		} else if(requestUri.contains("step-4")){
			req.getRequestDispatcher("/views/checkout-step4.jsp").forward(req, resp);
		} else if(requestUri.contains("done")) {
			done();
			req.getSession().removeAttribute("cart");
			req.getRequestDispatcher("/views/checkout-done.jsp").forward(req, resp);
		}		
	}
	
	void done() {
		models.Order order=new models.Order();
		Account user =(Account) req.getSession().getAttribute("user");
		order.setAddress(user.getAddress());
		order.setCustomer(user);
		order.setOrderDate(new Date());
		order.setStatus(0);
		order.setPaymentmethod(new PaymentmethodDao().findOne(1));
		new OrderDao().create(order);
		order = new OrderDao().findLastOne();
		
		for (Map.Entry<Integer, Cart> entry : cart.entrySet()) {
			OrderDetail orderDetail = new OrderDetail();
			orderDetail.setOrder(order);
			orderDetail.setPrice(entry.getValue().getProduct().getPrice());
			orderDetail.setProduct(entry.getValue().getProduct());
			orderDetail.setQuantity(entry.getValue().getQuantity());
			orderDetail.setSale(entry.getValue().getProduct().getSale());
		    new OrderDetailDao().create(orderDetail);
		}
	}
}
