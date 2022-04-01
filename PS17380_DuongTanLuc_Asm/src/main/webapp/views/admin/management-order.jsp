<%@page import="contraints.Common"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>


<meta http-equiv="content-type" content="text/html;charset=UTF-8" />


<head>
<title>Sunshine - Admin - Order</title>

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
								data-parsley-priority-enabled="false"
								data-parsley-excluded="input[name=status]">
								<fieldset>
									<legend class="section">Order form</legend>


									<div class="form-group">
										<label for="normal-field" class="col-sm-4 control-label">ID</label>
										<div class="col-sm-5">
											<input type="number" id="transparent-field"
												value="${order.orderID==0?'':order.orderID}"
												class="form-control input-transparent"
												placeholder="Auto create" disabled> <input name="id"
												type="number" value="${order.orderID }" class="hiding hide">
										</div>
									</div>

									<div class="form-group">
										<label class="col-sm-4 control-label" for="simple-select">Customer</label>
										<div class="col-sm-8">
											<select id="article-status" name="accountID"
												data-style="btn-danger" data-width="auto"
												class="selectpicker">
												<c:forEach var="item" items="${listAccounts}">
													<option value="${item.accountId }" 
													${order.customer.accountId == item.accountId ? 'seleted':''}>
														ID-${item.accountId }
														${ item.accountName==null?item.username:item.accountName }</option>
												</c:forEach>
											</select>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-4 control-label" for="tooltip-enabled">Create
											Date</label>
										<div class="col-sm-5">

											<input  type="date"
												value="<fmt:formatDate value="${order.orderDate}" pattern="yyyy-MM-dd" />"
												id="datetimepicker1" class="form-control input-transparent"
												disabled>
												<input name="date" type="hidden"
												value="<fmt:formatDate value="${order.orderDate}" pattern="yyyy-MM-dd" />"
												>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-4 control-label" for="tooltip-enabled">Address</label>
										<div class="col-sm-5">

											<input  type="text" value="${order.address}" name="address"
												 class="form-control input-transparent" required="required" />
												
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-4 control-label" for="simple-select">Paymentmethod</label>
										<div class="col-sm-8">
											<select id="article-status" name="paymentmethodId"
												data-style="btn-success" data-width="auto"
												class="selectpicker">
												<c:forEach var="item" items="${listPaymentmethods}" >
													<option value="${item.paymentmethodId }" 
														${order.paymentmethod.paymentmethodId==item.paymentmethodId ?'selected':''}>
														${ item.paymentmethodName }</option>
												</c:forEach>
											</select>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-sm-4">Status</label>
										<div class="col-sm-5">
											<div id="gender" class="btn-group" data-toggle="buttons">
												<label
													class="btn ${order.status==0?'btn-primary active':'btn-default' }"
													data-toggle-class="btn-primary"
													data-toggle-passive-class="btn-default"> <input
													type="radio" name="status" value="0"> &nbsp;
													Processing &nbsp;
												</label> <label
													class="btn ${order.status==1?'btn-primary active':'btn-default' }"
													data-toggle-class="btn-primary"
													data-toggle-passive-class="btn-default"> <input
													type="radio" name="status" value="1"> Complete
													&nbsp;
												</label><label
													class="btn ${order.status==2?'btn-primary active':'btn-default' }"
													data-toggle-class="btn-primary"
													data-toggle-passive-class="btn-default"> <input
													type="radio" name="status" value="2"> Cancel &nbsp;
												</label>
											</div>
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
												<a href="delete?orderId=${order.orderID }"
													class="btn btn-danger">Delete</a>
													<a href="<%=Common.url%>/admin/management-order-detail/view?orderId=${order.orderID }"
											class="btn btn-primary" data-placement="top"
											data-original-title=".btn .btn-primary">View Details</a>
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
						<i class="fa fa-align-left"></i> List <span class="fw-semi-bold">Order</span>
					</h4>
				</header>
				<div class="body">
					<div class="mt">
						<table id="datatable-table"
							class="table table-striped table-hover">
							<thead>
								<tr>
									<th>Id</th>
									<th>Create Date</th>
									<th>Customer</th>
									<th class="no-sort hidden-xs">Total price</th>
									<th class="hidden-xs">Paymentmethod</th>
									<th class="hidden-xs">Status</th>
									<th class="no-sort">Edit</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="item" items="${list}">
									<tr>
										<td>${item.orderID }</td>
										<td><span class="fw-semi-bold"><fmt:formatDate
													value="${item.orderDate }" pattern="yyyy-MM-dd HH:mm:ss" /></span></td>
										<td><span class="fw-semi-bold">${item.customer.username }</span></td>
										<td><span class="fw-semi-bold">${item.getTotal() }</span></td>
										<td><span class="fw-semi-bold">${item.paymentmethod.paymentmethodName }</span></td>
										<td><span class="fw-semi-bold">${item.status==0?'Processing': item.status==1?'Complete':'Cancel' }</span></td>
										<td><a href="edit?orderId=${item.orderID }"
											class="btn btn-primary" data-placement="top"
											data-original-title=".btn .btn-primary">Edit</a>
											<a href="<%=Common.url%>/admin/management-order-detail/view?orderId=${item.orderID }"
											class="btn btn-primary" data-placement="top"
											data-original-title=".btn .btn-primary">View Details</a>
											 <a href="delete?orderId=${item.orderID }" class="btn btn-danger"
											data-placement="top" data-original-title=".btn .btn-primary">Delete</a>

										</td>
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