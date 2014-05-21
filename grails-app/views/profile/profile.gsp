<%--
  Created by IntelliJ IDEA.
  User: fate
  Date: 06.05.14
  Time: 18:33
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Profile</title>
    <g:javascript src="jquery-1.11.0.min.js"/>
    <g:javascript src="bootstrap.min.js"/>
    <g:javascript src = "ejs.js"/>
    <link href="/css/bootstrap.min.css"/>
    <link href="/css/style.css"/>

    <script>
        $(document).ready(function (){
            $('#button').click(function () {
            $.get('/profile/getUsers', function (data) {
                var unknown = {unknown: data}
                var json = new EJS({url: '/templates/user.ejs'}).render(unknown);
                $('#list').append(json);
            });
            });
        });
    </script>
</head>
<body>
<h1>Hello from profile</h1>
<button id = "button" class="btn btn-sm">Show Users</button>
<div id = "list"></div>
<g:link controller="logout">Logout</g:link>
</body>
</html>