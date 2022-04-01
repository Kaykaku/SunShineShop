<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<%@page import="contraints.Common"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="span6">
     <div class="news-item">
     
         <div class="published">${param.date }</div>
         <h6><a href="<%=Common.url %>/news-details?id=${param.id}">${param.title}</a></h6>
         <p>${fn:substring(param.description, 0, 150)}...
         </p>
     </div>
 </div>