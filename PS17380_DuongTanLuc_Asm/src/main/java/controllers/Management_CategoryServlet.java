package controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CategoryDao;
import models.Category;
import models.Product;

@MultipartConfig
@WebServlet({
	"/admin/management-category/view",
	"/admin/management-category/edit",
	"/admin/management-category/delete",
	"/admin/management-category/update",
	"/admin/management-category/create",
	})
public class Management_CategoryServlet extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	HttpServletRequest req;
	HttpServletResponse resp;
	CategoryDao categoryDao = new CategoryDao();
	List<Category> listCategories;	
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp)
	throws ServletException, IOException {
		this.req=req;
		this.resp=resp;
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		String uri = req.getRequestURI();
		if(uri.contains("edit")) {
			int id = Integer.parseInt(req.getParameter("categoryId"));
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
		}
		view();
		req.getRequestDispatcher("/views/admin/management-category.jsp").forward(req, resp);
	}
	void view() {
		listCategories = categoryDao.findAll();
		req.setAttribute("listCategories", listCategories);
	}
	void edit(int id) {	
		Category category = categoryDao.findOne(id);
		req.setAttribute("category", category);
	}
	void delete() {
		int id = Integer.parseInt(req.getParameter("categoryId"));
		Category category = categoryDao.findOne(id);
		categoryDao.delete(category);
		clear();
	}
	void update() {
		Category category = getForm();
		categoryDao.update(category);
		edit(category.getCategoryID());
	}
	void clear() {
		Product product =new Product();
		req.setAttribute("product", product);
	}
	Category getForm() {
		Category category= new Category();
		try {
			int id =Integer.parseInt(req.getParameter("id"));
			category.setCategoryID(id);
			category.setCategoryName(req.getParameter("name"));
			return category;
		} catch (Exception e) { 
			e.printStackTrace();
		}
		return null;
	}
	void create() {
		Category category = getForm();
		category.setCategoryID(0);
		categoryDao.create(category);
	}
}