<%@page import="javax.mail.FetchProfile.Item"%>
<%@page import="contraints.Common"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js">

<head>
    <meta charset="utf-8">
    <title>Sunshine Shop -  ${item.productName} </title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="ProteusThemes">

    <script type="text/javascript">
        WebFontConfig = {
            google: {
                families: ['Open+Sans:400,700,400italic,700italic:latin,latin-ext,cyrillic', 'Pacifico::latin']
            }
        };
        (function() {
            var wf = document.createElement('script');
            wf.src = ('https:' == document.location.protocol ? 'https' : 'http') + '://ajax.googleapis.com/ajax/libs/webfont/1/webfont.js';
            wf.type = 'text/javascript';
            wf.async = 'true';
            var s = document.getElementsByTagName('script')[0];
            s.parentNode.insertBefore(wf, s);
        })();
    </script>

    <link href="<%=Common.url %>/views/stylesheets/bootstrap.css" rel="stylesheet">
    <link href="<%=Common.url %>/views/stylesheets/responsive.css" rel="stylesheet">

    <link rel="stylesheet" href="<%=Common.url %>/views/js/rs-plugin/css/settings.css" type="text/css" />

    <link rel="stylesheet" href="<%=Common.url %>/views/js/jquery-ui-1.10.3/css/smoothness/jquery-ui-1.10.3.custom.min.css" type="text/css" />

    <link rel="stylesheet" href="<%=Common.url %>/views/js/prettyphoto/css/prettyPhoto.css" type="text/css" />

    <link href="<%=Common.url %>/views/stylesheets/main.css" rel="stylesheet">

    <script src="<%=Common.url %>/views/js/modernizr.custom.56918.js"></script>

    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="<%=Common.url %>/views/images/apple-touch/144.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="<%=Common.url %>/views/images/apple-touch/114.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="<%=Common.url %>/views/images/apple-touch/72.png">
    <link rel="apple-touch-icon-precomposed" href="<%=Common.url %>/views/images/apple-touch/57.png">
    <link rel="shortcut icon" href="<%=Common.url %>/views/images/apple-touch/57.png">
</head>

