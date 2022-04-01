package controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BrandDao;
import dao.CategoryDao;
import dao.ProductDao;
import models.Brand;
import models.Category;
import models.Product;

@WebServlet("/product_details")
public class Product_DetailServlet extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	ProductDao productDao = new ProductDao();
	CategoryDao categoryDao = new CategoryDao();
	BrandDao brandDao = new BrandDao();
	Product product;
	Category category;
	Brand brand;
	List<Product> list;
	
	@Override
	public void init() throws ServletException {
		list = productDao.findAll();
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp)
	throws ServletException, IOException {
		int id=Integer.parseInt(req.getParameter("id"));
		req.setAttribute("id", id);
		product =productDao.findOne(id);
		
		category = product.getCategory();
		brand = product.getBrand();
		
		req.setAttribute("menu", 0);
		req.setAttribute("item", product);
		req.setAttribute("category", category);
		req.setAttribute("brand", brand);
		req.setAttribute("randomItem", getRandomProduct(4));
		req.getRequestDispatcher("/views/product_details.jsp").forward(req, resp);
	}
	
	List<Product> getRandomProduct(int number) {
		HashSet<Product> set = new HashSet<Product>();
		while (set.size() != number) {
			int randomNum = (int)(Math.random() * (list.size()-1));
			set.add(list.get(randomNum));
		}
		List<Product> list = new ArrayList<Product>();
		list.addAll(set);
		return list;
	}
}