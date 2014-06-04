<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>${details.title}</title>
</head>

<body>
    <h1>${details.title}</h1>
    <h4>${details.author.username}</h4>
    <p>${details.date}</p>
    <p>${details.body}</p>
    <p>${details.category.name}</p>
</body>
</html>