<%--
  Created by IntelliJ IDEA.
  User: Minh Hung Tran
  Date: 15/12/2019
  Time: 1:23 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="https://code.jquery.com/jquery-1.10.2.js"
            type="text/javascript"></script>
    <script src="js/app-ajax.js" type="text/javascript"></script>
</head>
<body>
<form>
    Enter Your Name: <input type="text" id="userName" />
</form>
<br>
<br>

<strong>Ajax Response</strong>:
<div id="ajaxGetUserServletResponse"></div>

<script>
    $(document).ready(function() {
        $('#userName').blur(function() {
            $.ajax({
                url : 'GetUserServlet',
                data : {
                    userName : $('#userName').val()
                },
                success : function(responseText) {
                    $('#ajaxGetUserServletResponse').text(responseText);
                }
            });
        });
    });
    $.ajax({
        url: url,
        data: data,
        success: success,
        dataType: dataType
    });
</script>
</body>
</html>
