package controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AccountDao;
import dao.BrandDao;
import dao.CategoryDao;
import dao.ProductDao;
import dao.StatictisDao;
import models.Account;
import models.Brand;
import models.Category;
import models.Order;
import models.OrderDetail;
import models.Product;

@MultipartConfig
@WebServlet({
	"/admin/statictis/best-product-seller",
	"/admin/statictis/revenue-by-category",
	"/admin/statictis/revenue-by-brand",
	"/admin/statictis/revenue-by-account",
	})
public class StatictisServlet extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	HttpServletRequest req;
	HttpServletResponse resp;
	AccountDao dao = new AccountDao();
	List<Account> list;	
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp)
	throws ServletException, IOException {
		this.req=req;
		this.resp=resp;
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		String uri = req.getRequestURI();
		if(uri.contains("best-product-seller")) {
			bestProductSeller();
			req.getRequestDispatcher("/views/admin/statistic-best-product-seller.jsp").forward(req, resp);
		}else if(uri.contains("revenue-by-category")) {
			revenueByCategory();
			req.getRequestDispatcher("/views/admin/statistic-revenue-by-category.jsp").forward(req, resp);
		}else if(uri.contains("revenue-by-brand")) {
			revenueByBrand();
			req.getRequestDispatcher("/views/admin/statistic-revenue-by-brand.jsp").forward(req, resp);
		}else if(uri.contains("revenue-by-account")) {
			revenueByAccount();
			req.getRequestDispatcher("/views/admin/statistic-revenue-by-account.jsp").forward(req, resp);
		}
		
		
	}
	void bestProductSeller() {
//		List<Object[]> list1 = new StatictisDao().bestProductSeller();
		List<Object[]> list1 = new ArrayList<Object[]>();
		List<Product> listP = new ProductDao().findAll();
		
		for (Product product : listP) {	
			double total = 0;
			double quantity = 0;
			for (OrderDetail orderDetail : product.getOrderDetails()) {
				total+= orderDetail.getSubTotal();
				quantity+=orderDetail.getQuantity();
			}	
			list1.add(new Object[] {product.getProductID(),product.getImage(),product.getProductName(),product.getOrderDetails().size(),quantity,total});
		}
		
		req.setAttribute("list1", list1);		
	}
	void revenueByCategory() {
		List<Category> listCate = new CategoryDao().findAll();
		
		List<Object[]> list2 =new ArrayList<Object[]>();
		for (Category category : listCate) {
			List<Product> listP = new ProductDao().findByCategory(category.getCategoryID());
			if (listP==null) {
				continue;
			}
			double total = 0;
			double quantity = 0;
			for (Product product : listP) {				
				for (OrderDetail orderDetail : product.getOrderDetails()) {
					total+= orderDetail.getSubTotal();
					quantity+=orderDetail.getQuantity();
				}				
			}
			list2.add(new Object[] {category.getCategoryID(),category.getCategoryName(),quantity,total});
		}
		req.setAttribute("list2", list2);		
	}
	void revenueByBrand() {
		List<Brand> listBrands = new BrandDao().findAll();
		
		List<Object[]> list3 =new ArrayList<Object[]>();
		for (Brand brand : listBrands) {
			List<Product> listP = new ProductDao().findByBrand(brand.getBrandID());
			if (listP==null) {
				continue;
			}
			double total = 0;
			double quantity = 0;
			for (Product product : listP) {				
				for (OrderDetail orderDetail : product.getOrderDetails()) {
					total+= orderDetail.getSubTotal();
					quantity+=orderDetail.getQuantity();
				}				
			}
			total = (double) Math.round(total*100)/100;
			list3.add(new Object[] {brand.getBrandID(),brand.getBrandName(),quantity,total});
		}
		req.setAttribute("list3", list3);		
	}
	void revenueByAccount() {
		List<Account> listAccount = new AccountDao().findAll();
		
		List<Object[]> list4 =new ArrayList<Object[]>();
		for (Account account : listAccount) {
			List<Order> listP = account.getOrders();			
			if (listP==null) {
				continue;
			}
			double total = 0;
			double quantity = 0;
			for (Order order : listP) {				
					total+= order.getTotal();
					quantity++;			
			}
			total = (double) Math.round(total*100)/100;
			list4.add(new Object[] {account.getAccountId(),account.getUsername(),account.getBirthDay(),!account.isGender()?"Male":"Female",quantity,total});
		}
		req.setAttribute("list4", list4);		
	}
}