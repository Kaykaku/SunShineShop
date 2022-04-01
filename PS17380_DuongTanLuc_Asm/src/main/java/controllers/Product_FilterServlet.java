package controllers;

import java.io.IOException;
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

@WebServlet({"/category","/brand"})
public class Product_FilterServlet extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	ProductDao productDao = new ProductDao();
	CategoryDao categoryDao = new CategoryDao();
	BrandDao brandDao = new BrandDao();
	List<Product> list;
	List<Category> listCate;
	List<Brand> listBrand;
	Category category;
	Brand brand;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
	throws ServletException, IOException {
		String uriString = req.getRequestURI();
		String categoryString =req.getParameter("categoryId");
		String brandString =req.getParameter("brandId");
		int categoryId=0,brandId=0;
		if(categoryString!=null) categoryId=Integer.parseInt(categoryString);
		if(brandString!=null) brandId=Integer.parseInt(brandString);
			
		list = productDao.findAll();
		listCate = categoryDao.findAll();
		listBrand = brandDao.findAll();
		category = categoryDao.findOne(categoryId);
		brand = brandDao.findOne(brandId);
		
		req.setAttribute("menu", uriString.contains("category")?3:4);
		req.setAttribute("items", list);
		req.setAttribute("cates", listCate);
		req.setAttribute("brands", listBrand);
		req.setAttribute("category", category);
		req.setAttribute("brand", brand);
		
		req.getRequestDispatcher("/views/shop_by_filter.jsp").forward(req, resp);
	}
}