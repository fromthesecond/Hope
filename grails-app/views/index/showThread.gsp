<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>${details.title}</title>

    <g:javascript src="bootstrap.min.js"/>
    <g:javascript src="jquery-1.11.0.min.js"/>
    <g:javascript src="bootstrap.min.js"/>
    <g:javascript src="plugins/prettify.js"/>
    <g:javascript src="plugins/app.js"/>

    <link href="/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="/css/style.css" rel="stylesheet"/>
    <link href="/css/plugins/prettify.css" rel="stylesheet"/>
    <link href="/css/plugins/bootstrap-responsive.css" rel="stylesheet"/>

    <style>
        .divs {
            border: 2px;
            border-style: inset;
            border-color: #ebebeb;
            padding-left: 10%;
            padding-right: 10%;
            margin: 2px;
        }
        .commentBox {
            border: 8px;
            border-style: groove;
            border-color: mediumaquamarine;
            background: gainsboro;
            padding-left: 15%;
            padding-right: 15%;
            margin: 20px;
            width: 81%;
            position: relative;
            left: 8%;
            background: honeydew;
        }

        .addComment {
            border: 8px;

        }
    </style>
</head>

<body>
<g:link controller="index" action="forum"><button class="btn btn-sm bg-success">Back to Forum</button></g:link>

<h1 class="h1">${details.title}</h1>
<kbd>Author:</kbd>
<abbr title="Karma: ${details.author.karma} Registered Date: ${details.author.date}">${details.author.username}</abbr>
<div class="divs">
    <pre class="prettyprint">
        ${details.body}
    </pre>
    <hr>
</div>
<h1 class="h1">Comments</h1>
<div class="commentBox">
aslls
</div>

<hr>
<div class="addComment">
    <textarea class="form-control" rows="3"></textarea>
</div>
</body>
</html>