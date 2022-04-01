<%@page import="contraints.Common"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js">

<head>
    <meta charset="utf-8">
    <title>Sunshine Shop - About Us</title>
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
                                <a href="#">About Us</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="push-up blocks-spacer">
                <div class="row">



                    <aside class="span3">
                        <div class="sidebar-item">



                            <div class="underlined">
                                <h3><span class="light">Our</span> Team</h3>
                            </div>



                            <div class="row">
                                <div class="span3" id="spyMenu">
                                    <ul class="nav nav-pills nav-stacked">
                                        <li class="active"><a href="#jaka">Dương Tấn Lực <i class="icon-caret-right pull-right"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </aside>



                    <section class="span9">



                        <div class="underlined push-down-20">
                            <h3><span class="light">A</span> Little Something About Us</h3>
                        </div>



                        <section class="blocks-spacer">
                            <h5><span class="light">How</span> Everything Started</h5>
                            <p>The Big Bang was the moment 13.8 billion years ago when the universe began as a tiny, dense, fireball that exploded. Most astronomers use the Big Bang theory to explain how the universe began. ... The matter that spread out from the Big Bang developed into everything in the universe, including you.</p>
                            <h5><span class="light">What</span> Happens Next</h5>
                            <p>Since the Big Bang, the universe has been expanding. In the early years, everything was made of gas. This gas, mostly hydrogen and helium, expanded and cooled. Over billions of years, gravity caused gas and dust to form galaxies, stars , planets, and more.

The matter that spread out from the Big Bang developed into everything in the universe, including you. You are made of star stuff!</p>
                            <h5><span class="light">And</span> Who We Are Today!</h5>
                            <p>Astronomers have figured out that the universe is about 13 billion years old. (We’d better skip the candles on the birthday cake!) They have also determined, approximately, when different cosmic events happened, such as when our galaxy and our planet formed.</p>
                        </section>



                        <section>



                            <div class="underlined push-down-20">
                                <h3><span class="light">Faces</span> Behind the Sunshine Shop</h3>
                            </div>

                            <div class="row-fluid push-down-20" id="jaka">
                                <div class="span4">
                                    <a href="#"><img src="<%=Common.url %>/views/images/dummy/me.jpg" alt="person" width="550" height="660" /></a>
                                </div>
                                <div class="span4">
                                    <h4><span class="light">Dương Tấn</span> Lực</h4>
                                    <h6 class="move-title-up">Fresher Developer</h6>
                                    <p>PS17380 <br>
                                    IT16317 <br>
                                    Spring2022 - Sof3011 <br>
                                    Java 4<br>
                                    </p>
                                </div>
                                <div class="span4">
                                    <blockquote>
                                        <i class="icon-quote-left icon-5x"></i>
                                        <p>Here are some things about me. I am passionate about programming, listening to music and traveling and eating .</p>
                                    </blockquote>
                                </div>
                            </div>
                            
                            
                        </section>
                        <hr/>
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