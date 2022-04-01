<%@page import="contraints.Common"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js">

<head>
    <meta charset="utf-8">
    <title>Sunshine Shop - Home Page</title>
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

        <div class="fullwidthbanner-container">
            <div class="fullwidthbanner">
                <ul>
                    <li data-transition="premium-random" data-slotamount="3">
                        <img src="<%=Common.url %>/views/images/dummy/slides/1/slide.jpg" alt="slider img" width="1400" height="377" />

                        <div class="caption lft ltt" data-x="570" data-y="50" data-speed="4000" data-start="1000" data-easing="easeOutElastic">
                            <img src="<%=Common.url %>/views/images/dummy/slides/1/baloon1.png" alt="baloon" width="135" height="186" />
                        </div>
                        <div class="caption lft ltt" data-x="770" data-y="60" data-speed="4000" data-start="1200" data-easing="easeOutElastic">
                            <img src="<%=Common.url %>/views/images/dummy/slides/1/baloon3.png" alt="baloon" width="40" height="55" />
                        </div>
                        <div class="caption lft ltt" data-x="870" data-y="80" data-speed="4000" data-start="1500" data-easing="easeOutElastic">
                            <img src="<%=Common.url %>/views/images/dummy/slides/1/baloon2.png" alt="baloon" width="60" height="83" />
                        </div>

                        <div class="caption lfl big_theme" data-x="120" data-y="120" data-speed="1000" data-start="500" data-easing="easeInOutBack">
                            With Sunshine, the Sky Is the Limit
                        </div>
                        <div class="caption lfl small_theme" data-x="120" data-y="190" data-speed="1000" data-start="700" data-easing="easeInOutBack">
                            Take a tour on Our Shop to find Yourself
                        </div>
                        <a href="<%=Common.url %>/all-products" class="caption lfl btn btn-primary btn_theme" data-x="120" data-y="260" data-speed="1000" data-start="900" data-easing="easeInOutBack">
SEE ALL PRODUCTS
</a>
                    </li>
                    <li data-transition="premium-random" data-slotamount="3">
                        <img src="<%=Common.url %>/views/images/dummy/slides/2/slide.jpg" alt="slider img" width="1400" height="377" />

                        <div class="caption lfb ltb" data-x="800" data-y="50" data-speed="1000" data-start="1000" data-easing="easeInOutCubic">
                            <img src="<%=Common.url %>/views/images/dummy/slides/2/woman.png" alt="woman" width="361" height="374" />
                        </div>

                        <div class="caption lfl str" data-x="400" data-y="20" data-speed="10000" data-start="1000" data-easing="linear">
                            <img src="<%=Common.url %>/views/images/dummy/slides/2/plane.png" alt="aircraft" width="117" height="28" />
                        </div>

                        <div class="caption lfl big_theme" data-x="120" data-y="120" data-speed="1000" data-start="500" data-easing="easeInOutBack">
                            Top outfits for Summer
                        </div>
                        <div class="caption lfl small_theme" data-x="120" data-y="190" data-speed="1000" data-start="700" data-easing="easeInOutBack">
                            Sale up to 40% , as a bonus,shiping for FREE!
                        </div>
                        <a href="<%=Common.url %>/category" class="caption lfl btn btn-primary btn_theme" data-x="120" data-y="260" data-speed="1000" data-start="900" data-easing="easeInOutBack">
AND MANY MORE ...
</a>
                    </li>
                    <li data-transition="premium-random" data-slotamount="3">
                        <img src="<%=Common.url %>/views/images/dummy/slides/3/slide.jpg" alt="slider img" width="1400" height="377" />

                        <div class="caption sfr fadeout" data-x="950" data-y="77" data-speed="1000" data-start="2500" data-easing="easeInOutCubic">
                            <img src="<%=Common.url %>/views/images/dummy/slides/3/phone.png" alt="phone in a hand" width="495" height="377" />
                        </div>

                        <div class="caption lfl big_theme" data-x="120" data-y="120" data-speed="1000" data-start="500" data-easing="easeInOutBack">
                            Consulting support at all times
                        </div>
                        <div class="caption lfl small_theme" data-x="120" data-y="190" data-speed="1000" data-start="700" data-easing="easeInOutBack">
                            With a team of enthusiastic staff, always available 24/7 !
                        </div>
                        <a href="<%=Common.url %>/contact-us" class="caption lfl btn btn-primary btn_theme" data-x="120" data-y="260" data-speed="1000" data-start="900" data-easing="easeInOutBack">
