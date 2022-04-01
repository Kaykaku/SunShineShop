<%@page import="contraints.Common"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>


<meta http-equiv="content-type" content="text/html;charset=UTF-8" />


<head>
<title>Sunshine - Admin - OrderDetail</title>

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
		<div class="content container">
			<h2 class="page-title">
			<a href="<%=Common.url%>/admin/management-order/edit?orderId=${order.orderID}"
											class="btn btn-primary" data-placement="top"
											data-original-title=".btn .btn-primary">Back to Order List</a>
				Bill of Order ${order.orderID}<small> Customer:
					${order.customer.username } </small>
			</h2>
			<div class="row">

				<div class="col-md-6">
					<section class="widget">
						<header>
							<h4>
								<i class="fa fa-pencil"></i> Form
							</h4>
						</header>
						<div class="body">
							<form id="validation-form" method="post" class="form-horizontal"
								enctype="multipart/form-data" novalidate="novalidate"
								data-parsley-priority-enabled="false"
								data-parsley-excluded="input[name=status]">
								<fieldset>
									<legend class="section">Order form</legend>
									<div class="form-group">
										<div class="col-sm-offset-4 col-sm-5">
											<img class="img-rounded"
												src="<%=Common.url %>/views/images/dummy/products/${orderDetail.product.image }"
												alt="" height="150">
										</div>
									</div>
									<div class="form-group">
										<label for="normal-field" class="col-sm-4 control-label">ID</label>
										<div class="col-sm-5">
											<input type="number" id="transparent-field"
												value="${orderDetail.orderDetailID==0?'':orderDetail.orderDetailID}"
												class="form-control input-transparent"
												placeholder="Auto create" disabled> 
												<input name="id" type="hidden" value="${orderDetail.orderDetailID }">
												<input name="orderId" type="hidden" value="${order.orderID }">
												
										</div>
									</div>

									<div class="form-group">
										<label for="normal-field" class="col-sm-4 control-label">Product
											Name</label>
										<div class="col-sm-5">
											<input type="text" id="transparent-field"
												value="${orderDetail.product.productName}"
												class="form-control input-transparent"
												placeholder="Auto create" disabled> <input
												name="productId" type="number"
												value="${orderDetail.product.productID}"
												class="hiding hide">
										</div>
									</div>
									<div class="form-group">
										<label for="hint-field" class="col-sm-4 control-label">
											Price </label>
										<div class="col-sm-5">
											<input name="price" data-parsley-type="number"
												value="${orderDetail.price}" id="appended-input"
												class="form-control input-transparent"
												data-parsley-min="[0]" data-parsley-trigger="change"
												data-parsley-validation-threshold="1" required="required">
										</div>
									</div>
									<div class="form-group">
										<label for="hint-field" class="col-sm-4 control-label">
											Quantity </label>
										<div class="col-sm-5">
											<input name="quantity" type="number"
												value="${orderDetail.quantity}" id="hint-field"
												class="form-control input-transparent" required="required"
												data-parsley-min="[0]" data-parsley-trigger="change"
												data-parsley-validation-threshold="1">
										</div>
									</div>
									<div class="form-group">
										<label for="hint-field" class="col-sm-4 control-label">
											Sale </label>
										<div class="col-sm-5">
											<input name="sale" type="number" value="${orderDetail.sale}"
												id="appended-input" class="form-control input-transparent"
												required="required" data-parsley-min="[0]"
												data-parsley-trigger="change"
												data-parsley-validation-threshold="1">
										</div>
									</div>

								</fieldset>
								<div class="form-actions">
									<div class="row">
										<div class="col-sm-offset-4 col-sm-5">
											<div class="btn-toolbar">
												<input type="submit" formaction="update"
													class="btn btn-primary" value="Update"> <a
													href="delete?orderId=${order.orderID }"
													class="btn btn-danger">Remove</a>
											</div>
										</div>
									</div>
								</div>
							</form>
						</div>
					</section>
				</div>

				<div class="col-md-6">
					<section class="widget">
						<header>
							<h4>
								<i class="fa fa-align-left"></i> List <span class="fw-semi-bold">Order
									Details</span>
							</h4>
						</header>
						<div class="body">
							<div class="mt">
								<table id="" class="table table-striped table-hover">
									<thead>
										<tr>
											<th>Id</th>
											<th>Image</th>
											<th>Name</th>
											<th class="no-sort hidden-xs">Info</th>
											<th class="no-sort">Sub Total</th>
											<th class="no-sort">Edit</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="item" items="${listOrderDetails}">
											<tr>
												<td>${item.orderDetailID }</td>
												<td><img class="img-rounded"
													src="<%=Common.url %>/views/images/dummy/products/${item.product.image }" alt=""
													height="50"></td>
												<td>${item.product.productName }</td>
												</td>
												<td class="hidden-xs"><small> <span
														class="fw-semi-bold">Quantity:</span> &nbsp; <span
														class="label bg-gray-light">${item.quantity }</span>
												</small> <br> <small> <span class="fw-semi-bold">Price:</span>
														&nbsp;<span class="label bg-gray-light">${item.price }$</span>
												</small> <br> <small> <span class="fw-semi-bold">Sale:</span>
														&nbsp;<span class="label label-warning">${item.sale }%</span>
												</small></td>
												<td><span class="label label-success">$${item.getSubTotal()}</span> </td>

												<td><a href="edit?orderId=${order.orderID}&&orderDetailId=${item.orderDetailID}" class="btn btn-primary" data-placement="top" data-original-title=".btn .btn-primary">Edit</a> 
													<a href="delete?orderId=${order.orderID}&&orderDetailId=${item.orderDetailID}" class="btn btn-danger"
													data-placement="top"
													data-original-title=".btn .btn-primary">Remove</a></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<div class="form-actions">
									<div class="row">
										<div class="col-sm-offset-1 col-sm-12">
											<div class="form-group">
												<label for="hint-field" class="col-sm-7 control-label">
													TOTAL </label>
												<div class="col-sm-5"><strong>$${order.getTotal()}</strong></div>
											</div>
										</div>
									</div>
								</div>
							</div>
					</section>
				</div>
			</div>
			<section class="widget">
				<header>
					<h4>
						<i class="fa fa-align-left"></i> List <span class="fw-semi-bold">Products</span>
					</h4>
				</header>
				<div class="body">
					<div class="mt">
						<table id="datatable-table"
							class="table table-striped table-hover">
							<thead>
								<tr>
									<th>Id</th>
									<th>Image</th>
									<th>Name</th>
									<th class="no-sort hidden-xs">Info</th>
									<th class="hidden-xs">Description</th>
									<th class="hidden-xs">Classify</th>
									<th class="no-sort">Edit</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="item" items="${listProducts}">
									<tr>
										<td>${item.productID }</td>
										<td><img class="img-rounded"
											src="<%=Common.url %>/views/images/dummy/products/${item.image }" alt=""
											height="50"></td>
										<td><span class="fw-semi-bold">${item.productName }</span></td>
										<td class="hidden-xs"><small> <span
												class="fw-semi-bold">Size:</span> &nbsp; ${item.size }
										</small> <br> <small> <span class="fw-semi-bold">Color:</span>
												&nbsp; ${item.color }
										</small> <br> <small> <span class="fw-semi-bold">Create
													Date:</span> &nbsp; ${item.createDate }
										</small></td>
										<td class="hidden-xs"><small> <span
												class="fw-semi-bold">Quantity:</span> &nbsp; <span
												class="label bg-gray-light">${item.quantity }</span>
										</small> <br> <small> <span class="fw-semi-bold">Price:</span>
												&nbsp;<span class="label bg-gray-light">${item.price }$</span>
										</small> <br> <small> <span class="fw-semi-bold">Sale:</span>
												&nbsp;<span class="label label-warning">${item.sale }%</span>
										</small></td>
										<td class="hidden-xs"><small> <span
												class="fw-semi-bold">Category:</span> &nbsp; <span
												class="label label-danger">${item.category.categoryName }</span>
										</small> <br> <small> <span class="fw-semi-bold">Brand:</span>
												&nbsp; <span class="label label-success">${item.brand.brandName }</span>
										</small></td>
										<td><a href="create?orderId=${order.orderID}&&productId=${item.productID }"
											class="btn btn-primary" data-placement="top"
											data-original-title=".btn .btn-primary">Add to Order</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</section>
			<div class="loader-wrap hiding hide">
				<i class="fa fa-circle-o-notch fa-spin"></i>
			</div>
		</div>
	</div>
	<script src="<%=Common.url%>/views/admin/lib/jquery/dist/jquery.min.js"></script>
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