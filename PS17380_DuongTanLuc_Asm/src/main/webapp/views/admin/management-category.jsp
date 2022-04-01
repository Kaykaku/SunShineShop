<%@page import="contraints.Common"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>


<meta http-equiv="content-type" content="text/html;charset=UTF-8" />


<head>
    <title>Sunshine - Admin - Category</title>

    <link href="<%=Common.url %>/views/admin/css/application.min.css" rel="stylesheet">
    <link rel="shortcut icon" href="<%=Common.url %>/views/admin/img/favicon.png">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta charset="utf-8">
</head>

<body class="background-dark">
    <div class="logo">
        <h4><a href="index.html">Sunshine Store<strong> Admin</strong></a></h4>
    </div>
    <%@include file="_menu.jsp" %>
        <div class="wrap">
            <%@include file="_header.jsp" %>
                <div class="row">
                    
                    <div class="col-md-offset-3 col-md-6">
                        <section class="widget">
                            <header>
                                <h4>
                                    <i class="fa fa-pencil"></i> CATEGORY
                                </h4>
                            </header>
                            <div class="body">
                                <form id="validation-form" method="post" class="form-horizontal" enctype="multipart/form-data" novalidate="novalidate" data-parsley-priority-enabled="false">
                                    <fieldset>
                                        <legend class="section">Form</legend>
                                        <div class="form-group">
                                            <label for="normal-field" class="col-sm-4 control-label">Category ID</label>
                                            <div class="col-sm-5">
                                                <input type="number" id="transparent-field" value="${category.categoryID }" class="form-control input-transparent" placeholder="Auto create" disabled>
                                                <input name="id" type="number" value="${category.categoryID }" class="hiding hide">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="hint-field" class="col-sm-4 control-label">
	                                            Category Name
	                                        </label>
                                            <div class="col-sm-5">
                                                <input type="text" name="name" value="${category.categoryName }" id="hint-field" class="form-control input-transparent" required="required">
                                            </div>
                                        </div>
                                    </fieldset>
                                    <div class="form-actions">
                                        <div class="row">
                                            <div class="col-sm-offset-3 col-sm-8">
                                                <div class="btn-toolbar">
                                                    <a href="view" class="btn btn-primary">New</a>
                                                    <input type="submit" formaction="create" class="btn btn-primary" value="Create">
                                                    <input type="submit" formaction="update" class="btn btn-primary" value="Update">
                                                    <a href="delete?categoryId=${category.categoryID }" class="btn btn-danger">Delete</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </section>
                    </div>                
                    <div class="col-md-offset-3 col-md-6">
                    <section class="widget">
                        <header>
                            <h4><i class="fa fa-align-left"></i> List <span class="fw-semi-bold">Category</span></h4>
                        </header>
                        <div class="body">
                            <div class="mt">
                                <table id="datatable-table" class="table table-striped table-hover">
                                    <thead>
                                        <tr>
                                            <th>Id</th>
                                            <th>Name</th>
                                            <th>Edit</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="item" items="${listCategories}">
                                            <tr>
                                                <td>${item.categoryID }</td>                                            
                                                <td><span class="fw-semi-bold">${item.categoryName }</span></td>                                               
                                                <td>                                               	
                                                    <a  href="edit?categoryId=${item.categoryID }" class="btn btn-primary" data-placement="top" data-original-title=".btn .btn-primary">Edit</a>
                                                    <a href="delete?categoryId=${item.categoryID }" class="btn btn-danger" data-placement="top" data-original-title=".btn .btn-primary">Delete</a>                            
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </section>
                    </div>
                </div>
                
        </div>

        <script src="<%=Common.url %>/views/admin/lib/jquery/dist/jquery.min.js"></script>
        <script src="<%=Common.url %>/views/admin/lib/jquery-pjax/jquery.pjax.js"></script>
        <script src="<%=Common.url %>/views/admin/lib/bootstrap-sass-official/assets/javascripts/bootstrap.js"></script>
        <script src="<%=Common.url %>/views/admin/lib/widgster/widgster.js"></script>
        <script src="<%=Common.url %>/views/admin/lib/underscore/underscore.js"></script>

        <script src="<%=Common.url %>/views/admin/js/app.js"></script>
        <script src="<%=Common.url %>/views/admin/js/settings.js"></script>

        <script src="<%=Common.url %>/views/admin/lib/bootstrap-select/dist/js/bootstrap-select.min.js"></script>
        <script src="<%=Common.url %>/views/admin/lib/underscore/underscore.js"></script>
        <script src="<%=Common.url %>/views/admin/lib/backbone/backbone.js"></script>
        <script src="<%=Common.url %>/views/admin/lib/backbone.paginator/lib/backbone.paginator.min.js"></script>
        <script src="<%=Common.url %>/views/admin/lib/backgrid/lib/backgrid.min.js"></script>
        <script src="<%=Common.url %>/views/admin/lib/backgrid-paginator/backgrid-paginator.js"></script>
        <script src="<%=Common.url %>/views/admin/lib/datatables/media/js/jquery.dataTables.min.js"></script>

        <script src="<%=Common.url %>/views/admin/js/tables-dynamic.js"></script>
        <script src="<%=Common.url %>/views/admin/js/forms-validation.js"></script>
        <script src="<%=Common.url %>/views/admin/lib/parsleyjs/dist/parsley.min.js"></script>


</body>

</html>