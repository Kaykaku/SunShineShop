<%@page import="contraints.Common"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="span4">
    <div class="product">
        <div class="product-img featured">
            <div class="picture">
                <a href="product.html"><img src="<%=Common.url %>/views/images/dummy/products/${param.image}" alt="" width="518" height="358" /></a>
                <div class="img-overlay">
                    <a href="<%=Common.url %>/product_details?id=${param.id}" class="btn more btn-primary" >More</a>
                    <c:choose>
                 	<c:when test="${param.quantity!=0}">
	                 	<form action="<%=Common.url %>/add-to-cart">
                    	<input type="hidden" name="productId" value="${param.id}">
                    	<input type="hidden" name="uri" value="${requestScope['javax.servlet.forward.request_uri']}">
                    	<input type="submit" class="btn buy btn-danger" value="Add to cart">
                    	</form>
	                </c:when>
	                <c:otherwise >
	                 	<form action="#">
                    	<input type="hidden" name="productId" value="${param.id}">
                    	<input type="hidden" name="uri" value="${requestScope['javax.servlet.forward.request_uri']}">
                    	<input type="submit" class="btn buy btn-gray" value="Add to cart" disabled>
                    	</form>
	                </c:otherwise>
                 </c:choose>
                    
                    
                </div>
            </div>
        </div>
        <div class="main-titles">
            <h4 class="title">
            <c:choose>
                 	<c:when test="${param.sale==0}">
	                 	<span class="black-clr">$${param.price}</span>
	                </c:when>
	                <c:otherwise >
	                 	<span class="striked">$${param.price}</span>
	                 	<span class="red-clr"> $${param.salePrice}</span>
	                </c:otherwise>
                 </c:choose>
			</h4>
            <h5 class="no-margin"><a href="product.html">${param.name}</a></h5>
        </div>
        <p class="desc">${fn:substring(param.description, 0, 120)}...</p>
    </div>
</div>