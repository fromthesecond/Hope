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
    <g:javascript src="ejs.js"/>

    <script>
        $(document).ready(function () {

            $("#input").cleditor();
            $('#exists').hide(true)
            $('#char').hide(true)
            $('#fChar').hide(true)
            $('#fSuccess').hide(true)
            $('#sChar').hide(true)
            $('#sSuccess').hide(true)
            $('#redirect').hide(true)

            $.get('/index/getCurrentUsername', function (data) {
                $('#user').html(data.username);
                $('#username').html(data.username)
            });

            $('#username').change(function () {
                var obj = {
                    username: $('#username').val()
                }
                if (obj.username && obj.username.length >= 4 && obj.username.length <= 15) {
                    $.post('/profile/setUsername', obj, function (response) {
                        if (response.success) {
                            $('#username').css({'border' : '2px solid green', 'border-radius': '4px', 'box-shadow': ' 0 0 10px green'})
                            $('#user').html(obj.username)
                            $('#redirect').show().fadeOut(6000)
                            setTimeout(timer, 7000)

                        } else {
                            $('#exists').show().fadeOut(5000);
                            $('#username').css({'border' : '2px solid black', 'border-radius': '4px', 'box-shadow': ' 0 0 10px black'})
                        }
                    });
                } else {
                    $('#char').show().fadeOut(5000);
                    $('#username').css({'border' : '2px solid #FF0033', 'border-radius': '4px', 'box-shadow': ' 0 0 10px #FF0033'})
                }

            });
            $('#firstName').change(function () {
                var first = {
                    first: $('#firstName').val()
                }
                if (first.first && first.first.length >= 3 && first.first.length <= 20) {
                    $.post('/profile/updateFirstName', first, function (response) {
                        if (response.success) {
                            $('#firstName').css({'border' : '2px solid green', 'border-radius': '4px', 'box-shadow': ' 0 0 10px green'})
                        } else {
                            alert('Response Error')
                        }
                    });
                } else {
                    $('#fChar').show()
                    $('#firstName').css({'border' : '2px solid #FF0033', 'border-radius': '4px', 'box-shadow': ' 0 0 10px #FF0033'})
                }

            });
            $('#lastName').change(function () {

            });
        });
        function timer () {
            window.location = '/logout'
        }
        function showUser() {
            $.get('/profile/getUsers', function (data) {
                var it = {it: data}
                var ejs = new EJS({url: '/templates/user.ejs'}).render(it);
            });
        }
        function updateUser () {

        }
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
                        alert(json.category)
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
                   window.location = '/profile/profile'
                } else {
                    alert('Server Error! Please, try again later')
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
        .error {
            background: crimson;
            padding: 4px;
            margin: 4px;
            color: #f5f5f5;
            width: 400px
        }
        .success {
            background: #bce8f1;
            padding: 4px;
            margin: 4px;
            color: #000000;
            width: 400px;
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
            Choose Category of topic:
            <g:select id="option" name="${category}" from="${category.name}" >

            </g:select>


            <p><input type="text" placeholder="Keywords" id = "keywords"  /></p>
            <p><button id = "add" onclick="add()">Add topic</button></p>
    </div>

    <div class="box">
        <div>
            <div id = "fChar" class="error">Check lenght of first name!</div>
            <p>First Name: <input type="text" id = "firstName"> ${details.firstName}</p>
            <div id = "fSuccess">First Name has been changed!</div>

            <div id="sChar" class="error">Check lenght of second name</div>
            <p>Last Name: <input type="text" id = "lastName"> ${details.lastName}  </p>
            <div id="sSuccess">Second Name has been changed!</div>

            <div id="exists" class="error">Current Username exists in system! Please, choose another!</div>
            <div id = "char" class="error">Check lenght of username! It must be min 4 characters!</div>
            <div id = 'redirect' class="success">Success! You must relogin with new username!</div>
            <p>Username: <input type="text" id = "username"></p>
        </div>
    </div>

    <div class="box">
        <g:each in="${userComments}">
            <p>Topic: ${it.threads.title}</p>
            <p>Left: ${it.date}</p>
            <p><textarea readonly>${it.body}</textarea></p>
            <p><g:link controller="index" action="showThread" id = "${it.threads.id}" >To Topic</g:link> </p>
            <p><g:link controller="profile" action="delComment" id="${it.id}">Delete Comment</g:link> </p>
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
    </div>
</div>
