<%@page import="contraints.Common"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>


<meta http-equiv="content-type" content="text/html;charset=UTF-8" />


<head>
<title>Sunshine - Admin - Product</title>

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
			<div class="row">

				<div class="col-md-12">
					<section class="widget">
						<header>
							<h4>
								<i class="fa fa-pencil"></i> Form
							</h4>
						</header>
						<div class="body">
							<form id="validation-form" method="post" class="form-horizontal"
								enctype="multipart/form-data" novalidate="novalidate"
								data-parsley-priority-enabled="false">
								<fieldset>
									<legend class="section">Product form</legend>
									<div class="form-group">
										<div class="col-sm-offset-4 col-sm-5">
											<img class="img-rounded"
												src="<%=Common.url %>/views/images/dummy/products/${product.image }" alt=""
												height="250">
										</div>
									</div>

									<div class="form-group">
										<label for="normal-field" class="col-sm-4 control-label">ID</label>
										<div class="col-sm-5">
											<input type="number" id="transparent-field"
												value="${product.productID }"
												class="form-control input-transparent"
												placeholder="Auto create" disabled> <input name="id"
												type="number" value="${product.productID }"
												class="hiding hide">
										</div>
									</div>
									<div class="form-group">
										<label for="hint-field" class="col-sm-4 control-label">
											Picture </label>
										<div class="col-sm-5">
											<input name="image" type="file" id="transparent-field"
												class="form-control input-transparent"
												placeholder="Stylish, huh??" required="required">
										</div>
									</div>
									<div class="form-group">
										<label for="hint-field" class="col-sm-4 control-label">
											Name </label>
										<div class="col-sm-5">
											<input type="text" name="name"
												value="${product.productName }" id="hint-field"
												class="form-control input-transparent" required="required">
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-4 control-label" for="tooltip-enabled">Create
											Date</label>
										<div class="col-sm-5">

											<input name="date" type="date"
												value="<fmt:formatDate value="${product.createDate}" pattern="yyyy-MM-dd" />"
												id="datetimepicker1" class="form-control input-transparent"
												disabled>
										</div>
									</div>
									<div class="form-group">
										<label for="hint-field" class="col-sm-4 control-label">
											Size </label>
										<div class="col-sm-5">
											<input name="size" type="text" value="${product.size }"
												id="hint-field" class="form-control input-transparent">
										</div>
									</div>
									<div class="form-group">
										<label for="hint-field" class="col-sm-4 control-label">
											Color </label>
										<div class="col-sm-5">
											<input name="color" type="text" id="hint-field"
												class="form-control input-transparent"
												value="${product.color }">
										</div>
									</div>
									<div class="form-group">
										<label for="hint-field" class="col-sm-4 control-label">
											Price </label>
										<div class="col-sm-5">
											<input name="price" data-parsley-type="number"
												value="${product.price }" id="appended-input"
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
												value="${product.quantity }" id="hint-field"
												class="form-control input-transparent" required="required"
												data-parsley-min="[0]" data-parsley-trigger="change"
												data-parsley-validation-threshold="1">
										</div>
									</div>
									<div class="form-group">
										<label for="hint-field" class="col-sm-4 control-label">
											Sale </label>
										<div class="col-sm-5">
											<input name="sale" type="number" value="${product.sale }"
												id="appended-input" class="form-control input-transparent"
												required="required" data-parsley-min="[0]"
												data-parsley-trigger="change"
												data-parsley-validation-threshold="1">
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-4 control-label" for="simple-select">Category</label>
										<div class="col-sm-8">
											<select id="article-category" name="categories"
												data-style="btn-danger" data-width="auto"
												class="selectpicker">
												<c:forEach var="item" items="${categories}">
													<option value="${item.categoryID }"
														${ product.category.categoryID ==item.categoryID ? 'selected':''}>${item.categoryName }</option>
												</c:forEach>
											</select>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-4 control-label" for="simple-select">Brand</label>
										<div class="col-sm-8">
											<select id="article-status" name="brands"
												data-style="btn-success" data-width="auto"
												class="selectpicker">
												<c:forEach var="item" items="${brands}">
													<option value="${item.brandID }"
														${ product.brand.brandID ==item.brandID ? 'selected':''}>${item.brandName }</option>
												</c:forEach>
											</select>
										</div>
									</div>
									<div class="form-group">
										<label for="description" class="col-sm-4 control-label">Description</label>
										<div class="col-sm-5">
											<textarea name="description" rows="6"
												class="autogrow form-control transition-height input-transparent"
												id="elastic-textarea">${product.description }</textarea>
										</div>
									</div>
								</fieldset>
								<div class="form-actions">
									<div class="row">
										<div class="col-sm-offset-4 col-sm-5">
											<div class="btn-toolbar">
												<a href="view" class="btn btn-primary">New</a> <input
													type="submit" formaction="create" class="btn btn-primary"
													value="Create"> <input type="submit"
													formaction="update" class="btn btn-primary" value="Update">
												<a href="delete?productId=${product.productID }"
													class="btn btn-danger">Delete</a>
											</div>
										</div>
									</div>
								</div>
							</form>
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
								<c:forEach var="item" items="${list}">
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
										<td><a href="edit?productId=${item.productID }"
											class="btn btn-primary" data-placement="top"
											data-original-title=".btn .btn-primary">Edit</a> <a
											href="delete?productId=${item.productID }"
											class="btn btn-danger" data-placement="top"
											data-original-title=".btn .btn-primary">Delete</a></td>
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