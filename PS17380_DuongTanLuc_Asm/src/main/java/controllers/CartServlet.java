package controllers;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDao;
import models.Cart;
import models.Product;

@WebServlet({
	"/add-to-cart",
	"/remove-to-cart",
	"/delete-to-cart",
	"/clear-to-cart"
	})
public class CartServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	Map<Integer,Cart> cart =null ;
	HttpServletRequest req;
	HttpServletResponse resp;
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.req=req;
		this.resp=resp;
		String uri =req.getParameter("uri");
		String requestUri = req.getRequestURI();
		String id = req.getParameter("id");
		req.setAttribute("id",id);
		int productId = Integer.parseInt(req.getParameter("productId"));
		String quantityString = req.getParameter("quantity");
		int quantity=quantityString==null?1: Integer.parseInt(quantityString);
			
		cart = (Map<Integer,Cart>) req.getSession().getAttribute("cart");
		if(cart==null) {
			cart = new HashMap<Integer,Cart> ();
		}
		if(requestUri.contains("add-to-cart")) {
			add(productId, quantity);
		}else if(requestUri.contains("remove-to-cart")){
			remove(productId, quantity);
		}else if(requestUri.contains("delete-to-cart")){
			delete(productId);
		} else if(requestUri.contains("clear-to-cart")){
			req.getSession().removeAttribute("cart");
			return;
		}
		
		System.out.println(id);
		req.getSession().setAttribute("cart", cart);
		resp.sendRedirect(uri+"?id="+id);
	}
	
	void add(int productId , int quantity) {
		if(cart.get(productId)==null) {
			Product product = new ProductDao().findOne(productId);
			
			Cart itemCart = new Cart(product,quantity);
			cart.put(productId, itemCart);
		}else {
			Cart itemCart = cart.get(productId);
			itemCart.setQuantity(itemCart.getQuantity()+quantity);
			cart.put(productId, itemCart);
		}
	}
	void remove(int productId , int quantity) {
		if(cart.get(productId)!=null) {
			Cart itemCart = cart.get(productId);
			itemCart.setQuantity(itemCart.getQuantity()-quantity);
			if(itemCart.getQuantity()<=0) {
				cart.remove(productId);
			}else {
				cart.put(productId, itemCart);
			}
		}
	}
	void delete(int productId ) {
		if(cart.get(productId)!=null) {
			cart.remove(productId);			
		}
	}
}
