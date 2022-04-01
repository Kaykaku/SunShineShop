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

@WebServlet("/all-products")
public class Product_AllServlet extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	ProductDao productDao = new ProductDao();
	List<Product> list;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
	throws ServletException, IOException {
		String pageString =req.getParameter("page");
		int page=1;
		if(pageString!=null) page=Integer.parseInt(pageString);
		
		int maxProduct = productDao.findAll().size();		
		list = productDao.findPage(page-1,12);
		
		req.setAttribute("menu", 2);
		req.setAttribute("maxPage", (int) maxProduct/12 + 1);
		req.setAttribute("page", page);
		req.setAttribute("items", list);
		
		req.getRequestDispatcher("/views/shop.jsp").forward(req, resp);
	}
}