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

import dao.NewsDao;
import dao.ProductDao;
import models.News;
import models.Product;

@WebServlet({"/home"})
public class HomeServlet extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	ProductDao productDao = new ProductDao();
	NewsDao newsDao = new NewsDao();
	List<Product> list;
	List<News> listNews;
	
	@Override
	public void init() throws ServletException {
		list = productDao.findAll();
		listNews = newsDao.findAllDescByDate();
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
	throws ServletException, IOException {
		req.setAttribute("menu", 1);
		req.setAttribute("randomItem1", getRandomProduct(3));
		req.setAttribute("randomItem2", getRandomProduct(3));
		req.setAttribute("randomItem3", getRandomProduct(8));
		req.setAttribute("randomItem4", getRandomProduct(4));
		req.setAttribute("descNews", listNews);
		req.getRequestDispatcher("/views/index.jsp").forward(req, resp);
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