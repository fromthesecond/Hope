<html lang="en">
<head>
    <title>FireBlink</title>
    <meta charset="utf-8">

    <link rel = "stylesheet" href="/css/example/reset.css" type="text/css" media="screen"/>
    <link rel="stylesheet" href="/css/example/style.css" type="text/css" media="screen">
    <link rel="stylesheet" href="/css/example/grid.css" type="text/css" media="screen">

    <g:javascript src="/jquery-1.11.0.min.js"/>
    <g:javascript src = "/cufon-replace.js"/>
    <g:javascript src = "/cufon-yui.js"/>
    <g:javascript src = "/Asap_400.font.js"/>
    <g:javascript src = "/Asap_italic_400.font.js"/>
    <g:javascript src = "/FF-cash.js"/>
    <g:javascript src = "/jquery.cycle.all.js" />
    <g:javascript src = "/jquery.equalheights.js"/>

    <script>
        $('#banners')
                .cycle({
                    fx: 'fade',
                    delay: 7000 ,
                    timeout: 7000,
                    manualTrump:false,
                    cleartypeNoBg: true,
                    next: '#next',
                    prev: '#prev'
                });
    </script>
    <!--[if lt IE 8]>
    <div style=' clear: both; text-align:center; position: relative;'>
        <a href="http://windows.microsoft.com/en-US/internet-explorer/products/ie/home?ocid=ie6_countdown_bannercode">
        	<img src="http://storage.ie6countdown.com/assets/100/images/banners/warning_bar_0000_us.jpg" border="0" height="42" width="820" alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today." />
        </a>
    </div>

   		<script type="text/javascript" src="js/html5.js"></script>
        <link rel="stylesheet" href="css/ie.css" type="text/css" media="screen">
	<![endif]-->
</head>
<body id="page1">
<div class="main">
    <!--==============================header=================================-->
    <header>
        <div class="container_12">
            <div class="wrapper p3">
                <div class="grid_12">
                    <div class="wrapper border-bot">
                        <h1><a>FireBlink<strong>.com</strong></a></h1>
                        <nav>
                            <ul class="menu">
                                <li><a class="active">Main</a></li>
                                <li><a>About</a></li>
                                <li><g:link controller="index" action="forum">Forum</g:link></li>
                                <li><g:link controller="login" action="auth">Sign In</g:link></li>
                                <li><g:link controller="signUp" action="signUp">Sign Up</g:link></li>
                            </ul>
                        </nav>
                    </div>
                    <div class="wrapper">
                        <div id="banners" class="border-bot">
                            <div>
                                <strong class="title-1">Let’s Create</strong>
                                <strong class="title-2">Develop conscientiously</strong>
                            </div>
                            <div>
                                <strong class="title-1">We Know</strong>
                                <strong class="title-2">How make a simple and effective</strong>
                            </div>
                            <div>
                                <strong class="title-1">Discover</strong>
                                <strong class="title-2">New technologies and developments</strong>
                            </div>
                        </div>
                        <a id="prev" href="#">prev</a>
                        <a id="next" href="#">next</a>
                    </div>
                </div>
            </div>
            <article class="grid_3">
                <div class="box">
                    <figure></figure>
                    <div class="padding">
                        <strong class="title-3 color-1">Consulting</strong>
                        <a class="link">Experts from around the world</a>
                    </div>
                </div>
            </article>
            <article class="grid_3">
                <div class="box">
                    <figure></figure>
                    <div class="padding">
                        <strong class="title-3 color-2">Training</strong>
                        <a class="link">Prospective students of all universities of the city</a>
                    </div>
                </div>
            </article>
            <article class="grid_3">
                <div class="box">
                    <figure></figure>
                    <div class="padding">
                        <strong class="title-3 color-3">Analysis</strong>
                        <a class="link">Productivity of each employee</a>
                    </div>
                </div>
            </article>
            <article class="grid_3">
                <div class="box">
                    <figure></figure>
                    <div class="padding">
                        <strong class="title-3 color-4">Research</strong>
                        <a class="link">Business areas and places on the market</a>
                    </div>
                </div>
            </article>
            <div class="clear"></div>
        </div>
    </header>

    <!--==============================content================================-->
    <section id="content"><div class="ic"></div>
        <div class="container_12">
            <div class="wrapper">
                <article class="grid_4">
                    <div class="indent-right">
                        <div class="maxheight img-indent-bot">
                            <h3>Welcome!</h3>
                            <p>Guide.com is one of <a class="link" target="_blank" href="http://blog.templatemonster.com/free-website-templates/ ">free website templates</a> created by TemplateMonster.com. This website template is optimized for 1280X1024 screen resolution. It is also XHTML &amp; CSS valid.</p>
                            This <a class="link" href="http://blog.templatemonster.com/2012/02/13/free-website-template-jquery-cycle-slider-business/">Guide.com Template</a> goes with two pack ages – with PSD source files and without them. PSD source files are available for free for the registered members of TemplateMonster.com. The basic package (without PSD source) is available for anyone without registration.
                        </div>
                        <a class="button" href="#">More</a>
                    </div>
                </article>
                <article class="grid_4">
                    <div class="indent">
                        <div class="maxheight img-indent-bot">
                            <h3>Recent News</h3>
                            <time class="tdate-1" datetime="2012-02-06"><a class="link" href="#">Posted: 6.02.2012</a></time>
                            <p>Nam liber tempor cum soluta nobis eleifend option congue nihimperdiet doming quod mazim placerat facer possim assum orem ipsum dolor sit amet consectetuer.</p>
                            <time class="tdate-1" datetime="2012-02-04"><a class="link" href="#">Posted: 4.02.2012</a></time>
                            Adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation.
                        </div>
                        <a class="button" href="#">More</a>
                    </div>
                </article>
                <article class="grid_4">
                    <div class="indent-left">
                        <div class="maxheight img-indent-bot">
                            <h3 class="p1">Our Services</h3>
                            <ul class="list-1">
                                <li><a href="#">Management Consulting</a></li>
                                <li><a href="#">Policy and Regulatory Analysis</a></li>
                                <li><a href="#">Market Assessment</a></li>
                                <li><a href="#">Program Management</a></li>
                                <li><a href="#">Regulatory Support</a></li>
                                <li><a href="#">Scientific and Risk Assessment</a></li>
                                <li><a href="#">Change Management</a></li>
                            </ul>
                        </div>
                        <a class="button" href="#">More</a>
                    </div>
                </article>
            </div>
        </div>
    </section>

    <!--==============================footer=================================-->
    <footer>
        <div class="inner">
            <div class="footer-bg">
               <span>Diploma Work by Roman Yakovchuk</span>
            </div>
        </div>
    </footer>
</div>
<script type="text/javascript"> Cufon.now(); </script>
</body>
</html>
