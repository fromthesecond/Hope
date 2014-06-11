<%@ page contentType="text/html;charset=UTF-8" %>
    <title>Profile</title>
    <link rel = "stylesheet" href="/css/example/reset.css" type="text/css" media="screen"/>
    <link rel="stylesheet" href="/css/example/style.css" type="text/css" media="screen">
    <link rel="stylesheet" href="/css/example/grid.css" type="text/css" media="screen">
    <link rel="stylesheet" href="/css/plugins/tabs.css" type="text/css"/>
    <link rel="stylesheet" href="/css/plugins/jquery.cleditor.css" type="text/css"/>

    <g:javascript src="/jquery-1.11.0.min.js"/>
    <g:javascript src="/plugins/tabs.js"/>
    <g:javascript src="/plugins/jquery.cleditor.js"/>
    <g:javascript src="/plugins/jquery.cleditor.min.js"/>
    <script>
        $(document).ready(function () {
            $("#input").cleditor();
            $('#deleted').hide(true)
            $('#cant').hide(true)
            $.get('/index/getCurrentUsername', function (data) {
                $('#user').html(data.username);
            });
        });
    </script>
    <script>
        function add () {
            var json = {
                title: $('#title').val(),
                body: $('#input').val(),
                keywords: $('#keywords').val(),
                category: $('#option').val()
            };
                $.post('/profile/addTopic', json, function (response) {
                    if (response.success) {
                        alert('Success')
                        window.location = '/login/auth';
                    } else {
                        alert('Server Error. Try again later!')
                    }
                });
        }

        function deleteTopic (idTopic) {
            var id = {
                id : idTopic
            }
            $.post('/profile/delTopic', id, function (response) {
                if (response.success) {
                    $('#deleted').show(true).fadeIn(4000).fadeOut(4000)
                    $('#button').prop('disabled', true)
                } else {
                    $('#cant').show(true).fadeIn(4000).fadeOut(4000)
                }
            });
        }
    </script>
    <style>
        input {
            width: 600px;
            padding: 4px;
            margin: 4px;
        }
        #cant {
            color: coral;
            font-size: 20px;
        }
        #deleted {
            color: #bce8f1;
            font-size: 20px;
        }
    </style>


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
<!-- end head -->

<div class="section">

    <ul class="tabs">
        <li class="current">Add Topic</li>
        <li>Profile</li>
        <li>Left Comments</li>
        <li>Created Topics</li>
    </ul>

    <div class="box visible">
            <input type="text" class="form-control" placeholder="Title" id = "title"  />
            <abbr title="Use <code></code> to set code"><textarea id="input" name="input"></textarea></abbr>
            <p>Use tags &lt;pre&gt;  to set code</p>
            Choose Category of topic: <select class="form-control">
            <g:each in="${category}">
                    <option id="option">${it.name}</option>
            </g:each>
            </select>

            <p><input type="text" placeholder="Keywords" id = "keywords"  /></p>
            <p><button id = "add" onclick="add()">Add topic</button></p>
    </div>

    <div class="box">

    </div>

    <div class="box">
        <g:each in="${userComments}">
            <p>Comment: ${it.body}</p>
            <p>Left: ${it.date}</p>
            <p><g:link controller="index" action="showThread" id = "${it.threads.id}" >To Topic</g:link> </p>
            <br>
        </g:each>
    </div>

    <div class="box">
        <g:each in="${userThreads}">
                <p>Title: ${it.title}</p>
                <p>Created: ${it.date}</p>
                <p><g:link controller="index" action="showThread" id="${it.id}">To ${it.title}</g:link> </p>
                <p><button id = "button" onclick="deleteTopic(${it.id})">Delete Topic</button> </p>
        </g:each>
        <div id="deleted">This topic has been deleted!</div>
        <div id="cant">Cannot delete this topic. Try again later!</div>
    </div>
</div>
