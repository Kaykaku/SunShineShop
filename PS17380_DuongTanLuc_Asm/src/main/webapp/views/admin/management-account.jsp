<%@page import="contraints.Common"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>


<meta http-equiv="content-type" content="text/html;charset=UTF-8" />


<head>
<title>Sunshine - Admin - Account</title>

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

				<div class="col-md-6">
					<section class="widget">
						<header>
							<h4>
								<i class="fa fa-pencil"></i> Account
							</h4>
						</header>
						<div class="body">
							<form id="validation-form" method="post" class="form-horizontal"
								enctype="multipart/form-data" novalidate="novalidate"
								data-parsley-excluded="input[name=gender]"
								data-parsley-priority-enabled="false">
								<fieldset>
									<legend class="section">Account info form</legend>

									<div class="form-group">
										<label for="normal-field" class="col-sm-4 control-label">ID</label>
										<div class="col-sm-6">
											<input type="number" id="transparent-field"
												value="${account.accountId }"
												class="form-control input-transparent"
												placeholder="Auto create" disabled> <input name="id"
												type="hidden" value="${account.accountId }">
										</div>
									</div>

									<div class="form-group">
										<label for="hint-field" class="col-sm-4 control-label">
											Name </label>
										<div class="col-sm-6">
											<input type="text" name="name"
												value="${account.accountName }" id="hint-field"
												class="form-control input-transparent" required="required">
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-sm-4">Gender</label>
										<div class="col-sm-6">
											<div id="gender" class="btn-group" data-toggle="buttons">
												<label
													class="btn ${!account.isGender()?'btn-primary active':'btn-default' }"
													data-toggle-class="btn-primary"
													data-toggle-passive-class="btn-default"> <input
													type="radio" name="gender" value="false"> &nbsp;
													Male &nbsp;
												</label> <label
													class="btn ${account.isGender()?'btn-primary active':'btn-default' }"
													data-toggle-class="btn-primary"
													data-toggle-passive-class="btn-default"> <input
													type="radio" name="gender" value="true">
													Female
												</label>
											</div>
										</div>
									</div>
									<div class="form-group">

										<label class="col-sm-4 control-label" for="tooltip-enabled">Birth
											Day</label>
										<div class="col-sm-6">
											<input name="birthdate" type="date"
												value="<fmt:formatDate value="${account.birthDay}" pattern="yyyy-MM-dd" />"
												id="datetimepicker1" class="form-control input-transparent">
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-4 control-label" for="tooltip-enabled">Create
											Date</label>
										<div class="col-sm-6">
											<jsp:useBean id="now" class="java.util.Date" />
											<input name="date" type="date"
												value="<fmt:formatDate value="${account.createDate}" pattern="yyyy-MM-dd" />"
												id="datetimepicker1" class="form-control input-transparent"
												disabled>
										</div>
									</div>
									<div class="form-group">
										<label for="hint-field" class="col-sm-4 control-label">
											Address </label>
										<div class="col-sm-6">
											<input type="text" name="address" value="${account.address }"
												id="hint-field" class="form-control input-transparent">
										</div>
									</div>
									<div class="form-group">
										<label for="hint-field" class="col-sm-4 control-label">
											Phone </label>
										<div class="col-sm-6">
											<input name="phone" type="text"
												value="${account.phoneNumber }" id="hint-field"
												class="form-control input-transparent">
										</div>
									</div>
								</fieldset>


								<div class="form-actions">
									<div class="row">
										<div class="col-sm-offset-4 col-sm-5">
											<div class="btn-toolbar">
												<input type="submit" formaction="update-info"
													class="btn btn-primary" value="Update account">
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
								<i class="fa fa-pencil"></i> Account
							</h4>
						</header>
						<div class="body">
							<form id="validation-form" method="post" class="form-horizontal"
								enctype="multipart/form-data" novalidate="novalidate"
								data-parsley-priority-enabled="false">
								<fieldset>
									<legend class="section">Account login form</legend>

									<div class="form-group">
										<label for="normal-field" class="col-sm-4 control-label">ID</label>
										<div class="col-sm-6">
											<input type="number" id="transparent-field"
												value="${account.accountId }"
												class="form-control input-transparent"
												placeholder="Auto create" disabled> <input name="id"
												type="hidden" value="${account.accountId }">
										</div>
									</div>


									<div class="form-group">
										<label class="col-sm-4 control-label" for="prepended-input">Username</label>
										<div class="col-sm-6">
											<div class="input-group">
												<span class="input-group-addon"><i class="fa fa-user"></i></span>
												<input id="prepended-input"
													class="form-control input-transparent" size="16"
													type="text" placeholder="Username" name="username"
													required="required" value="${account.username }">
											</div>
										</div>
									</div>
									<div class="form-group">
										<label for="hint-field" class="col-sm-4 control-label">
											Email </label>
										<div class="col-sm-6">
											<input name="email" type="email" id="hint-field"
												class="form-control input-transparent"
												value="${account.email }" required="required">
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-4 control-label" for="password-field">Password</label>
										<div class="col-sm-6">
											<div class="input-group">
												<span class="input-group-addon"><i class="fa fa-lock"></i></span>
												<input type="password"
													class="form-control input-transparent" id="password-field"
													placeholder="Password" name="password" required="required"
													value="${account.password }">
											</div>
										</div>
									</div>

									<div class="form-group">
										<label class="col-sm-4 control-label" for="password-field">Status</label>
										<div class="col-sm-6">
											<div class="radio">
												<input type="radio" name="active" id="radio1" value="true"
													${account.isActive()?'checked':''}> <label for="radio1"> Active </label>
											</div>
											<div class="radio">
												<input type="radio" name="active" id="radio2" value="false" ${!account.isActive()?'checked':''}>
												<label for="radio2"> Inactive </label>
											</div>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-4 control-label" for="password-field">Role</label>
										<div class="col-sm-6">
											<div class="radio radio-danger">
												<input type="radio" name="role" id="radio3" value="true" ${account.role==0?'checked':''}
													 > <label for="radio3"> Admin </label>
											</div>
											<div class="radio radio-danger">
												<input type="radio" name="role" id="radio4" value="false" ${account.role!=0?'checked':''}>
												<label for="radio4"> User </label>
											</div>
										</div>
									</div>
								</fieldset>
								<div class="form-actions">
									<div class="row">
										<div class="col-sm-offset-3 col-sm-8">
											<div class="btn-toolbar">
												<a href="view" class="btn btn-primary">New</a> <input
													type="submit" formaction="create" class="btn btn-primary"
													value="Create"> <input type="submit"
													formaction="update" class="btn btn-primary" value="Update">
												<a href="delete?accountId=${account.accountId  }"
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
						<i class="fa fa-align-left"></i> List <span class="fw-semi-bold">Accounts</span>
					</h4>
				</header>
				<div class="body">
					<div class="mt">
						<table id="datatable-table"
							class="table table-striped table-hover">
							<thead>
								<tr>
									<th>Id</th>
									<th>Username</th>
									<th>Info</th>
									<th class="no-sort hidden-xs">Contact</th>
									<th class="hidden-xs">Status</th>
									<th class="no-sort">Edit</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="item" items="${list}">
									<tr>
										<td>${item.accountId  }</td>
										<td><span class="fw-semi-bold">${item.username }</span></td>
										<td class="hidden-xs"><small> <span
												class="fw-semi-bold">Name:</span> &nbsp; ${item.accountName}
										</small> <br> <small> <span class="fw-semi-bold">BirthDay</span>
												&nbsp; ${item.birthDay }
										</small> <br> <small> <span class="fw-semi-bold">Create
													Date:</span> &nbsp; ${item.createDate }
										</small></td>
										<td class="hidden-xs"><small> <span
												class="fw-semi-bold">Address:</span> &nbsp; <span
												class="label bg-gray-light">${item.address }</span>
										</small> <br> <small> <span class="fw-semi-bold">Phone:</span>
												&nbsp;<span class="label bg-gray-light">${item.phoneNumber }</span>
										</small> <br> <small> <span class="fw-semi-bold">Email:</span>
												&nbsp;<span class="label label-warning">${item.email }</span>
										</small></td>
										<td class="hidden-xs"><small> <span
												class="fw-semi-bold">Role:</span> &nbsp; <span
												class="label label-danger">${item.role==0?'Admin':'User' }</span>
										</small> <br> <small> <span class="fw-semi-bold">Status:</span>
												&nbsp; <span class="label label-success">${item.isActive()?'Active':'Inactive' }</span>
										</small></td>
										<td><a href="edit?accountId=${item.accountId }"
											class="btn btn-primary" data-placement="top"
											data-original-title=".btn .btn-primary">Edit</a> <a
											href="delete?accountId=${item.accountId }"
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