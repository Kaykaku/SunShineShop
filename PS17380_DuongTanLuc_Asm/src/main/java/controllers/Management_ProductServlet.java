package controllers;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import dao.BrandDao;
import dao.CategoryDao;
import dao.ProductDao;
import models.Brand;
import models.Category;
import models.Product;

@MultipartConfig
@WebServlet({
	"/admin/management-product/view",
	"/admin/management-product/edit",
	"/admin/management-product/delete",
	"/admin/management-product/update",
	"/admin/management-product/create",
	})
public class Management_ProductServlet extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	HttpServletRequest req;
	HttpServletResponse resp;
	ProductDao productDao = new ProductDao();
	List<Product> list;	
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp)
	throws ServletException, IOException {
		this.req=req;
		this.resp=resp;
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		String uri = req.getRequestURI();
		if(uri.contains("edit")) {
			int id = Integer.parseInt(req.getParameter("productId"));
			edit(id);
		}else if(uri.contains("delete")) {
			delete();
			resp.sendRedirect("view");
			return;
		}else if(uri.contains("update")) {
			update();
			resp.sendRedirect("view");
			return;
		}else if(uri.contains("view")) {
			clear();
		}else if(uri.contains("create")) {
			create();
			resp.sendRedirect("view");
			return;
		}
		viewTable();
		req.getRequestDispatcher("/views/admin/management-product.jsp").forward(req, resp);
	}
	void viewTable() {
		list = productDao.findAll();
		List<Category> categories = new CategoryDao().findAll(); 
		List<Brand> brands = new BrandDao().findAll(); 
		req.setAttribute("list", list);
		req.setAttribute("categories", categories);
		req.setAttribute("brands", brands);
	}
	void edit(int id) {	
		Product product = productDao.findOne(id);
		req.setAttribute("product", product);
	}
	void delete() {
		int id = Integer.parseInt(req.getParameter("productId"));
		Product product = productDao.findOne(id);
		productDao.delete(product);
		clear();
	}
	void update() {
		Product product = getForm();
		product.setImage(saveImage(product.getProductID()+""));
		productDao.update(product);
		edit(product.getProductID());
	}
	void clear() {
		Product product =new Product();
		req.setAttribute("product", product);
	}
	Product getForm() {
		Product product= new Product();
		try {
			int id =Integer.parseInt(req.getParameter("id"));
			product.setProductID(id);
			product.setProductName(req.getParameter("name"));		
			product.setSize(req.getParameter("size"));
			product.setColor(req.getParameter("color"));
			product.setPrice(Double.parseDouble(req.getParameter("price")));
			product.setQuantity(Integer.parseInt(req.getParameter("quantity")));
			product.setSale(Integer.parseInt(req.getParameter("sale")));
			product.setDescription(req.getParameter("description"));
			product.setCreateDate(new Date());
			
			int brand = Integer.parseInt(req.getParameter("brands"));
			product.setBrand(new BrandDao().findOne(brand));
			
			int cate = Integer.parseInt(req.getParameter("categories"));
			product.setCategory(new CategoryDao().findOne(cate));
			
			
			return product;
		} catch (Exception e) { 
			e.printStackTrace();
		}
		return null;
	}
	void create() {
		Product product = getForm();
		product.setProductID(0);
		product.setImage(saveImage(product.getProductID()+""));
		productDao.create(product);
	}
	String saveImage(String id) {
		File dir = new File(req.getServletContext().getRealPath("/views/images/dummy/products"));
		if(!dir.exists() || dir.isFile()) { 
			dir.delete();
			dir.mkdirs();
		}

		Part photo=null;
		try {
			photo = req.getPart("image");
			int rand = new Random().nextInt(999999999);
			File photoFile = new File(dir, rand+".png");
			photo.write(photoFile.getAbsolutePath());
			System.out.println(photoFile.getAbsolutePath());
			return photoFile.getName();
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return null;
	}
}