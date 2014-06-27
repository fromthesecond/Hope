<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Topics</title>
    <link rel = "stylesheet" href="/css/example/reset.css" type="text/css" media="screen"/>
    <link rel="stylesheet" href="/css/example/style.css" type="text/css" media="screen">
    <link rel="stylesheet" href="/css/example/grid.css" type="text/css" media="screen">

    <g:javascript src="/jquery-1.11.0.min.js"/>
    <script>
        $(document).ready(function () {
            $.get('/index/getCurrentUsername', function (data) {
                $('#user').html(data.username);
            });
        });
    </script>

    <style>
        .div {
            margin-left: 10%;
        }
    </style>
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
                        <li><g:link  class="active" controller="index" action="forum">Forum</g:link></li>
                        <li>Logged as <g:link controller="profile" action="profile"><div id="user"></div></g:link></li>
                        <li><g:link controller="logout">Log Out</g:link></li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</div>
<!-- end head -->

<div class="div">
    <g:each in="${thread}">
        <p>Author: ${it.author.username}</p>
        <p>Created: ${it.date}</p>
        <p><g:link controller="index" action="showThread" id = "${it.id}">${it.title}</g:link></p>
    </g:each>
</div>

</body>
</html>