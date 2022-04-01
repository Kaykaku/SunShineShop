<%@page import="dao.BrandDao"%>
<%@page import="models.Brand"%>
<%@page import="dao.CategoryDao"%>
<%@page import="models.Category"%>
<%@page import="java.util.List"%>
<%@page import="contraints.Common"%>
<%@ page session="true"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<div class="master-wrapper">

	<header id="header">
		<div class="darker-row">
			<div class="container">
				<div class="row">

					<c:choose>
						<c:when test="${sessionScope.user!=null}">
							<div class="span3">
								<div class="higher-line">Wellcome! Hello
									${sessionScope.user.getAccountName()==null?sessionScope.user.getUsername():sessionScope.user.getAccountName()}</div>
							</div>
							<div class="span4">
								<div class="higher-line" style="color: red;">${sessionScope.message}</div>
								<%
								request.getSession().removeAttribute("message");
								%>
							</div>
							<div class="span5">
								<div class="topmost-line">
									<div class="higher-line">
										<a href="#" class="gray-link">${sessionScope.user.getAccountName()==null?sessionScope.user.getUsername():sessionScope.user.getAccountName()}
											Profile</a>
										<c:if test="${sessionScope.user.getRole()==0}">
										         &nbsp; | &nbsp; <a href="<%=Common.url%>/admin/home"
												class="red-link">Admin</a>
										</c:if>
										&nbsp; | &nbsp; <a href="<%=Common.url %>/checkout/step1" class="gray-link">Checkout</a>
										&nbsp; | &nbsp; <a
											href="<%=Common.url %>/sign-out?uri=${requestScope['javax.servlet.forward.request_uri']}&id=${id}"
											class="red-link">Log out</a>
									</div>
									&nbsp;

								</div>
							</div>
						</c:when>
						<c:otherwise>
							<div class="span3">
								<div class="higher-line">
									Wellcome! Please <a href="#registerModal" role="button"
										data-toggle="modal">Register</a> or <a href="#loginModal"
										role="button" data-toggle="modal">Login</a>
								</div>
							</div>
							<div class="span4">
								<div class="higher-line" style="color: red;">${sessionScope.message}</div>
								<%
								request.getSession().removeAttribute("message");
								%>
							</div>
							<div class="span5">
								<div class="topmost-line">
									<div class="higher-line">Hello guest ! Are you happy
										today ? &nbsp;</div>
								</div>
							</div>
						</c:otherwise>
					</c:choose>

				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">



				<div class="span7">
					<a class="brand" href="<%=Common.url%>/home"> <img
						src="<%=Common.url%>/views/images/logo.png" alt="Webmarket Logo"
						width="48" height="48" /> <span class="pacifico">Sunshine</span>
						<span class="tagline">By customer for customer</span>
					</a>
				</div>



				<div class="span5">
					<div class="top-right">
						<div class="icons">
							<a href="http://www.facebook.com/"><span
								class="zocial-facebook"></span></a> <a
								href="skype:primozcigler?call"><span class="zocial-skype"></span></a>
							<a href="https://twitter.com/"><span class="zocial-twitter"></span></a>
							<a href="http://eepurl.com/"><span class="zocial-rss"></span></a>
							<a href="#"><span class="zocial-wordpress"></span></a> <a
								href="#"><span class="zocial-android"></span></a> <a href="#"><span
								class="zocial-html5"></span></a> <a href="#"><span
								class="zocial-windows"></span></a> <a href="#"><span
								class="zocial-apple"></span></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>



	<div class="navbar navbar-static-top" id="stickyNavbar">
		<div class="navbar-inner">
			<div class="container">
				<div class="row">
					<div class="span9">
						<button type="button" class="btn btn-navbar"
							data-toggle="collapse" data-target=".nav-collapse">
							<span class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>


						<div class="nav-collapse collapse">
							<ul class="nav" id="mainNavigation">
								<li class="dropdown ${param.menu==1?'active':'' }"><a
									href="<%=Common.url%>/home" class="dropdown-toggle"> Home </a></li>
								<li class="${param.menu==2?'active':'' }"><a
									href="<%=Common.url%>/all-products">All Products</a></li>
								<li class="dropdown ${param.menu==3?'active':'' }"><a
									href="<%=Common.url%>/category" class="dropdown-toggle">Category
										<b class="caret"></b>
								</a>
									<ul class="dropdown-menu">
										<%
										List<Category> list = new CategoryDao().findAll();
										request.setAttribute("list", list);
										%>
										<c:forEach var="item" items="${list}">
											<li><a
												href="<%=Common.url %>/category?categoryId=${item.categoryID}">${item.categoryName}</a></li>
										</c:forEach>
									</ul></li>
								<li class="dropdown ${param.menu==4?'active':'' }"><a
									href="<%=Common.url%>/brand" class="dropdown-toggle">Brand
										<b class="caret"></b>
								</a>
									<ul class="dropdown-menu">
										<%
										List<Brand> listBrand = new BrandDao().findAll();
										request.setAttribute("listBrand", listBrand);
										%>
										<c:forEach var="item" items="${listBrand}">
											<li><a
												href="<%=Common.url %>/brand?brandId=${item.brandID}">${item.brandName}</a></li>
										</c:forEach>
									</ul></li>
								<li class="${param.menu==5?'active':'' }"><a
									href="<%=Common.url%>/news">News</a></li>
								<li class="${param.menu==6?'active':'' }"><a
									href="<%=Common.url%>/about-us">About Us</a></li>
								<li class="${param.menu==7?'active':'' }"><a
									href="<%=Common.url%>/contact-us"" >Contact</a></li>
							</ul>



							<form class="navbar-form pull-right" action="#" method="get">
								<button type="submit">
									<span class="icon-search"></span>
								</button>
								<input type="text" class="span1" name="search"
									id="navSearchInput">
							</form>
						</div>
					</div>


					<c:set var="total" value="0" />
								<c:forEach var="entry" items="${sessionScope.cart}">
								<c:set var="total" value="${total+entry.value.getSubTotal()}" />
					</c:forEach>
					<div class="span3">
						<div class="cart-container" id="cartContainer">
							<div class="cart">
								<p class="items">
									CART <span class="dark-clr">(${sessionScope.cart.size()})</span>
								</p>
								<p class="dark-clr hidden-tablet">$${total }</p>
								<a href="<%=Common.url%>/checkout/step-1" class="btn btn-danger"> <i
									class="icon-shopping-cart"></i>
								</a>
							</div>
							<div class="open-panel">
								<c:set var="total" value="0" />
								<c:forEach var="entry" items="${sessionScope.cart}">

									<div class="item-in-cart clearfix">
										<div class="image">
											<img
												src="<%=Common.url%>/views/images/dummy/products/${entry.value.product.image}"
												width="124" height="124" alt="cart item" />
										</div>
										<div class="desc">
											<strong><a href="<%=Common.url%>/product_details?id=${entry.value.product.productID}">
													${entry.value.product.productName}</a></strong> <span
												class="light-clr qty"> Qty: ${entry.value.quantity}
												&nbsp;
												<form action="#">
													<input type="hidden" name="productId" value="${entry.value.product.productID}">
													<input type="hidden" name="id" value="${id}">
													<input type="hidden" name="uri"
														value="${requestScope['javax.servlet.forward.request_uri']}">
														<input type="submit" formaction="<%=Common.url%>/remove-to-cart" class="btn btn-success"
														value="-">
														<input type="submit" formaction="<%=Common.url%>/add-to-cart" class="btn btn-success"
														value="+">								
														<input type="submit" formaction="<%=Common.url%>/delete-to-cart" class="btn btn-danger"
														value="x">
												</form>
											</span>
										</div>
										<div class="price">
											<strong>$ ${entry.value.getSubTotal()}</strong>
											
										</div>
									</div>
								</c:forEach>

								<div class="summary">
									<div class="line">
										<div class="row-fluid">
											<div class="span6">Shipping:</div>
											<div class="span6 align-right">$0.0</div>
										</div>
									</div>
									<div class="line">
										<div class="row-fluid">
											<div class="span6">Subtotal:</div>
											<div class="span6 align-right size-16">${total}</div>
										</div>
									</div>
								</div>
								<div class="proceed">
									<a href="<%=Common.url%>/checkout/step-1"
										class="btn btn-danger pull-right bold higher">CHECKOUT <i
										class="icon-shopping-cart"></i></a> <small>Shipping costs
										are calculated based on location.</small>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
