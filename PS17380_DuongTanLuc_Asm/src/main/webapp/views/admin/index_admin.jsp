<%@page import="contraints.Common"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<meta http-equiv="content-type" content="text/html;charset=UTF-8" />

<head>
<title>Sunshine - Admin Dashboard</title>

<link href="<%=Common.url%>/views/admin/css/application.min.css"
	rel="stylesheet">
<link rel="shortcut icon"
	href="<%=Common.url%>/views/admin/img/favicon.png">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<meta charset="utf-8">
</head>

<body class="background-dark">
	<%@include file="_menu.jsp"%>
	<div class="wrap">
		<%@include file="_header.jsp"%>
		<div class="content container">
			<h2 class="page-title">
				SUNSHINE STATUS <small> information</small>
			</h2>
			<div class="row">
				<div class="col-md-2 col-sm-4 col-xs-6">
					<div class="box">
						<div class="icon">
							<i class="fa fa-user"></i>
						</div>
						<div class="description">
							<strong>${users }</strong> Customers
						</div>
					</div>
				</div>

				
				<div class="col-md-2 col-sm-4 col-xs-6">
					<div class="box">
						<div class="icon">
							<i class="fa fa-shopping-cart"></i>
						</div>
						<div class="description">
							<strong>${orders }</strong> Orders
						</div>
					</div>
				</div>
				<div class="col-md-2 col-sm-4 col-xs-6">
					<div class="box">
						<div class="big-text">${products }</div>
						<div class="description">
							<i class="fa fa-arrow-right"></i> Products
						</div>
					</div>
				</div>
				<div class="col-md-2 col-sm-4 col-xs-6">
					<div class="box">
						<div class="big-text">$${total }</div>
						<div class="description">
							<i class="fa fa-usd"></i> Revenue
						</div>
					</div>
				</div>
				
			</div>

			<div class="loader-wrap hiding hide">
				<i class="fa fa-circle-o-notch fa-spin"></i>
			</div>
		</div>
		<!-- common libraries. required for every page-->
		<script
			src="<%=Common.url%>/views/admin/lib/jquery/dist/jquery.min.js"></script>
		<script
			src="<%=Common.url%>/views/admin/lib/jquery-pjax/jquery.pjax.js"></script>
		<script
			src="<%=Common.url%>/views/admin/lib/bootstrap-sass-official/assets/javascripts/bootstrap.js"></script>
		<script src="<%=Common.url%>/views/admin/lib/widgster/widgster.js"></script>
		<script
			src="<%=Common.url%>/views/admin/lib/underscore/underscore.js"></script>

		<!-- common application js -->
		<script src="<%=Common.url%>/views/admin/js/app.js"></script>
		<script src="<%=Common.url%>/views/admin/js/settings.js"></script>



		<!-- page specific scripts -->
		<!-- page libs -->
		<script
			src="<%=Common.url%>/views/admin/lib/slimScroll/jquery.slimscroll.min.js"></script>
		<script
			src="<%=Common.url%>/views/admin/lib/jquery.sparkline/index.js"></script>

		<script src="<%=Common.url%>/views/admin/lib/backbone/backbone.js"></script>
		<script
			src="<%=Common.url%>/views/admin/lib/backbone.localStorage/backbone.localStorage-min.js"></script>

		<script src="<%=Common.url%>/views/admin/lib/d3/d3.min.js"></script>
		<script src="<%=Common.url%>/views/admin/lib/nvd3/nv.d3.min.js"></script>

		<!-- page application js -->
		<script src="<%=Common.url%>/views/admin/js/index.js"></script>
		<script src="<%=Common.url%>/views/admin/js/chat.js"></script>

		<!-- page template -->
</body>


</html>