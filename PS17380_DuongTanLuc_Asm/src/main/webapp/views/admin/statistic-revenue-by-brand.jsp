<%@page import="contraints.Common"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>


<meta http-equiv="content-type" content="text/html;charset=UTF-8" />


<head>
<title>Sunshine - Admin - Revenue by Brand</title>

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
	<div class="logo">
		<h4>
			<a href="index.html">Sunshine Store<strong> Admin</strong></a>
		</h4>
	</div>
	<%@include file="_menu.jsp"%>
	<div class="wrap">
		<%@include file="_header.jsp"%>
		<h2 class="page-title">
			Statictis <small>Revenue by Brand</small>
		</h2>
			<div class="col-md-12">
				<section class="widget">
					<header>
						<h4>
							<i class="fa fa-align-left"></i> List <span class="fw-semi-bold"></span>
						</h4>
					</header>
					<div class="body">
						<div class="mt">
							<table id="datatable-table"
								class="table table-striped table-hover">
								<thead>
									<tr>
										<th>Id</th>
										<th>Name</th>
										<th>Quantity</th>
										<th class="no-sort hidden-xs">Total</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="item" items="${list3}">
										<tr>
											<td>${item[0] }</td>
											<td><span class="fw-semi-bold">${item[1]}</span></td>
											<td><span class="fw-semi-bold">${item[2]}</span></td>
											<td><span class="fw-semi-bold">$${item[3]}</span></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</section>
			</div>
		</div>

	<script
		src="<%=Common.url%>/views/admin/lib/jquery/dist/jquery.min.js"></script>
	<script
		src="<%=Common.url%>/views/admin/lib/jquery-pjax/jquery.pjax.js"></script>
	<script
		src="<%=Common.url%>/views/admin/lib/bootstrap-sass-official/assets/javascripts/bootstrap.js"></script>
	<script src="<%=Common.url%>/views/admin/lib/widgster/widgster.js"></script>
	<script src="<%=Common.url%>/views/admin/lib/underscore/underscore.js"></script>

	<script src="<%=Common.url%>/views/admin/js/app.js"></script>
	<script src="<%=Common.url%>/views/admin/js/settings.js"></script>

	<script
		src="<%=Common.url%>/views/admin/lib/bootstrap-select/dist/js/bootstrap-select.min.js"></script>
	<script src="<%=Common.url%>/views/admin/lib/underscore/underscore.js"></script>
	<script src="<%=Common.url%>/views/admin/lib/backbone/backbone.js"></script>
	<script
		src="<%=Common.url%>/views/admin/lib/backbone.paginator/lib/backbone.paginator.min.js"></script>
	<script
		src="<%=Common.url%>/views/admin/lib/backgrid/lib/backgrid.min.js"></script>
	<script
		src="<%=Common.url%>/views/admin/lib/backgrid-paginator/backgrid-paginator.js"></script>
	<script
		src="<%=Common.url%>/views/admin/lib/datatables/media/js/jquery.dataTables.min.js"></script>

	<script src="<%=Common.url%>/views/admin/js/tables-dynamic.js"></script>
	<script src="<%=Common.url%>/views/admin/js/forms-validation.js"></script>
	<script
		src="<%=Common.url%>/views/admin/lib/parsleyjs/dist/parsley.min.js"></script>


</body>

</html>