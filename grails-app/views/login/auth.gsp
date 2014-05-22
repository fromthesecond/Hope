<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Sign In</title>
<g:javascript src="bootstrap.min.js"/>
<g:javascript src="jquery-1.11.0.min.js"/>
<link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.min.css')}" type="text/css">
<link rel="stylesheet" href="${resource(dir: 'css', file : 'style.css')}" type="text/css">
</head>
<script>
    $(document).ready( function () {



    });
    function listen () {

    }
</script>

<body>

<div class="container checkLoginForm">
<h2 class="form-signin-heading checkHeadSignIn">Sign in</h2>

<form action='${postUrl}' method='POST' id='loginForm' autocomplete='off'>
    <g:if test='${flash.message}'>
        <div class="alert alert-danger">
            ${flash.message}
        </div>
    </g:if>


    <div id = "error" class="error" hidden="true"><p>Error, check the number of characters!</p></div>
    <p>
        <input type="text" class = "form-control" name='j_username' id='username' placeholder="Username" required autofocus>
    </p>
    <p>
        <input type="password"  class = "form-control" name='j_password' id='password' placeholder="Password" required>
    </p>

    <label class="checkbox">
        <p id="remember_me_holder">
            <input type='checkbox' class='chk' name='${rememberMeParameter}' id='remember_me'
                   <g:if test='${hasCookie}'>checked='checked'</g:if>/>
            Remember me
        </p>
    </label>
    <input type='submit' id="submit" class="btn btn-sm btn-primary btn-block"  value='${message(code: "springSecurity.login.button")}'/>
<hr style="height: 2px; background-color: #444444 ">
<p class="bg-danger">Do not have account? <g:link controller="signUp" action="signUp"><button type="button" class="btn btn-info btn-sm" value="Sign Up" >Sign Up</button></g:link></p>
</form>
</div>
</body>
</html>