And many other services...
</a>
                    </li>
                    <li data-transition="premium-random" data-slotamount="3">
                        <img src="<%=Common.url %>/views/images/dummy/slides/4/slide.jpg" alt="slider img" width="1400" height="377" />

                        <div class="caption lft ltt" data-x="-150" data-y="0" data-speed="300" data-start="2000" data-easing="easeInOutCubic">
                            <img src="<%=Common.url %>/views/images/dummy/slides/4/person1.png" alt="satisfied customer" width="108" height="204" />
                        </div>
                        <div class="caption lft ltt" data-x="0" data-y="0" data-speed="300" data-start="2200" data-easing="easeInOutCubic">
                            <img src="<%=Common.url %>/views/images/dummy/slides/4/person2.png" alt="satisfied customer" width="108" height="321" />
                        </div>
                        <div class="caption lft ltt" data-x="500" data-y="0" data-speed="300" data-start="2400" data-easing="easeInOutCubic">
                            <img src="<%=Common.url %>/views/images/dummy/slides/4/person3.png" alt="satisfied customer" width="108" height="139" />
                        </div>
                        <div class="caption lft ltt" data-x="720" data-y="0" data-speed="300" data-start="2600" data-easing="easeInOutCubic">
                            <img src="<%=Common.url %>/views/images/dummy/slides/4/person4.png" alt="satisfied customer" width="108" height="191" />
                        </div>
                        <div class="caption lft ltt" data-x="940" data-y="0" data-speed="300" data-start="2800" data-easing="easeInOutCubic">
                            <img src="<%=Common.url %>/views/images/dummy/slides/4/person5.png" alt="satisfied customer" width="108" height="139" />
                        </div>
                        <div class="caption lft ltt" data-x="1200" data-y="0" data-speed="300" data-start="3000" data-easing="easeInOutCubic">
                            <img src="<%=Common.url %>/views/images/dummy/slides/4/person6.png" alt="satisfied customer" width="108" height="179" />
                        </div>
                        <div class="caption lft ltt" data-x="1350" data-y="0" data-speed="300" data-start="3200" data-easing="easeInOutCubic">
                            <img src="<%=Common.url %>/views/images/dummy/slides/4/person7.png" alt="satisfied customer" width="108" height="133" />
                        </div>

                        <div class="caption lfl big_theme" data-x="120" data-y="140" data-speed="1000" data-start="500" data-easing="easeInOutBack">
                            Over 1000 Satisfied Customers
                        </div>
                        <div class="caption lfl small_theme" data-x="120" data-y="210" data-speed="1000" data-start="700" data-easing="easeInOutBack">
                            Take a look at our store and you will be satisfied! 
                        </div>
                        <a href="<%=Common.url %>/about-us" class="caption lfl btn btn-primary btn_theme" data-x="120" data-y="280" data-speed="1000" data-start="900" data-easing="easeInOutBack">
