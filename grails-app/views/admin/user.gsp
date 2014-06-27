<%@ page contentType="text/html;charset=UTF-8" %>
<title>Profile</title>
<link rel = "stylesheet" href="/css/example/reset.css" type="text/css" media="screen"/>
<link rel="stylesheet" href="/css/example/style.css" type="text/css" media="screen">
<link rel="stylesheet" href="/css/example/grid.css" type="text/css" media="screen">
<link rel="stylesheet" href="/css/plugins/tabs.css" type="text/css"/>
<link rel="stylesheet" href="/css/plugins/jquery.cleditor.css" type="text/css"/>

<g:javascript src="/jquery-1.11.0.min.js"/>
<g:javascript src="/plugins/tabs.js"/>

<script>
    $(document).ready(function () {
        $.get('/index/getCurrentUsername', function (data) {
            $('#user').html(data.username);
            $('#username').html(data.username)
        });
    });
</script>

<div class="container_12">
    <div class="wrapper p3">
        <div class="grid_12">
            <div class="wrapper border-bot">
                <h1><a>FireBlink<strong>.com</strong></a></h1>
                <nav>
                    <ul class="menu">
                        <li><g:link controller="index" action="index">Main</g:link></li>
                        <li><a>About</a></li>
                        <li><g:link  controller="index" action="forum">Forum</g:link></li>
                        <li>Logged as <g:link controller="profile" action="profile" class="active"><div id="user"></div></g:link></li>
                        <li><g:link controller="logout">Log Out</g:link></li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</div>

<h2>User Details</h2>
<hr>
<g:each in="${user}">
    <p>ID in system: ${it.id}</p>
    <p>Username: ${it.username}</p>
    <p>First Name: ${it.firstName}</p>
    <p>Last Name: ${it.lastName}</p>
    <p>Redistered Date: ${it.date}</p>
    <p>Role in System: ${it.role.authority}</p>
    <p><g:link controller="admin" action="changeRole" id="${it.id}">Change role</g:link></p>
    <g:if test="${it.comments.empty}">
        <p>Comments: ${it.username} hasnt comments!</p>
    </g:if>
    <g:else>
        <div style="border: 2px solid #bce8f1; width: 710px">
        <div style="border: 4px solid burlywood; width: 700px;">
            <p>${it.comments.iterator().next().body}</p>
        </div>
            <p>Left: ${it.comments.iterator().next().date}</p>
            <g:link controller="profile" action="delComment" id="${it.comments.iterator().next().id}">Delete Comment</g:link>
        </div>
    </g:else>
</g:each>
