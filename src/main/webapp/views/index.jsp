<%--
  Created by IntelliJ IDEA.
  User: saamk
  Date: 12/24/2024
  Time: 11:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="org.json.JSONObject" %>
<%@ page import="org.json.JSONException" %>
<%@ page import="org.json.JSONObject" %>
<%@ page import="org.json.JSONArray" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Portfolio</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    <meta name="author" content="" />

    <!-- Facebook and Twitter integration -->
    <meta property="og:title" content=""/>
    <meta property="og:image" content=""/>
    <meta property="og:url" content=""/>
    <meta property="og:site_name" content=""/>
    <meta property="og:description" content=""/>
    <meta name="twitter:title" content="" />
    <meta name="twitter:image" content="" />
    <meta name="twitter:url" content="" />
    <meta name="twitter:card" content="" />

    <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
    <link rel="shortcut icon" href="favicon.ico">

    <link href="https://fonts.googleapis.com/css?family=Quicksand:300,400,500,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i,700" rel="stylesheet">

    <!-- Animate.css -->
    <link rel="stylesheet" href="../css/animate.css">
    <!-- Icomoon Icon Fonts-->
    <link rel="stylesheet" href="../css/icomoon.css">
    <!-- Bootstrap  -->
    <link rel="stylesheet" href="../css/bootstrap.css">
    <!-- Flexslider  -->
    <link rel="stylesheet" href="../css/flexslider.css">
    <!-- Flaticons  -->
    <link rel="stylesheet" href="../fonts/flaticon/font/flaticon.css">
    <!-- Owl Carousel -->
    <link rel="stylesheet" href="../css/owl.carousel.min.css">
    <link rel="stylesheet" href="../css/owl.theme.default.min.css">
    <!-- Theme style  -->
    <link rel="stylesheet" href="../css/style.css">

    <!-- Modernizr JS -->
    <script src="../js/modernizr-2.6.2.min.js"></script>
    <!-- FOR IE9 below -->
    <!--[if lt IE 9]>
    <script src="../js/respond.min.js"></script>
    <![endif]-->

</head>
<body>
<div id="colorlib-page">
    <div class="container-wrap">
        <a href="#" class="js-colorlib-nav-toggle colorlib-nav-toggle" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar"><i></i></a>
        <aside id="colorlib-aside" role="complementary" class="border js-fullheight">
            <div class="text-center">
                <div class="author-img" style="background-image: url(../images/user.jpg);"></div>
                <h1 id="colorlib-logo"><a href="index.html">Saam Khatri</a></h1>
                <span class="position"><a href="#">Software Engineer and Developer</a> in Nepal</span>
            </div>
            <nav id="colorlib-main-menu" role="navigation" class="navbar">
                <div id="navbar" class="collapse">
                    <ul>
                        <li class="active"><a href="#" data-nav-section="home">Home</a></li>
                        <li><a href="#" data-nav-section="about">About</a></li>
                        <li><a href="#" data-nav-section="skills">Skills</a></li>
                        <li><a href="#" data-nav-section="education">Education</a></li>
                        <li><a href="#" data-nav-section="experience">Experience</a></li>
                        <li><a href="#" data-nav-section="blog">Blog</a></li>
                        <li><a href="#" data-nav-section="contact">Contact</a></li>
                    </ul>
                </div>
            </nav>

        </aside>

        <div id="colorlib-main">
            <section id="colorlib-hero" class="js-fullheight" data-section="home">
                <div class="flexslider js-fullheight">
                    <ul class="slides">
                        <%
                            String homeData = (String) request.getAttribute("homeData");
                            JSONArray homeJsonArray = new JSONArray(homeData);
                            for (int i = 0; i < homeJsonArray.length(); i++) {
                                JSONObject jsonObject = homeJsonArray.getJSONObject(i);
                        %>
                        <li style="background-image: url(images/butt_img.jpg);">
                            <div class="overlay"></div>
                            <div class="container-fluid">
                                <div class="row">
                                    <div class="col-md-6 col-md-offset-3 col-md-pull-3 col-sm-12 col-xs-12 js-fullheight slider-text">
                                        <div class="slider-text-inner js-fullheight">
                                            <div class="desc">
                                                <h1>Hi! <br>I'm <%= jsonObject.get("name") %> </h1>
                                                <h2><%= jsonObject.get("detail") %>   </h2>
                                                <p><a class="btn btn-primary btn-learn">Download CV <i class="icon-download4"></i></a></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <% } %>
                    </ul>
                </div>
            </section>

            <section class="colorlib-about" data-section="about">
                <div class="colorlib-narrow-content">
                    <div class="row">
                        <div class="col-md-12">
                            <%
                                String aboutData = (String) request.getAttribute("aboutData");
