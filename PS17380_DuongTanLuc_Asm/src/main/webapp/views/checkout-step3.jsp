<%@page import="javax.mail.FetchProfile.Item"%>
<%@page import="contraints.Common"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js">

<head>
<meta charset="utf-8">
<title>Sunshine Shop - Checkout- Step 1</title>
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

<link href="<%=Common.url %>/views/stylesheets/bootstrap.css"
	rel="stylesheet">
<link href="<%=Common.url %>/views/stylesheets/responsive.css"
	rel="stylesheet">

<link rel="stylesheet"
	href="<%=Common.url %>/views/js/rs-plugin/css/settings.css"
	type="text/css" />

<link rel="stylesheet"
	href="<%=Common.url %>/views/js/jquery-ui-1.10.3/css/smoothness/jquery-ui-1.10.3.custom.min.css"
	type="text/css" />

<link rel="stylesheet"
	href="<%=Common.url %>/views/js/prettyphoto/css/prettyPhoto.css"
	type="text/css" />

<link href="<%=Common.url %>/views/stylesheets/main.css"
	rel="stylesheet">

<script src="<%=Common.url %>/views/js/modernizr.custom.56918.js"></script>

<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="<%=Common.url %>/views/images/apple-touch/144.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="<%=Common.url %>/views/images/apple-touch/114.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="<%=Common.url %>/views/images/apple-touch/72.png">
<link rel="apple-touch-icon-precomposed"
	href="<%=Common.url %>/views/images/apple-touch/57.png">
<link rel="shortcut icon"
	href="<%=Common.url %>/views/images/apple-touch/57.png">
</head>

