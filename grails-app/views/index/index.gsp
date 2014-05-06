<%--
  Created by IntelliJ IDEA.
  User: fate
  Date: 06.05.14
  Time: 18:12
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Hello</title>
 <g:javascript src="bootstrap.min.js"/>
 <g:javascript src="jquery-1.11.0.min.js"/>
 <link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.min.css')}" type="text/css">
 <link rel="stylesheet" href="${resource(dir: 'css', file : 'style.css')}" type="text/css">

</head>

<body>
<g:link controller="login" action="auth">Login</g:link>
</body>
</html>