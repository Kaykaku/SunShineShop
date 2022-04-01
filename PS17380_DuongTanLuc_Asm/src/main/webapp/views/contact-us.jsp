<%@page import="contraints.Common"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js">

<head>
    <meta charset="utf-8">
    <title>Sunshine Shop - Contact Us</title>
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

    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/apple-touch/144.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/apple-touch/114.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/apple-touch/72.png">
    <link rel="apple-touch-icon-precomposed" href="images/apple-touch/57.png">
    <link rel="shortcut icon" href="<%=Common.url %>/views/images/apple-touch/57.png">
</head>

<body class="">
	<jsp:include page="_header.jsp">
       	<jsp:param name="menu" value="${menu }"/>
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
                                <a href="#">Contact Us</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="push-up top-equal blocks-spacer-last">
                <div class="row">



                    <div class="span12">
                        <div class="title-area">
                            <h1 class="inline"><span class="light">Contact</span> Us</h1>
                        </div>
                    </div>



                    <section class="span8 single single-page">



                        <article class="post">
                            <div class="post-inner">
                                <p>
                                    Questions, Concerns, Comments? You talk, we listen.<br>
									If you have any additional questions or comments, we would love to hear from you!<br>
									Submit your query using any of the methods below.
                                </p>
                            </div>
                        </article>
                        <hr/>



                        <section class="contact-form-container">
                            <h3 class="push-down-25"><span class="light">Send</span> a Message</h3>
                            <form id="commentform" method="post" action="#" class="form form-inline form-contact">
                                <p class="push-down-20">
                                    <input type="text" aria-required="true" tabindex="1" size="30" value="" id="author" name="author" required>
                                    <label for="author">Name<span class="red-clr bold">*</span></label>
                                </p>
                                <p class="push-down-20">
                                    <input type="email" aria-required="true" tabindex="2" size="30" value="" id="email" name="email" required>
                                    <label for="email">Mail<span class="red-clr bold">*</span></label>
                                </p>
                                <p class="push-down-20">
                                    <input type="text" tabindex="3" size="30" value="" id="url" name="url">
                                    <label for="url">Website</label>
                                </p>
                                <p class="push-down-20">
                                    <textarea class="input-block-level" tabindex="4" rows="7" cols="70" id="comment" name="comment" placeholder="Your Message goes here ..." required></textarea>
                                </p>
                                <p>
                                    <button class="btn btn-primary bold" type="submit" tabindex="5" id="submit">SEND EMAIL</button>
                                </p>
                            </form>
                        </section>
                        <hr/>



                        <article class="company-info">
                            <div class="row">
                                <div class="span3">
                                    <h3 class="push-down-30"><span class="light">Company</span> Info</h3>
                                    <p>
                                        <strong class="opensans dark-clr">FPT Polytechnic TP.HCM</strong>
                                        <br/> Công viên phần mềm Quang Trung,
                                        <br/> Toà nhà Innovation,
                                        <br/> Quận 12, Thành phố Hồ Chí Minh
                                        <br/> Việt Nam
                                    </p>
                                    <p>
                                        <strong class="opensans dark-clr">Phone number:</strong> 0394568769
                                        <br/>
                                        <strong class="opensans dark-clr">Fax:</strong> 0000 00 000 000
                                        <br/>
                                        <strong class="opensans dark-clr">Email:</strong> <a href="#"><span class="__cf_email__" data-cfemail="">lucdtps17380@fpt.edu.vn</span></a>
                                    </p>
                                </div>
                                <div class="span5">
                                    <div class="add-googlemap" data-height="205" data-addr="Công viên phần mềm Quang Trung , Quận 12, Hồ Chí Minh" data-title="Webmarket Business" data-zoom="14" data-type="roadmap"></div>
                                </div>
                            </div>
                        </article>
                    </section>



                    <aside class="span4">



                        <div class="sidebar-item opening-time" id="opening_time-4">
                            <div class="underlined">
                                <h3><span class="light">Opening</span> Time</h3>
                            </div>
                            <div class="time-table">
                                <dl class="week-day">
                                    <dt>
Monday
</dt>
                                    <dd>
                                        8:00 - 16:00
                                    </dd>
                                </dl>
                                <dl class="week-day light-bg">
                                    <dt>
Tuesday
</dt>
                                    <dd>
                                        8:00 - 16:00
                                    </dd>
                                </dl>
                                <dl class="week-day">
                                    <dt>
Wednesday
</dt>
                                    <dd>
                                        8:00 - 16:00
                                    </dd>
                                </dl>
                                <dl class="week-day light-bg today">
                                    <dt>
Thursday
</dt>
                                    <dd>
                                        10:00 - 15:00
                                    </dd>
                                </dl>
                                <dl class="week-day">
                                    <dt>
Friday
</dt>
                                    <dd>
                                        8:00 - 16:00
                                    </dd>
                                </dl>
                                <dl class="week-day light-bg">
                                    <dt>
Saturday
</dt>
                                    <dd>
                                        8:00 - 16:00
                                    </dd>
                                </dl>
                                <dl class="week-day closed">
                                    <dt>
Sunday
</dt>
                                    <dd>
                                        CLOSED
                                    </dd>
                                </dl>
                            </div>
                        </div>



                        
                    </aside>
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