<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
</head>

<body>
<g:each in="${thread}">
    <p>${it.title}</p>
    <p>${it.author.username}</p>
</g:each>
</body>
</html>