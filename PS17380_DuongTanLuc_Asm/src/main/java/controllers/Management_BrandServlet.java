package controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BrandDao;
import models.Brand;

@MultipartConfig
@WebServlet({
	"/admin/management-brand/view",
	"/admin/management-brand/edit",
	"/admin/management-brand/delete",
	"/admin/management-brand/update",
	"/admin/management-brand/create",
	})
public class Management_BrandServlet extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	HttpServletRequest req;
	HttpServletResponse resp;
	BrandDao brandDao = new BrandDao();
	List<Brand> listBrands;	
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp)
	throws ServletException, IOException {
		this.req=req;
		this.resp=resp;
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		String uri = req.getRequestURI();
		if(uri.contains("edit")) {
			int id = Integer.parseInt(req.getParameter("brandId"));
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
		req.getRequestDispatcher("/views/admin/management-brand.jsp").forward(req, resp);
	}
	void view() {
		listBrands = brandDao.findAll();
		req.setAttribute("listBrands", listBrands);
	}
	void edit(int id) {	
		Brand brand = brandDao.findOne(id);
		req.setAttribute("brand", brand);
	}
	void delete() {
		int id = Integer.parseInt(req.getParameter("brandId"));
		Brand brand = brandDao.findOne(id);
		brandDao.delete(brand);
		clear();
	}
	void update() {
		Brand brand = getForm();
		brandDao.update(brand);
		edit(brand.getBrandID());
	}
	void clear() {
		Brand brand =new Brand();
		req.setAttribute("brand", brand);
	}
	Brand getForm() {
		Brand brand= new Brand();
		try {
			int id =Integer.parseInt(req.getParameter("brandId"));
			brand.setBrandID(id);
			brand.setBrandName(req.getParameter("brandName"));
			
			return brand;
		} catch (Exception e) { 
			e.printStackTrace();
		}
		return null;
	}
	void create() {
		Brand brand = getForm();
		brand.setBrandID(0);
		brandDao.create(brand);
	}
}