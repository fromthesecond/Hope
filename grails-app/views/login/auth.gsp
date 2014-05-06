<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
</head>

<body>

<form action='${postUrl}' method='POST' id='loginForm' autocomplete='off'>
    <g:if test='${flash.message}'>
        <div class="alert alert-danger">
            ${flash.message}
        </div>
    </g:if>

    <h2 class="form-signin-heading">Please sign in</h2>
    <input type="text"  name='j_username' id='username' placeholder="Username" required autofocus>
    <input type="password"  name='j_password' id='password' placeholder="Password" required>
    <label class="checkbox">
        <p id="remember_me_holder">
            <input type='checkbox' class='chk' name='${rememberMeParameter}' id='remember_me'
                   <g:if test='${hasCookie}'>checked='checked'</g:if>/>
            Remember me
        </p>
    </label>
    <input type='submit' id="submit" class="btn btn-lg btn-primary btn-block"  value='${message(code: "springSecurity.login.button")}'/>
    <g:link url="[action: 'index', controller: 'registration']">Sign Up</g:link>
</form>
</body>
</html>