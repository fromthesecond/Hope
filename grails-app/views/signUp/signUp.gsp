<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Sign Up</title>
    <g:javascript src="jquery-1.11.0.min.js"/>
    <g:javascript src="bootstrap.min.js"/>
    <link href='/css/bootstrap.min.css' rel="stylesheet"/>
    <link href="/css/style.css" rel="stylesheet"/>

    <script type="application/javascript">
        $(document).ready(function () {
            $('#error').hide(true);
            $('#exists').hide(true);
            $('#button').click( function () {
                submit()
            })
        });
        function submit() {
            var json = {
                "username": $('#username').val(),
                "password": $('#password').val()
            }
            if (json.username.length < 4 || json.password.length < 6) {
                $('#error').show(true).fadeOut(7000);
            } else
                $.post('/signUp/submit', json, function (response) {
                    alert(response)
                    if (response.success) {
                        window.location = '/login/auth';
                    } else $('#exists').show(true).fadeOut(8000);
                });

        }
    </script>
</head>

<body>
<div class="container checkLoginForm">
    <h2 class="form-signin-heading checkHeadSignIn">Sign Up</h2>

    <div id="error" class="alert alert-danger">Check lenght of username or password (min: username: 4, password: 6)</div>
    <div id = "exists" class="alert alert-warning">Current user is exists in system. Please, login this username <g:link controller="login"> in sign In page</g:link> </div>

    <p><input type="text" id="username" min="4" maxlength="20" class="form-control" placeholder="Username" required/></p>
    <p><input type="password" id="password" maxlength="20" class="form-control" placeholder="Password"/></p>
    <p><input type="password" id = "confirm" class="form-control" maxlength="20" placeholder="Confirm Password"/></p>
    <button id="button" class="btn btn-sm btn-primary btn-block">Sign Up</button>
</div>
</body>
</html>