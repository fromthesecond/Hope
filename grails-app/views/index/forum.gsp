<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Forum</title>
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

    <script>
    $(document).ready(function () {
        $.get('/index/getCurrentUsername', function (data) {
            $('#user').html(data.username);
        });
    });
    </script>
</head>

<body>
<div class="container_12">
    <div class="wrapper p3">
        <div class="grid_12">
            <div class="wrapper border-bot">
                <h1><a>FireBlink<strong>.com</strong></a></h1>
                <nav>
                    <ul class="menu">
                        <li><g:link controller="index" action="index">Main</g:link></li>
                        <li><a>About</a></li>
                        <li><g:link class="active" controller="index" action="main">Forum</g:link></li>
                        <li>Logged as <g:link controller="profile" action="profile"><div id="user"></div></g:link></li>
                        <li><g:link controller="logout">Log Out</g:link></li>
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
</div>
<!-- end head -->

<g:each in="${category}">
    <p><g:link controller="index" action="topics" id = "${it.id}">${it.name}</g:link> </p>
</g:each>
</body>
</html>