We provide support
</a>
                    </li>
                </ul>
                <div class="tp-bannertimer"></div>
            </div>



            <div id="sliderRevLeft"><i class="icon-chevron-left"></i></div>
            <div id="sliderRevRight"><i class="icon-chevron-right"></i></div>
        </div>



        <div class="container">
            <div class="row">
                <div class="span12">
                    <div class="push-up over-slider blocks-spacer">



                        <div class="row">
                            <div class="span4">
                                <a href="#" class="btn btn-block banner">
                                    <span class="title"><span class="light">SUMMER</span> SALE</span>
                                    <em>up to 60% off on all shoes</em>
                                </a>
                            </div>
                            <div class="span4">
                                <a href="#" class="btn btn-block colored banner">
                                    <span class="title"><span class="light">FREE</span> SHIPPING</span>
                                    <em>on orders over $69</em>
                                </a>
                            </div>
                            <div class="span4">
                                <a href="#" class="btn btn-block banner">
                                    <span class="title"><span class="light">NEW</span> PRODUCTS</span>
                                    <em>for running on lorem ipsum dolor</em>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>



            <div class="row featured-items blocks-spacer">
                <div class="span12">



                    <div class="main-titles lined">
                        <h2 class="title"><span class="light">Featured</span> Products</h2>
                        <div class="arrows">
                            <a href="#" class="icon-chevron-left" id="featuredItemsLeft"></a>
                            <a href="#" class="icon-chevron-right" id="featuredItemsRight"></a>
                        </div>
                    </div>
                </div>
                <div class="span12">



                    <div class="carouFredSel" data-autoplay="false" data-nav="featuredItems">
                        <div class="slide">
                            <div class="row">
                                <c:forEach var="item" items="${randomItem1}">
							        <jsp:include page="_item_1.jsp">
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
                        <div class="slide">
                            <div class="row">
								<c:forEach var="item" items="${randomItem2}">
							        <jsp:include page="_item_1.jsp">
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
                </div>
            </div>
        </div>



        <div class="boxed-area blocks-spacer">
            <div class="container">



                <div class="row">
                    <div class="span12">
                        <div class="main-titles lined">
                            <h2 class="title"><span class="light">New</span> Products in the Shop</h2>
                        </div>
                    </div>
                </div>
                <div class="row popup-products blocks-spacer">
					<c:forEach var="item" items="${randomItem3}">
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



        <div class="most-popular blocks-spacer">
            <div class="container">



                <div class="row">
                    <div class="span12">
                        <div class="main-titles lined">
                            <h2 class="title"><span class="light">Most</span> Popular Products</h2>
                        </div>
                    </div>
                </div>
                <div class="row popup-products">

					<c:forEach var="item" items="${randomItem4}">
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



        <div class="darker-stripe blocks-spacer more-space latest-news with-shadows">
            <div class="container">



                <div class="row">
                    <div class="span12">
                        <div class="main-titles center-align">
                            <h2 class="title">
                                <span class="clickable icon-chevron-left" id="tweetsLeft"></span> &nbsp;&nbsp;&nbsp;
                                <span class="light">Latest</span> News &nbsp;&nbsp;&nbsp;
                                <span class="clickable icon-chevron-right" id="tweetsRight"></span>
                            </h2>
                        </div>
                    </div>
                </div>



			<!--  <div class="row">
				<div class="span12">
					<div class="carouFredSel" data-nav="tweets" data-autoplay="false">

						<c:set var='i' value='0' />
						<c:forEach var="item" items="${descNews}">
							<c:set var='i' value='${i+1}' />
							<c:if test="${i==1}">
								<div class="slide">
									<div class="row">
							</c:if>
							<jsp:include page="_new.jsp">
								<jsp:param name="id" value="${item.newId }" />
								<jsp:param name="date" value="${item.createDate }" />
								<jsp:param name="title" value="${item.title }" />
								<jsp:param name="description" value="${item.description }" />
								<jsp:param name="content" value="${item.content }" />
							</jsp:include>
							<c:if test="${i==2}">
								</div>
							</div>
							<c:set var='i' value='0' />
							</c:if>
				</c:forEach>
			</div>
		</div> -->
		</div>
            </div>
        </div>



        <div class="container blocks-spacer-last">



            <div class="row">
                <div class="span12">
                    <div class="main-titles lined">
                        <h2 class="title"><span class="light">Our</span> Brands</h2>
                        <div class="arrows">
                            <a class="clickable  icon-chevron-left" id="brandsLeft"></a>
                            <a class="clickable  icon-chevron-right" id="brandsRight"></a>
                        </div>
                    </div>
                </div>
            </div>



            <div class="row">
                <div class="span12">
                    <div class="brands  carouFredSel" data-nav="brands" data-autoplay="true">
                        <a href="http://www.proteusthemes.com/"><img src="<%=Common.url %>/views/images/dummy/brands/brands_01.jpg" alt="" width="203" height="104" /></a>
                        <a href="http://www.proteusthemes.com/"><img src="<%=Common.url %>/views/images/dummy/brands/brands_02.jpg" alt="" width="203" height="104" /></a>
                        <a href="http://www.proteusthemes.com/"><img src="<%=Common.url %>/views/images/dummy/brands/brands_03.jpg" alt="" width="203" height="104" /></a>
                        <a href="http://www.proteusthemes.com/"><img src="<%=Common.url %>/views/images/dummy/brands/brands_04.jpg" alt="" width="203" height="104" /></a>
                        <a href="http://www.proteusthemes.com/"><img src="<%=Common.url %>/views/images/dummy/brands/brands_05.jpg" alt="" width="203" height="104" /></a>
                        <a href="http://www.proteusthemes.com/"><img src="<%=Common.url %>/views/images/dummy/brands/brands_06.jpg" alt="" width="203" height="104" /></a>
                    </div>
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