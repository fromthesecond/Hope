<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
</head>

<body>
<g:each in="${thread}">
  <p>Author: ${it.author.username}</p>
  <p>Created: ${it.date}</p>
  <p><g:link controller="index" action="showThread" id = "${it.id}">${it.title}</g:link></p>
</g:each>
</body>
</html>