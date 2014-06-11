<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page defaultCodec="none" %>
<title>${details.title}</title>
<g:javascript src="bootstrap.min.js"/>
<g:javascript src="jquery-1.11.0.min.js"/>
<g:javascript src="bootstrap.min.js"/>
<g:javascript src="plugins/prettify.js"/>
<g:javascript src="plugins/app.js"/>
<g:javascript src="ejs.js"/>
<g:javascript src="/plugins/jquery.cleditor.js"/>
<g:javascript src="/plugins/jquery.cleditor.min.js"/>
<link href="/css/bootstrap.min.css" rel="stylesheet"/>
<link href="/css/style.css" rel="stylesheet"/>
<link href="/css/plugins/prettify.css" rel="stylesheet"/>
<link href="/css/plugins/bootstrap-responsive.css" rel="stylesheet"/>
<link rel="stylesheet" href="/css/plugins/jquery.cleditor.css" type="text/css"/>
<style>
.h1 {
    color: royalblue;
}

.prettyprint {
    width: 85%;
    margin-left: 5%;
}

.divs {
    border: 2px;
    border-style: inset;
    border-color: seashell;
    padding-left: 10%;
    margin: 2px;
}

.danger {
    background-color: crimson;
    padding-left: 7%;
    padding-right: 7%;
    margin: 10px 10px 10px 10px;
    color: #E1F2B6;
}

.commentBox {
    border: 2px;
    border-style: groove;
    border-color: seashell;
    padding-right: 15%;
    width: 85%;
    position: relative;
    left: 8%;
    background: honeydew;
}

.addComment {
    border: 2px;
    border-style: solid;
    border-color: skyblue;
    height: 250px;
    padding-right: 7%;
    padding-left: 7%;
}
</style>
<script>
    $(document).ready(function () {
        $('#commentArea').cleditor({height: 200});
        $('.danger').hide(true)
    });

    function addComment() {
        var json = {
            body: $('#commentArea').val(),
            idThread: ${details.id}
        }
        if (json.body.length > 4000 || json.body.length <= 0) {
            $('.danger').show(true).fadeOut(9000)
        } else {
            alert(json.body.length)
            $.post('/index/addComment', json, function (response) {
                if (response.success) {
                    window.location = '/index/showThread/${details.id}';
                } else {
                    alert('Server Error. Please, try again later!')
                }
            });
        }
    }
</script>
<g:link controller="index" action="forum"><button class="btn btn-sm bg-success">Back to Forum</button></g:link>
<g:link controller="profile" action="profile"><button style="margin-left: 86%"
                                                      class="btn-sm bg-primary">To Profile</button></g:link>

<h1 class="h1">${details.title}</h1>
<kbd>Author:</kbd>
<abbr title="Karma: ${details.author.karma} Registered Date: ${details.author.date}">${details.author.username}</abbr>
<p align="right">Created: ${details.date}</p>

<div class="divs">
    <pre class="prettyprint">
        ${details.body.decodeHTML()}
    </pre>
    <hr>
</div>

<h1 class="h1">Comments</h1>
<g:each in="${comment}">
    <div class="commentBox">
        <kbd>Author: ${it.author.username}</kbd>
        <p>Leaved: ${it.date}</p>
        ${it.body.decodeHTML()}
    </div>

    <div id="comment"></div>
</g:each>

<hr>

<p>Left comment as <abbr title="Karma: ${current.karma} Registered Date: ${current.date}">${current.username}</abbr></p>

<div class="danger">Attention! Your comment includes too many signs or does not exist at all. Maximal comment amount is 4000 signs. Comment can not be empty.</div>

<div class="addComment">
        <textarea id="commentArea" class="form-control" maxlength="4000"></textarea>
        <input type="submit" class="btn-sm btn-info" onclick="addComment()" name="Add Comment">
</div>
