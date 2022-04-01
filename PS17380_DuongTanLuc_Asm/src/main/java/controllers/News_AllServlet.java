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

@WebServlet("/news")
public class News_AllServlet extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	NewsDao newsDao = new NewsDao();
	List<News> list;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
	throws ServletException, IOException {
		String pageString =req.getParameter("page");
		int page=1;
		if(pageString!=null) page=Integer.parseInt(pageString);
		
		int maxProduct = newsDao.findAll().size();		
		list = newsDao.findPage(page-1,5);
		
		req.setAttribute("menu", 5);
		req.setAttribute("maxPage", (int) maxProduct/5 + 1);
		req.setAttribute("page", page);
		req.setAttribute("items", list);
		
		req.getRequestDispatcher("/views/news.jsp").forward(req, resp);
	}
}