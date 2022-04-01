package filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import contraints.Common;
import models.Account;
import utils.HttpFilter;

@WebFilter({
	"/admin/*",
	"/checkout/*"
})
public class AuthFilter implements HttpFilter {
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		HttpServletRequest req =(HttpServletRequest)request;
		HttpServletResponse res =(HttpServletResponse)response;
		String uri = req.getRequestURI();
		System.out.println("ABC");
		Account account = (Account) req.getSession().getAttribute("user");
		String error="";
		if(account==null) {
			error=res.encodeURL("Please log in!");
		} else if(account.getRole()!=0&& uri.contains("/admin")) {
			error = res.encodeURL("Please login with admin account");
		}
		if(!error.isEmpty()) {
			req.getSession().setAttribute("securi", uri);
			req.getSession().setAttribute("message", error);
			res.sendRedirect(Common.url+"/home");
		}else {
			chain.doFilter(request, response);
		}
		
	}
}
