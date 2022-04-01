<%@page import="javax.mail.FetchProfile.Item"%>
<%@page import="contraints.Common"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js">

<head>
    <meta charset="utf-8">
    <title>Sunshine Shop - Checkout- Step 1 </title>
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

    <div class="master-wrapper">
        <div class="container">
            <div class="row">



                <section class="span12">
                    <div class="checkout-container">
                        <div class="row">
                            <div class="span10 offset1">



                                <header>
                                    <div class="row">
                                        
                                        <div class="span10">
                                            <div class="center-align">
                                                <h1><span class="light">Review</span> Shopping Cart</h1>
                                            </div>
                                        </div>
                                        
                                    </div>
                                </header>



                                <div class="checkout-steps">
                                    <div class="clearfix">
                                        <div class="step active">
                                            <div class="step-badge">1</div>
                                            Shopping Cart
                                        </div>
                                        <div class="step">
                                            <div class="step-badge">2</div>
                                            Shipping Address
                                        </div>
                                        <div class="step">
                                            <div class="step-badge">3</div>
                                            Payment Method
                                        </div>
                                        <div class="step">
                                            <div class="step-badge">4</div>
                                            Confirm &amp; Pay
                                        </div>
                                    </div>
                                </div>



                                <table class="table table-items">
                                    <thead>
                                        <tr>
                                            <th colspan="2">Item</th>
                                            <th>
                                                <div class="align-center">Quantity</div>
                                            </th>
                                            <th>
                                                <div class="align-right">Price</div>
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>


										<c:set var="total" value="0" />
										<c:forEach var="entry" items="${sessionScope.cart}">

											<tr>
												<td class="image"><img
													src="<%=Common.url%>/views/images/dummy/products/${entry.value.product.image}"
													alt="" width="200" height="200" /></td>
												<td class="desc">${entry.value.product.productName}
													&nbsp;
													<form action="#">
														<input type="hidden" name="productId"
															value="${entry.value.product.productID}"> <input
															type="hidden" name="id" value="${id}"> <input
															type="hidden" name="uri"
															value="${requestScope['javax.servlet.forward.request_uri']}">
														<input type="submit"
															formaction="<%=Common.url%>/remove-to-cart"
															class="btn btn-success" value="-"> <input
															type="submit" formaction="<%=Common.url%>/add-to-cart"
															class="btn btn-success" value="+"> <input
															type="submit" formaction="<%=Common.url%>/delete-to-cart"
															class="btn btn-danger" value="x">
													</form>
												</td>
												<td class="qty"><input type="text" disabled
													class="tiny-size" value="${entry.value.quantity}" /> <input
													type="hidden" name="quantity" class="tiny-size"
													value="${entry.value.quantity}" /></td>
												<td class="price">$ ${entry.value.getSubTotal()} <c:set
														var="total" value="${total+entry.value.getSubTotal()}" />
												</td>
											</tr>
										</c:forEach>
										<tr>
                                            <td colspan="2" rowspan="2">
                                                <div class="alert alert-info">
                                                    <button data-dismiss="alert" class="close" type="button">×</button> Shipping costs are calculated based on location. <a href="#">More information</a>
                                                </div>
                                            </td>
                                            <td class="stronger">Shipping:</td>
                                            <td class="stronger">
                                                <div class="align-right">Free</div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="stronger">Subtotal:</td>
                                            <td class="stronger">
                                                <div class="size-16 align-right">$ ${total}</div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <hr/>
                                <p class="right-align">
                                    In the next step you will choose your shipping address &nbsp; &nbsp;
                                    <a href="<%=Common.url%>/checkout/step-2" class="btn btn-primary higher bold" ${sessionScope.cart.isEmpty()?'onclick="return false;"':'' } >CONTINUE</a>
                                </p>
                            </div>
                        </div>
                    </div>
                </section>
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