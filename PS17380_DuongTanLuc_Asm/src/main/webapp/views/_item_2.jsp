<%@page import="contraints.Common"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<c:choose>
	<c:when test="${param.type==1}">

	</c:when>
	<c:when test="${param.type==2}">
		<div class="span3 isotope--target filter--${param.cateId}"
			data-price="1262" data-popularity="2" data-size="xs|l"
			data-color="red" data-brand="brand${param.brandId}">
	</c:when>
	<c:otherwise>
		<div class="span3">
	</c:otherwise>
</c:choose>
<div class="product">
	<div class="product-inner">
		<c:choose>
			<c:when test="${param.quantity==0}">
				<div class="stamp blue">SOLD</div>
			</c:when>
			<c:when test="${param.sale!=0}">
				<div class="stamp red">-${param.sale}%</div>
			</c:when>
			<c:otherwise>

			</c:otherwise>
		</c:choose>

		<div class="product-img">
			<div class="picture">
				<a href="product.html"><img
					src="<%=Common.url %>/views/images/dummy/products/${param.image}"
					alt="" width="540" height="374" /></a>
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
                    	<input type="submit" class="btn buy btn-gray" value="Add to cart"  disabled>
                    	</form>
	                </c:otherwise>
                 </c:choose>
                    
                    
                </div>
			</div>
		</div>
		<div class="main-titles no-margin">
			<h4 class="title">
				<c:choose>
					<c:when test="${param.sale==0}">
						<span class="black-clr">$${param.price}</span>
					</c:when>
					<c:otherwise>
						<span class="striked">$${param.price}</span>
						<span class="red-clr"> $${param.salePrice}</span>
					</c:otherwise>
				</c:choose>

			</h4>
			<h5 class="no-margin">${param.name}</h5>
		</div>
		<p class="desc">${fn:substring(param.description, 0, 120)}...</p>
		<div class="row-fluid hidden-line">
			<div class="span6">
				<a href="#" class="btn btn-small"><i class="icon-heart"></i></a> <a
					href="#" class="btn btn-small"><i class="icon-exchange"></i></a>
			</div>
			<div class="span6 align-right">
				<span class="icon-star stars-clr"></span> <span
					class="icon-star stars-clr"></span> <span
					class="icon-star stars-clr"></span> <span
					class="icon-star stars-clr"></span> <span
					class="icon-star stars-clr"></span>
			</div>
		</div>
	</div>
</div>
</div>