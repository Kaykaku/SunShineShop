<%@page import="java.util.HashMap"%>
<%@page import="models.Cart"%>
<%@page import="contraints.Common"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% //Cart itemCart = request.getSession().getAttribute("cart");
%>
<div class="item-in-cart clearfix">
    <div class="image">
        <img src="<%=Common.url %>/views/images/dummy/cart-items/cart-item-1.jpg" width="124" height="124" alt="cart item" />
    </div>
    <div class="desc">
        <strong><a href="product.html"> ${param.product}</a></strong>
        <span class="light-clr qty">
		Qty: ${param.quantity}
		&nbsp;
		<a href="#" class="icon-remove-sign" title="Remove Item"></a>
		</span>
    </div>
    <div class="price">
        <strong>$5914</strong>
    </div>
</div>