<body class="">
	<jsp:include page="_header.jsp">
       	<jsp:param name="menu" value="${menu}"/>
	</jsp:include>

    <div class="darker-stripe">
        <div class="container">
            <div class="row">
                <div class="span12">
                    <ul class="breadcrumb">
                        <li>
                            <a href="<%=Common.url %>/home">Home</a>
                        </li>
                        <li><span class="icon-chevron-right"></span></li>
                        <li>
                            <a href="<%=Common.url %>/all_products">Shop</a>
                        </li>
                        <li><span class="icon-chevron-right"></span></li>
                        <li>
                            <a href="<%=Common.url %>/category?categoryId=${category.categoryID}"> ${category.categoryName}</a>
                        </li>
                        <li><span class="icon-chevron-right"></span></li>
                        <li>
                            <a href="#">${item.productName }</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>



        <div class="container">
            <div class="push-up top-equal blocks-spacer">



                <div class="row blocks-spacer">



                    <div class="span5">
                        <div class="product-preview">
                            <div class="picture">
                                <img src="<%=Common.url %>/views/images/dummy/products/${item.image }" alt="" width="940" height="940" id="mainPreviewImg" />
                            </div>
                            <div class="thumbs clearfix">
                                <div class="thumb active">
                                    <a href="#mainPreviewImg"><img src="<%=Common.url %>/views/images/dummy/products/${item.image }" alt="" width="940" height="940" /></a>
                                </div>
                                <div class="thumb">
                                    <a href="#mainPreviewImg"><img src="<%=Common.url %>/views/images/dummy/products/product-1.jpg" alt="" width="940" height="940" /></a>
                                </div>
                                <div class="thumb">
                                    <a href="#mainPreviewImg"><img src="<%=Common.url %>/views/images/dummy/products/product-2.jpg" alt="" width="940" height="940" /></a>
                                </div>
                                <div class="thumb">
                                    <a href="#mainPreviewImg"><img src="<%=Common.url %>/views/images/dummy/products/product-3.jpg" alt="" width="940" height="940" /></a>
                                </div>
                                <div class="thumb">
                                    <a href="#mainPreviewImg"><img src="<%=Common.url %>/views/images/dummy/products/product-4.jpg" alt="" width="940" height="940" /></a>
                                </div>
                            </div>
                        </div>
                    </div>



                    <div class="span7">
                        <div class="product-title">
                            <h1 class="name"><span class="light">${brand.brandName }</span> ${item.productName }</h1>
                            <div class="meta">
                                <span class="tag">
                                <c:choose>
				                 	<c:when test="${item.sale==0}">
					                 	<span class="black-clr">$${item.price}</span>
					                </c:when>
					                <c:otherwise >
					                 	<span class="striked">$${item.price}</span>
					                 	<span class="red-clr"> $${item.salePrice}</span>
					                </c:otherwise>
				                 </c:choose>
								</span>
                                <span class="stock">
                                <c:choose>
				                 	<c:when test="${item.quantity==0}">
					                 	<span class="btn btn-danger">Out of Stock</span>
					                </c:when>
					                <c:otherwise >
					                 	<span class="btn btn-success">In Stock</span>
					                </c:otherwise>
				                 </c:choose>
                                </span>
                            </div>
                        </div>
                        <div class="product-description">
                            <p>${item.description }</p>
							<h4 class="btn btn-warning">Color : ${item.color }</h4>
							<h4 class="btn btn-warning">Size : ${item.size }</h4>
							<hr/>
                            <form action="<%=Common.url%>/add-to-cart" class="form form-inline clearfix">
                                <div class="numbered">
                                <span class="tag">Quantity</span>
                                    <input type="text" name="quantity" value="1" class="tiny-size" />
                                    <input type="hidden" name="id" value="${id}">
                                    <input type="hidden" name="productId" value="${item.productID}">
													<input type="hidden" name="uri"
														value="${requestScope['javax.servlet.forward.request_uri']}">
                                    <span class="clickable add-one icon-plus-sign-alt"></span>
                                    <span class="clickable remove-one icon-minus-sign-alt"></span>
                                </div>
                                &nbsp;
                                
                                <button class="btn btn-danger pull-center" ${item.quantity==0?'disabled':""} ><i class="icon-shopping-cart"></i> &nbsp; Add To Cart</button>
                            </form>
                            <hr/>


                            <div class="store-buttons">
                                <i class="icon-heart"></i> <a href="#">Add to a wishlist</a> &nbsp;&nbsp; | &nbsp;&nbsp;
                                <i class="icon-exchange"></i> <a href="#">Add to compare</a> &nbsp;&nbsp; | &nbsp;&nbsp;
                                <i class="icon-envelope-alt"></i> <a href="#">Email to a friend</a>
                            </div>
                        </div>
                    </div>
                </div>



                
            </div>
        </div>



        <div class="boxed-area no-bottom">
            <div class="container">



                <div class="row">
                    <div class="span12">
                        <div class="main-titles lined">
                            <h2 class="title"><span class="light">Related</span> Products</h2>
                        </div>
                    </div>
                </div>



                <div class="row popup-products">
					<c:forEach var="item" items="${randomItem}">
				        <jsp:include page="_item_2.jsp">
				        	<jsp:param name="name" value="${item.productName }"/>
				        	<jsp:param name="id" value="${item.productID }"/>
							<jsp:param name="image" value="${item.image }"/>
							<jsp:param name="price" value= "${item.price }"/>
							<jsp:param name="sale" value= "${item.sale }"/>
							<jsp:param name="salePrice" value= "${item.getSalePrice() }"/>
							<jsp:param name="quantity" value= "${item.quantity }"/>
							<jsp:param name="description" value="${item.description }"/>
						</jsp:include>
				    </c:forEach>
                </div>
            </div>
        </div>


        
		<%@include file="_footer.jsp"%>
		<%@include file="_login_register.jsp"%>


     <div id="fb-root"></div>
    <script>
        (function(d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id)) return;
            js = d.createElement(s);
            js.id = id;
            js.src = "../../../connect.facebook.net/en_US/all.html#xfbml=1&appId=126780447403102";
            fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));
    </script>

    <script type="text/javascript" src="../../../ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.html"></script>
    <script type="text/javascript">
        if (typeof jQuery == 'undefined') {
            document.write('<script src="<%=Common.url %>/views/js/jquery.min.js"><\/script>');
        }
    </script>

    <script src="<%=Common.url %>/views/js/underscore/underscore-min.js" type="text/javascript"></script>

    <script src="<%=Common.url %>/views/js/bootstrap.min.js" type="text/javascript"></script>

    <script src="<%=Common.url %>/views/js/rs-plugin/js/jquery.themepunch.plugins.min.js" type="text/javascript"></script>
    <script src="<%=Common.url %>/views/js/rs-plugin/js/jquery.themepunch.revolution.min.js" type="text/javascript"></script>

    <script src="<%=Common.url %>/views/js/jquery.carouFredSel-6.2.1-packed.js" type="text/javascript"></script>

    <script src="<%=Common.url %>/views/js/jquery-ui-1.10.3/js/jquery-ui-1.10.3.custom.min.js" type="text/javascript"></script>
    <script src="<%=Common.url %>/views/js/jquery-ui-1.10.3/touch-fix.min.js" type="text/javascript"></script>

    <script src="<%=Common.url %>/views/js/isotope/jquery.isotope.min.js" type="text/javascript"></script>

    <script src="<%=Common.url %>/views/js/bootstrap-tour/build/js/bootstrap-tour.min.js" type="text/javascript"></script>

    <script src="<%=Common.url %>/views/js/prettyphoto/js/jquery.prettyPhoto.js" type="text/javascript"></script>

    <script type="text/javascript" src="http://maps.google.com/maps/api/js?key=AIzaSyDvMjN1g49P1MA2Onsj-GulDkmDuuH6aoU&amp;sensor=false"></script>
    <script type="text/javascript" src="<%=Common.url %>/views/js/goMap/js/jquery.gomap-1.3.2.min.js"></script>

    <script src="<%=Common.url %>/views/js/custom.js" type="text/javascript"></script>
</body>

</html>