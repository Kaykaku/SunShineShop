<%@page import="dao.BrandDao"%>
<%@page import="models.Brand"%>
<%@page import="dao.CategoryDao"%>
<%@page import="models.Category"%>
<%@page import="java.util.List"%>
<%@page import="contraints.Common"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<footer>
            <div class="foot-light">
                <div class="container">
                    <div class="row">
                        <div class="span4">
                            <h2 class="pacifico">Sunshine &nbsp; <img src="<%=Common.url %>/views/images/webmarket.png" alt="Webmarket Cart" class="align-baseline" /></h2>
                            <p>Our store is committed to always selling genuine products. Always update the latest and most modern products with the service to satisfy the most demanding customers . </p>
                        </div>
                        <div class="span4">
                            <div class="main-titles lined">
                                <h3 class="title">Facebook</h3>
                            </div>
                            <div class="bordered">
                                <div class="fill-iframe">
                                    <div class="fb-like-box" data-href="https://www.facebook.com/ProteusNet" data-width="292" data-height="200" data-colorscheme="dark" data-show-faces="true" data-header="false" data-stream="false" data-show-border="false"></div>
                                </div>
                            </div>
                        </div>
                        <div class="span4">
                            <div class="main-titles lined">
                                <h3 class="title"><span class="light">Newsletters</span> Signup</h3>
                            </div>
                            <p>Enter your email to receive the latest product information and the earliest promotional information .</p>

                            <div id="mc_embed_signup">
                                <form action="#" method="post" id="mc-embedded-subscribe-form" name="mc-embedded-subscribe-form" class="validate form form-inline" target="_blank" novalidate>
                                    <div class="mc-field-group">
                                        <input type="email" value="" placeholder="Enter your e-mail address" name="EMAIL" class="required email" id="mce-EMAIL">
                                        <input type="submit" value="Send" name="subscribe" id="mc-embedded-subscribe" class="btn btn-primary">
                                    </div>
                                    <div id="mce-responses" class="clear">
                                        <div class="response" id="mce-error-response" style="display:none"></div>
                                        <div class="response" id="mce-success-response" style="display:none"></div>
                                    </div>
                                </form>
                            </div>

                        </div>
                    </div>
                </div>
            </div>



            <div class="foot-dark">
                <div class="container">
                    <div class="row">



                        <div class="span3">
                            <div class="main-titles lined">
                                <h3 class="title"><span class="light">Main</span> Navigation</h3>
                            </div>
                            <ul class="nav bold">
                                <li><a href="<%=Common.url %>/home">Home</a></li>
                                <li><a href="<%=Common.url %>/all-products">All products</a></li>
                                <li><a href="<%=Common.url %>/about-us">About Us</a></li>
                                <li><a href="<%=Common.url %>/news">News</a></li>
                                <li><a href="<%=Common.url %>/contact-us">Contact Us</a></li>
                            </ul>
                        </div>



                        <div class="span3">
                            <div class="main-titles lined">
                                <h3 class="title"><span class="light">All</span> Category</h3>
                            </div>
                            <ul class="nav">
                                <% List<Category> list = new CategoryDao().findAll();
                                	request.setAttribute("list", list);
                                %>
                                <c:forEach begin="1" end="5" varStatus="loop">
                                	<li><a href="<%=Common.url %>/category?categoryId=${list[loop.index].categoryID}">${list[loop.index].categoryName}</a></li>
								</c:forEach>                             
                                <li><a href="<%=Common.url %>/category">and more...</a></li>
                            </ul>
                        </div>



                        <div class="span3">
                            <div class="main-titles lined">
                                <h3 class="title"><span class="light">All</span> Brand</h3>
                            </div>
                            <ul class="nav">
                            <% List<Brand> listBrand = new BrandDao().findAll();
                           		request.setAttribute("listBrand", listBrand);
                           	%>
						    <c:forEach begin="1" end="5" varStatus="loop2">
                                	<li><a href="<%=Common.url %>/brand?brandId=${listBrand[loop2.index].brandID}">${listBrand[loop2.index].brandName}</a></li>
							</c:forEach> 
                                <li><a href="<%=Common.url %>/brand">and more...</a></li>
                            </ul>
                        </div>



                        <div class="span3">
                            <div class="main-titles lined">
                                <h3 class="title"><span class="light"></span> Orthers</h3>
                            </div>
                            <ul class="nav">
                                <li><a href="#">Email : lucdtps17380@fpt.edu.vn</a></li>
                                <li><a href="#">Phone : 0394568769</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>



            <div class="foot-last">
                <a href="#" id="toTheTop">
                    <span class="icon-chevron-up"></span>
                </a>
                <div class="container">
                    <div class="row">
                        <div class="span6">
                            &copy; Copyright 2022. FPT polytechnic .
                        </div>
                        <div class="span6">
                            <div class="pull-right">Develop by <a href="http://www.proteusthemes.com/">PS17380 - Dương Tấn Lực</a></div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>