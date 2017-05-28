<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<title>登录</title>
<meta name="keywords" content="">
<meta name="description" content="">

<link rel="shortcut icon" href="favicon.ico">
<link href="css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
<link href="css/font-awesome.css?v=4.4.0" rel="stylesheet">

<!-- <link href="css/animate.css" rel="stylesheet"> -->
<link href="css/style.css?v=4.1.0" rel="stylesheet">

<script>
    if (window.top !== window.self) {
	window.top.location = window.location;
    }
</script>
<style type="text/css"></style>
</head>

<body class="gray-bg">

  <div class="middle-box text-center loginscreen  animated fadeInDown">
    <div>
      <div>
        <h1 class="logo-name">CUIT</h1>
      </div>
      <h3>欢迎使用 研究生导师管理系统登录</h3>

      <form class="m-t" role="form">
        <div class="form-group">
          <input type="text" class="form-control" id="username" placeholder="用户名" required
            value="2292946166@qq.com">
        </div>
        <div class="form-group">
          <input type="password" class="form-control" id="password" placeholder="密码" required
            value="123456">
        </div>
        <button type="button" class="btn btn-primary block full-width m-b" id="loginBtn">登
          录</button>


        <p class="text-muted text-center">
          <a href="register.jsp">注册一个新账号</a>
        </p>
        <span id="loginInfo"></span>
      </form>
    </div>
  </div>

  <!-- 全局js -->
  <script src="js/jquery.min.js?v=2.1.4"></script>
  <!-- <script src="js/bootstrap.min.js?v=3.3.6"></script>  -->

  <script type="text/javascript">
$(function () {
	$("#loginBtn").click(function () {
		var username = $('#username').val();
		var password = $('#password').val();
		
		$.post("LoginServlet", {username: username, password: password, identity:"user",temp: new Date()}, function (result) {
			if (result == "NO") {
				$("#loginInfo").html("<font color='red'>邮箱或密码错误</font>");
				$('#username,#password').css({
					"border" : "1px solid red"
				});
			} else {
				window.location.replace(result);
			}
		});
	});
});
</script>


</body>

</html>