//     out.print(jsonData);
                                JSONObject aboutObject = new JSONObject(aboutData);


                                String detail = aboutObject.getString("details");
                                String one = aboutObject.getString("skill_one");
                                String two = aboutObject.getString("skill_two");
                                String three = aboutObject.getString("skill_three");
                                String last = aboutObject.getString("skill_last");



                            %>
                            <div class="row row-bottom-padded-sm animate-box" data-animate-effect="fadeInLeft">
                                <div class="col-md-12">
                                    <div class="about-desc">
                                        <span class="heading-meta">About Us</span>
                                        <h2 class="colorlib-heading">Who Am I?</h2>
                                        <p><strong>Hi I'm Saam Khatri</strong> <%=detail%>>  </p>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-3 animate-box" data-animate-effect="fadeInLeft">
                                    <div class="services color-1">
                                        <span class="icon2"><i class="icon-bulb"></i></span>
                                        <h3><%=one%> </h3>
                                    </div>
                                </div>
                                <div class="col-md-3 animate-box" data-animate-effect="fadeInRight">
                                    <div class="services color-2">
                                        <span class="icon2"><i class="icon-globe-outline"></i></span>
                                        <h3><%=two%>> </h3>
                                    </div>
                                </div>
                                <div class="col-md-3 animate-box" data-animate-effect="fadeInTop">
                                    <div class="services color-3">
                                        <span class="icon2"><i class="icon-data"></i></span>
                                        <h3><%=three%>> </h3>
                                    </div>
                                </div>
                                <div class="col-md-3 animate-box" data-animate-effect="fadeInBottom">
                                    <div class="services color-4">
                                        <span class="icon2"><i class="icon-phone3"></i></span>
                                        <h3><%=last%>> </h3>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12 animate-box" data-animate-effect="fadeInLeft">
                                    <div class="hire">
                                        <h2>I am happy to know you <br>that 3+ projects done sucessfully!</h2>
                                        <a href="#" class="btn-hire">Hire me</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <section class="colorlib-skills" data-section="skills">
                <div class="colorlib-narrow-content">
                    <div class="row">
                        <div class="col-md-6 col-md-offset-3 col-md-pull-3 animate-box" data-animate-effect="fadeInLeft">
                            <span class="heading-meta">My Specialty</span>
                            <h2 class="colorlib-heading animate-box">My Skills</h2>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12 animate-box" data-animate-effect="fadeInLeft">
                            <p>The Big Oxmox advised her not to do so, because there were thousands of bad Commas, wild Question Marks and devious Semikoli, but the Little Blind Text didn’t listen. She packed her seven versalia, put her initial into the belt and made herself on the way.</p>
                        </div>
                        <div class="col-md-6 animate-box" data-animate-effect="fadeInLeft">
                            <div class="progress-wrap">
                                <h3>Photoshop</h3>
                                <div class="progress">
                                    <div class="progress-bar color-1" role="progressbar" aria-valuenow="75"
                                         aria-valuemin="0" aria-valuemax="100" style="width:50%">
                                        <span>50%</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 animate-box" data-animate-effect="fadeInRight">
                            <div class="progress-wrap">
                                <h3>Figma</h3>
                                <div class="progress">
                                    <div class="progress-bar color-6" role="progressbar" aria-valuenow="60"
                                         aria-valuemin="0" aria-valuemax="100" style="width:50%">
                                        <span>50%</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 animate-box" data-animate-effect="fadeInLeft">
                            <div class="progress-wrap">
                                <h3>HTML5</h3>
                                <div class="progress">
                                    <div class="progress-bar color-3" role="progressbar" aria-valuenow="85"
                                         aria-valuemin="0" aria-valuemax="100" style="width:85%">
                                        <span>85%</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 animate-box" data-animate-effect="fadeInRight">
                            <div class="progress-wrap">
                                <h3> CSS and CSS3</h3>
                                <div class="progress">
                                    <div class="progress-bar color-4" role="progressbar" aria-valuenow="90"
                                         aria-valuemin="0" aria-valuemax="100" style="width:90%">
                                        <span>90%</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 animate-box" data-animate-effect="fadeInLeft">
                            <div class="progress-wrap">
                                <h3>JavaScript and JQuery</h3>
                                <div class="progress">
                                    <div class="progress-bar color-5" role="progressbar" aria-valuenow="70"
                                         aria-valuemin="0" aria-valuemax="100" style="width:70%">
                                        <span>70%</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 animate-box" data-animate-effect="fadeInRight">
                            <div class="progress-wrap">
                                <h3>PHP</h3>
                                <div class="progress">
                                    <div class="progress-bar color-6" role="progressbar" aria-valuenow="80"
                                         aria-valuemin="0" aria-valuemax="100" style="width:80%">
                                        <span>80%</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 animate-box" data-animate-effect="fadeInLeft">
                            <div class="progress-wrap">
                                <h3>JAVA</h3>
                                <div class="progress">
                                    <div class="progress-bar color-2" role="progressbar" aria-valuenow="80"
                                         aria-valuemin="0" aria-valuemax="100" style="width:80%">
                                        <span>80%</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 animate-box" data-animate-effect="fadeInRight">
                            <div class="progress-wrap">
                                <h3>Servlet and JSP</h3>
                                <div class="progress">
                                    <div class="progress-bar color-6" role="progressbar" aria-valuenow="80"
                                         aria-valuemin="0" aria-valuemax="100" style="width:80%">
                                        <span>80%</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 animate-box" data-animate-effect="fadeInLeft">
                            <div class="progress-wrap">
                                <h3>Spring and Spring Boot</h3>
                                <div class="progress">
                                    <div class="progress-bar color-2" role="progressbar" aria-valuenow="80"
                                         aria-valuemin="0" aria-valuemax="100" style="width:80%">
                                        <span>80%</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <section class="colorlib-education" data-section="education">
                <div class="colorlib-narrow-content">
                    <div class="row">
                        <div class="col-md-6 col-md-offset-3 col-md-pull-3 animate-box" data-animate-effect="fadeInLeft">
                            <span class="heading-meta">Education</span>
                            <h2 class="colorlib-heading animate-box">Education</h2>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12 animate-box" data-animate-effect="fadeInLeft">
                            <div class="fancy-collapse-panel">
                                <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                                    <div class="panel panel-default">
                                        <div class="panel-heading" role="tab" id="headingOne">
                                            <h4 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">BacheLor Degree in Computer Application
                                                </a>
                                            </h4>
                                        </div>
                                        <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                                            <div class="panel-body">
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. </p>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <p>Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel panel-default">
                                        <div class="panel-heading" role="tab" id="headingFive">
                                            <h4 class="panel-title">
                                                <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseFive" aria-expanded="false" aria-controls="collapseFive">High School Secondary Education
                                                </a>
                                            </h4>
                                        </div>
                                        <div id="collapseFive" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFive">
                                            <div class="panel-body">
                                                <p>Far far away, behind the word <strong>mountains</strong>, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <section class="colorlib-experience" data-section="experience">
                <div class="colorlib-narrow-content">
                    <div class="row">
                        <div class="col-md-6 col-md-offset-3 col-md-pull-3 animate-box" data-animate-effect="fadeInLeft">
                            <span class="heading-meta">Experience</span>
                            <h2 class="colorlib-heading animate-box">Work Experience</h2>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="timeline-centered">
                                <article class="timeline-entry animate-box" data-animate-effect="fadeInLeft">
                                    <div class="timeline-entry-inner">

                                        <div class="timeline-icon color-1">
                                            <i class="icon-pen2"></i>
                                        </div>

                                        <div class="timeline-label">
                                            <h2><a href="#">Web Developer</a> <span>2017-2018</span></h2>
                                            <p>Tolerably earnestly middleton extremely distrusts she boy now not. Add and offered prepare how cordial two promise. Greatly who affixed suppose but enquire compact prepare all put. Added forth chief trees but rooms think may.</p>
                                        </div>
                                    </div>
                                </article>

                                <article class="timeline-entry animate-box" data-animate-effect="fadeInLeft">
                                    <div class="timeline-entry-inner">
                                        <div class="timeline-icon color-5">
                                            <i class="icon-pen2"></i>
                                        </div>
                                        <div class="timeline-label">
                                            <h2><a href="#">Creative Web Designer</a> <span>2017-2018</span></h2>
                                            <p>Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.</p>
                                        </div>
                                    </div>
                                </article>
                                <article class="timeline-entry animate-box" data-animate-effect="fadeInLeft">
                                    <div class="timeline-entry-inner">

                                        <div class="timeline-icon color-1">
                                            <i class="icon-pen2"></i>
                                        </div>

                                        <div class="timeline-label">
                                            <h2><a href="#">PHP Developer</a> <span>2017-2018</span></h2>
                                            <p>Tolerably earnestly middleton extremely distrusts she boy now not. Add and offered prepare how cordial two promise. Greatly who affixed suppose but enquire compact prepare all put. Added forth chief trees but rooms think may.</p>
                                        </div>
                                    </div>
                                </article>
                                <article class="timeline-entry animate-box" data-animate-effect="fadeInLeft">
                                    <div class="timeline-entry-inner">

                                        <div class="timeline-icon color-1">
                                            <i class="icon-pen2"></i>
                                        </div>

                                        <div class="timeline-label">
                                            <h2><a href="#">JAVA Developer</a> <span>2017-2018</span></h2>
                                            <p>Tolerably earnestly middleton extremely distrusts she boy now not. Add and offered prepare how cordial two promise. Greatly who affixed suppose but enquire compact prepare all put. Added forth chief trees but rooms think may.</p>
                                        </div>
                                    </div>
                                </article>
                            </div>
                        </div>
                    </div>
                </div>
            </section>



            <section class="colorlib-blog" data-section="blog">
                <div class="colorlib-narrow-content">
                    <div class="row">
                        <div class="col-md-6 col-md-offset-3 col-md-pull-3 animate-box" data-animate-effect="fadeInLeft">
                            <span class="heading-meta">Read</span>
                            <h2 class="colorlib-heading">Recent Blog</h2>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4 col-sm-6 animate-box" data-animate-effect="fadeInLeft">
                            <div class="blog-entry">
                                <a href="blog.html" class="blog-img"><img src="images/blog-1.jpg" class="img-responsive" alt="HTML5 Bootstrap Template by colorlib.com"></a>
                                <div class="desc">
                                    <span><small>April 14, 2018 </small> | <small> Web Design </small> | <small> <i class="icon-bubble3"></i> 4</small></span>
                                    <h3><a href="blog.html">Renovating National Gallery</a></h3>
                                    <p>Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 col-sm-6 animate-box" data-animate-effect="fadeInRight">
                            <div class="blog-entry">
                                <a href="blog.html" class="blog-img"><img src="images/blog-2.jpg" class="img-responsive" alt="HTML5 Bootstrap Template by colorlib.com"></a>
                                <div class="desc">
                                    <span><small>April 14, 2018 </small> | <small> Web Design </small> | <small> <i class="icon-bubble3"></i> 4</small></span>
                                    <h3><a href="blog.html">Wordpress for a Beginner</a></h3>
                                    <p>Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 col-sm-6 animate-box" data-animate-effect="fadeInLeft">
                            <div class="blog-entry">
                                <a href="blog.html" class="blog-img"><img src="images/blog-3.jpg" class="img-responsive" alt="HTML5 Bootstrap Template by colorlib.com"></a>
                                <div class="desc">
                                    <span><small>April 14, 2018 </small> | <small> Inspiration </small> | <small> <i class="icon-bubble3"></i> 4</small></span>
                                    <h3><a href="blog.html">Make website from scratch</a></h3>
                                    <p>Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12 animate-box">
                            <p><a href="#" class="btn btn-primary btn-lg btn-load-more">Load more <i class="icon-reload"></i></a></p>
                        </div>
                    </div>
                </div>
            </section>

            <section class="colorlib-contact" data-section="contact">
                <div class="colorlib-narrow-content">
                    <div class="row">
                        <div class="col-md-6 col-md-offset-3 col-md-pull-3 animate-box" data-animate-effect="fadeInLeft">
                            <span class="heading-meta">Get in Touch</span>
                            <h2 class="colorlib-heading">Contact</h2>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-5">
                            <div class="colorlib-feature colorlib-feature-sm animate-box" data-animate-effect="fadeInLeft">
                                <div class="colorlib-icon">
                                    <i class="icon-globe-outline"></i>
                                </div>
                                <div class="colorlib-text">
                                    <p><a href="#">saam.khatri@hotmail.com</a></p>
                                </div>
                            </div>

                            <div class="colorlib-feature colorlib-feature-sm animate-box" data-animate-effect="fadeInLeft">
                                <div class="colorlib-icon">
                                    <i class="icon-map"></i>
                                </div>
                                <div class="colorlib-text">
                                    <p>4400 Bagmati, Kathmandu muncipality wada no 6  kathmandu nepal</p>
                                </div>
                            </div>

                            <div class="colorlib-feature colorlib-feature-sm animate-box" data-animate-effect="fadeInLeft">
                                <div class="colorlib-icon">
                                    <i class="icon-phone"></i>
                                </div>
                                <div class="colorlib-text">
                                    <p><a href="tel://">+977-8342-322-12</a></p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-7 col-md-push-1">
                            <div class="row">
                                <div class="col-md-10 col-md-offset-1 col-md-pull-1 animate-box" data-animate-effect="fadeInRight">
                                    <form action="">
                                        <div class="form-group">
                                            <input type="text" class="form-control" name="name" placeholder="Name">
                                        </div>
                                        <div class="form-group">
                                            <input type="text" class="form-control" name="email" placeholder="Email">
                                        </div>
                                        <div class="form-group">
                                            <input type="text" class="form-control" name="subject" placeholder="Subject">
                                        </div>
                                        <div class="form-group">
                                            <textarea name="message" id="message" cols="30" rows="7"  class="form-control" placeholder="Message"></textarea>
                                        </div>
                                        <div class="form-group">
                                            <input type="submit" class="btn btn-primary btn-send-message" value="Send Message">
                                        </div>
                                    </form>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </section>

        </div><!-- end:colorlib-main -->
    </div><!-- end:container-wrap -->
</div><!-- end:colorlib-page -->

<!-- jQuery -->
<script src="../js/jquery.min.js"></script>
<!-- jQuery Easing -->
<script src="../js/jquery.easing.1.3.js"></script>
<!-- Bootstrap -->
<script src="../js/bootstrap.min.js"></script>
<!-- Waypoints -->
<script src="../js/jquery.waypoints.min.js"></script>
<!-- Flexslider -->
<script src="../js/jquery.flexslider-min.js"></script>
<!-- Owl carousel -->
<script src="../js/owl.carousel.min.js"></script>
<!-- Counters -->
<script src="../js/jquery.countTo.js"></script>


<!-- MAIN JS -->
<script src="../js/main.js"></script>

</body>
</html>


