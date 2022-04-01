<%@page import="contraints.Common"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>


<meta http-equiv="content-type" content="text/html;charset=UTF-8" />


<head>
<title>Sunshine - Admin - News</title>

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
								novalidate="novalidate"
								data-parsley-priority-enabled="false">
								<fieldset>
									<legend class="section">News form</legend>

									<div class="form-group">
										<label for="normal-field" class="col-sm-4 control-label">ID</label>
										<div class="col-sm-3">
											<input type="number" id="transparent-field"
												value="${news.newId }"
												class="form-control input-transparent"
												placeholder="Auto create" disabled> <input name="id"
												type="number" value="${news.newId }"
												class="hiding hide">
										</div>
									</div>
									<div class="form-group">
										<label for="hint-field" class="col-sm-4 control-label">
											Create by </label>
										<div class="col-sm-3">
											<input type="text" name="name"
												value="${news.account.username }" id="hint-field"
												class="form-control input-transparent" disabled>
												
												<input name="id"
												type="number" value="${news.account.username }"
												class="hiding hide">
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-4 control-label" for="tooltip-enabled">Create
											Date</label>
										<div class="col-sm-3">
											<input name="date" type="date"
												value="<fmt:formatDate value="${news.createDate}" pattern="yyyy-MM-dd" />"
												id="datetimepicker1" class="form-control input-transparent"
												disabled>
										</div>
									</div>
									<div class="form-group">
                                    <label class="col-sm-4 control-label" for="elastic-textarea">
                                        Title
                                    </label>
                                    <div class="col-sm-5">
                                        <textarea rows="1" class="autogrow form-control transition-height input-transparent" id="elastic-textarea"
                                                  placeholder="Note some things here..." name="title"> ${news.title} </textarea>
                                    </div>
                                </div>
									<div class="form-group">
                                    <label class="col-sm-4 control-label" for="elastic-textarea">
                                        Description
                                    </label>
                                    <div class="col-sm-5">
                                        <textarea rows="3" class="autogrow form-control transition-height input-transparent" id="elastic-textarea"
                                                  placeholder="Thinking about that..." name="description">${news.description}</textarea>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label" for="elastic-textarea">
                                        Content
                                    </label>
                                    <div class="col-sm-5">
                                        <textarea rows="5" class="autogrow form-control transition-height input-transparent" id="elastic-textarea"
                                                  placeholder="And tell everything you know..." name="content">${news.content}</textarea>
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
												<a href="delete?newId=${news.newId }"
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
						<i class="fa fa-align-left"></i> List <span class="fw-semi-bold">News</span>
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
									<th>Create By</th>
									<th class="no-sort hidden-xs">Title</th>
									<th class="hidden-xs">Description</th>
									<th class="no-sort">Edit</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="item" items="${list}">
									<tr>
										<td>${item.newId }</td>
										
										<td>${item.account.username }</td>
										<td>${item.createDate }</td>
										<td>${item.title }</td>
										<td>${item.description }</td>
										<td><a href="edit?newId=${item.newId }"
											class="btn btn-primary" data-placement="top"
											data-original-title=".btn .btn-primary">Edit</a> <a
											href="delete?newId=${item.newId }"
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
	
	<script src="<%=Common.url%>/views/admin/lib/bootstrap-select/dist/js/bootstrap-select.min.js"></script>
        <script src="<%=Common.url%>/views/admin/lib/jquery-autosize/jquery.autosize.min.js"></script>
        <script src="<%=Common.url%>/views/admin/lib/bootstrap3-wysihtml5-bower/dist/bootstrap3-wysihtml5.all.min.js"></script>
        <script src="<%=Common.url%>/views/admin/lib/select2/select2.min.js"></script>
        <script src="<%=Common.url%>/views/admin/lib/switchery/dist/switchery.min.js"></script>
        <script src="<%=Common.url%>/views/admin/lib/moment/moment.js"></script>
        <script src="<%=Common.url%>/views/admin/lib/eonasdan-bootstrap-datetimepicker/build/js/bootstrap-datetimepicker.min.js"></script>
        <script src="<%=Common.url%>/views/admin/lib/mjolnic-bootstrap-colorpicker/dist/js/bootstrap-colorpicker.min.js"></script>
        <script src="<%=Common.url%>/views/admin/lib/jquery.maskedinput/jquery.maskedinput.min.js"></script>
        <script src="<%=Common.url%>/views/admin/lib/seiyria-bootstrap-slider/dist/bootstrap-slider.min.js"></script>

        <!-- page application js -->
        <script src="<%=Common.url%>/views/admin/js/forms-elements.js"></script>

</body>

</html>