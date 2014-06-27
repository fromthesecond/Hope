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

    <style>
        .div {
            border: 4px double #1e347b;
            padding: 4px 4px 4px 80px;
            margin-left: 90px;
            width: 30%;
            box-shadow: 0 0 10px rgba(0,0,0,0.5);
            font-size: 18px;
            font-family: Georgia;
            font-style: italic;
            color: brown;
        }
        #random {
            position: relative;
            left: 50%;
            border: 4px outset aqua;
            width: 30%;
            box-shadow: 0 0 20px rgba(0,0,0,0.5);
            font-size: 14px;
            font-family: Georgia;
            font-style: italic;
        }

    </style>
</head>

<body link="#dc143c" vlink="#cc242f">
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
                        <g:if test="${admin.role.authority == 'ROLE_USER'}">
                            <li>Logged as <g:link controller="profile" action="profile"><div id="user"></div></g:link></li>
                        </g:if>
                        <g:else>
                            <li>Logged as <g:link controller="admin" action="index"><div id="user"></div></g:link></li>
                        </g:else>
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
<div id = "category">
    <g:each in="${category}">
        <div class="div"><g:link controller="index" action="topics" id = "${it.id}">${it.name}</g:link> </div>
    </g:each>
</div>


<div id = "random">
    <h2>Random Topics</h2>
    <g:if test="${random.id.empty}">
        <p>There are no Topics</p>
    </g:if>
    <g:else>
        <g:each in="${random}">
            <p>${it.title}</p>
        </g:each>
    </g:else>
</div>


</body>
</html>