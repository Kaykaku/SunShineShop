<%@page import="contraints.Common"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <div class="logo">
        <h4><a href="<%=Common.url %>/admin/home">Sunshine Store<strong> Admin</strong></a></h4>
    </div>
<nav id="sidebar" class="sidebar nav-collapse collapse">
       <ul id="side-nav" class="side-nav">
           <li class="active">
               <a href="<%=Common.url %>/admin/home"><i class="fa fa-home"></i> <span class="name">Dashboard</span></a>
           </li>
           <li class="panel ">
               <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#side-nav" href="#grid-collapse"><i class="fa fa-th"></i> <span class="name">Management</span></a>
               <ul id="grid-collapse" class="panel-collapse collapse ">
                   <li class=""><a href="<%=Common.url %>/admin/management-account/view">Account</a></li>
                   <li class=""><a href="<%=Common.url %>/admin/management-category/view">Category</a></li>
                   <li class=""><a href="<%=Common.url %>/admin/management-brand/view">Brand</a></li>
                   <li class=""><a href="<%=Common.url %>/admin/management-product/view">Product</a></li>
                   <li class=""><a href="<%=Common.url %>/admin/management-order/view">Order</a></li>
                   <li class=""><a href="<%=Common.url %>/admin/management-news/view">News</a></li>
               </ul>
           </li>
           <li class="panel ">
               <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#side-nav" href="#stats-collapse"><i class="fa fa-area-chart"></i> <span class="name">Statistics</span></a>
               <ul id="stats-collapse" class="panel-collapse collapse ">
                   <li class=""><a href="<%=Common.url %>/admin/statictis/best-product-seller">Top Product Seller</a></li>
                   <li class=""><a href="<%=Common.url %>/admin/statictis/revenue-by-category">Revenue By Category</a></li>
                   <li class=""><a href="<%=Common.url %>/admin/statictis/revenue-by-brand">Revenue By Brand</a></li>
                   <li class=""><a href="<%=Common.url %>/admin/statictis/revenue-by-account">Revenue By Account</a></li>
               </ul>
           </li>
           <li class="visible-xs">
               <a href="login.html"><i class="fa fa-sign-out"></i> <span class="name">Sign Out</span></a>
           </li>
           <li class="panel ">
               <a href="<%=Common.url %>/home"><i class="fa fa-arrow-left"></i> <span class="name">Back to home</span></a>
           </li>
       </ul>

   </nav>
