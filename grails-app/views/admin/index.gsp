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


<div class="section">

    <ul class="tabs">
        <li class="current">Users List</li>
        <li>Topics List</li>
        <li>Comments List</li>
    </ul>

    <div class="box visible">
       <g:each in="${users}">
           <g:link controller="admin" action="user" id="${it.id}"><p>${it.username}</p></g:link>
           <p>.........................................</p>
       </g:each>
    </div>

    <div class="box">
        <g:each in="${topics}">
            <p>Title: ${it.title}</p>
            <p>Author: ${it.author}</p>
            <p>Category: ${it.category}</p>
            <p>Left: ${it.date}</p>
            <g:link controller="admin" action="delTopic" id = "${it.id}">Delete topic</g:link>
        </g:each>
    </div>

    <div class="box">
      <g:each in="${comments}">
          <p>${it.author}</p>
          <textarea>${it.body}</textarea>
          <g:link controller="admin" action="delComment" id="${it.id}">Delete Comment</g:link>
      </g:each>
    </div>

</div>
