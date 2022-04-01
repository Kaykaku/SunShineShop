package controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import dao.NewsDao;
import models.News;


@WebServlet("/news-details")
public class News_DetailServlet extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;


	NewsDao newsDao = new NewsDao();
	News news;
	List<News> list;
	
	@Override
	public void init() throws ServletException {
		list = newsDao.findAll();
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
	throws ServletException, IOException {
		int id=Integer.parseInt(req.getParameter("id"));
		news =newsDao.findOne(id);
		req.setAttribute("id", id);
		
		req.setAttribute("menu", 0);
		req.setAttribute("item", news);
		req.getRequestDispatcher("/views/news_details.jsp").forward(req, resp);
	}
	

}