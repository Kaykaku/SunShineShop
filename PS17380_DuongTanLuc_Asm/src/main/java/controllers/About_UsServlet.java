package controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDao;
import models.Product;

@WebServlet({"/about-us"})
public class About_UsServlet extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	ProductDao productDao = new ProductDao();
	List<Product> list;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
	throws ServletException, IOException {
		req.setAttribute("menu", 6);
		req.getRequestDispatcher("/views/about-us.jsp").forward(req, resp);
	}
	
}