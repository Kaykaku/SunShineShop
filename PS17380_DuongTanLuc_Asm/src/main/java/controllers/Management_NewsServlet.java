package controllers;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.NewsDao;
import models.Account;
import models.News;

@MultipartConfig
@WebServlet({
	"/admin/management-news/view",
	"/admin/management-news/edit",
	"/admin/management-news/delete",
	"/admin/management-news/update",
	"/admin/management-news/create",
	})
public class Management_NewsServlet extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	HttpServletRequest req;
	HttpServletResponse resp;
	NewsDao dao = new NewsDao();
	List<News> list;	
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp)
	throws ServletException, IOException {
		this.req=req;
		this.resp=resp;
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		String uri = req.getRequestURI();
		if(uri.contains("edit")) {
			int id = Integer.parseInt(req.getParameter("newId"));
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
		req.getRequestDispatcher("/views/admin/management-news.jsp").forward(req, resp);
	}
	void view() {
		list = dao.findAll();
		req.setAttribute("list", list);
	}
	void edit(int id) {	
		News news = dao.findOne(id);
		req.setAttribute("news", news);
	}
	void delete() {
		int id = Integer.parseInt(req.getParameter("newId"));
		News news = dao.findOne(id);
		dao.delete(news);
		clear();
	}
	void update() {
		News news = getForm();
		dao.update(news);
		edit(news.getNewId());
	}
	void clear() {
		News news =new News();
		news.setAccount((Account)req.getSession().getAttribute("user"));
		req.setAttribute("news", news);
	}
	News getForm() {
		News news= new News();
		try {
			int id =Integer.parseInt(req.getParameter("id"));
			news.setNewId(id);
			news.setCreateDate(new Date());
			news.setAccount((Account)req.getSession().getAttribute("user"));
			news.setTitle(req.getParameter("title"));
			news.setDescription(req.getParameter("description"));
			news.setContent(req.getParameter("content"));
			
			return news;
		} catch (Exception e) { 
			e.printStackTrace();
		}
		return null;
	}
	void create() {
		News news = getForm();
		news.setNewId(0);
		dao.create(news);
	}
}