<body class="">
	<jsp:include page="_header.jsp">
		<jsp:param name="menu" value="${menu}" />
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
												<h1>
													<span class="light">Choose</span> Payment Method
												</h1>
											</div>
										</div>
										
									</div>
								</header>



								<div class="checkout-steps">
									<div class="clearfix">
										<div class="step done">
											<div class="step-badge">
												<i class="icon-ok"></i>
											</div>
											<a href="<%=Common.url%>/checkout/step-1">Shopping Cart</a>
										</div>
										<div class="step done">
											<div class="step-badge">
												<i class="icon-ok"></i>
											</div>
											<a href="<%=Common.url%>/checkout/step-2">Shipping Address</a>
										</div>
										<div class="step active">
											<div class="step-badge">3</div>
											Payment Method
										</div>
										<div class="step">
											<div class="step-badge">4</div>
											Confirm &amp; Pay
										</div>
									</div>
								</div>



								<span class="btn btn-danger circle pull-left"><i
									class="icon-chevron-down"></i></span>
								<div class="shifted-left-45 clearfix">
									<h3 class="no-margin">
										<span class="light">Credit</span> Card
									</h3>
									<p class="push-down-30">We accept MasterCard, Visa and
										American Express</p>
									<form action="#" method="post"
										class="form-horizontal form-checkout">
										<div class="control-group">
											<label class="control-label" for="firstName">First
												Name<span class="red-clr bold">*</span>
											</label>
											<div class="controls">
												<input type="text" id="firstName" class="span4" required>
											</div>
										</div>
										<div class="control-group">
											<label class="control-label" for="lastName">Last Name<span
												class="red-clr bold">*</span></label>
											<div class="controls">
												<input type="text" id="lastName" class="span4" required>
											</div>
										</div>
										<div class="control-group">
											<label class="control-label" for="cardNum">Card
												Number<span class="red-clr bold">*</span>
											</label>
											<div class="controls">
												<input type="text" id="cardNum"
													class="span1 card-num-input center-align" maxlength="4">
												<input type="text" class="span1 card-num-input center-align"
													maxlength="4"> <input type="text"
													class="span1 card-num-input center-align" maxlength="4">
												<input type="text"
													class="span1 card-num-input center-align add-tooltip"
													maxlength="4"
													data-title="The 16 digits on the front of the card">
											</div>
										</div>
										<div class="control-group">
											<label class="control-label" for="cvc">CVC or CVS<span
												class="red-clr bold">*</span></label>
											<div class="controls">
												<input id="cvc" type="text"
													class="span1 center-align add-tooltip" maxlength="3"
													data-title="Last 3 digits on back of card" required>
											</div>
										</div>
										<div class="control-group">
											<label class="control-label" for="exp">Expiration
												Date<span class="red-clr bold">*</span>
											</label>
											<div class="controls">
												<select id="exp" class="input-small month-push-right">
													<option value="-1">Month</option>
													<option value="1">01</option>
													<option value="2">02</option>
													<option value="3">03</option>
													<option value="4">04</option>
													<option value="5">05</option>
													<option value="6">06</option>
													<option value="7">07</option>
													<option value="8">08</option>
													<option value="9">09</option>
													<option value="10">10</option>
													<option value="11">11</option>
													<option value="12">12</option>
												</select> <select id="exp" class="input-small">
													<option value="-1">Year</option>
													<option value="2013">2013</option>
													<option value="2014">2014</option>
													<option value="2015">2015</option>
													<option value="2016">2016</option>
													<option value="2017">2017</option>
													<option value="2018">2018</option>
													<option value="2019">2019</option>
													<option value="2020">2020</option>
													<option value="2021">2021</option>
													<option value="2022">2022</option>
												</select>
											</div>
										</div>
									</form>
								</div>
								<hr />
								<span class="btn btn-danger circle pull-left"><i
									class="icon-chevron-right"></i></span>
								<div class="shifted-left-45 clearfix">
									<h3 class="no-margin">
										<span class="light">PayPal</span> &nbsp; &nbsp; &nbsp; <a
											href="#"><img src="<%=Common.url%>/views/images/buttons/paypal.gif"
											alt="PayPal" width="145" height="42" /></a>
									</h3>
								</div>
								<hr />
								<p class="right-align">
									In the next step you will be able to review and confirm the
									order &nbsp; &nbsp; <a href="<%=Common.url%>/checkout/step-4"
										class="btn btn-primary higher bold" ${sessionScope.cart.isEmpty()?'onclick="return false;"':'' }>CONTINUE</a>
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

	<script type="text/javascript"
		src="../../../ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.html"></script>
	<script type="text/javascript">
        if (typeof jQuery == 'undefined') {
            document.write('<script src="<%=Common.url %>
		/views/js/jquery.min.js"><\/script>');
		}
	</script>

	<script src="<%=Common.url%>/views/js/underscore/underscore-min.js"
		type="text/javascript"></script>

	<script src="<%=Common.url%>/views/js/bootstrap.min.js"
		type="text/javascript"></script>

	<script
		src="<%=Common.url%>/views/js/rs-plugin/js/jquery.themepunch.plugins.min.js"
		type="text/javascript"></script>
	<script
		src="<%=Common.url%>/views/js/rs-plugin/js/jquery.themepunch.revolution.min.js"
		type="text/javascript"></script>

	<script
		src="<%=Common.url%>/views/js/jquery.carouFredSel-6.2.1-packed.js"
		type="text/javascript"></script>

	<script
		src="<%=Common.url%>/views/js/jquery-ui-1.10.3/js/jquery-ui-1.10.3.custom.min.js"
		type="text/javascript"></script>
	<script
		src="<%=Common.url%>/views/js/jquery-ui-1.10.3/touch-fix.min.js"
		type="text/javascript"></script>

	<script src="<%=Common.url%>/views/js/isotope/jquery.isotope.min.js"
		type="text/javascript"></script>

	<script
		src="<%=Common.url%>/views/js/bootstrap-tour/build/js/bootstrap-tour.min.js"
		type="text/javascript"></script>

	<script
		src="<%=Common.url%>/views/js/prettyphoto/js/jquery.prettyPhoto.js"
		type="text/javascript"></script>

	<script type="text/javascript"
		src="http://maps.google.com/maps/api/js?key=AIzaSyDvMjN1g49P1MA2Onsj-GulDkmDuuH6aoU&amp;sensor=false"></script>
	<script type="text/javascript"
		src="<%=Common.url%>/views/js/goMap/js/jquery.gomap-1.3.2.min.js"></script>

	<script src="<%=Common.url%>/views/js/custom.js"
		type="text/javascript"></script>
</body>

</html>