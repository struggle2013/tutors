<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<title>注册</title>
<meta name="keywords" content="">
<meta name="description" content="">

<link rel="shortcut icon" href="favicon.ico">
<link href="css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
<link href="css/font-awesome.css?v=4.4.0" rel="stylesheet">
<!-- <link href="css/plugins/iCheck/custom.css" rel="stylesheet"> -->
<link href="css/animate.css" rel="stylesheet">
<link href="css/style.css?v=4.1.0" rel="stylesheet">
<script>if(window.top !== window.self){ window.top.location = window.location;}</script>
<script src="js/jquery.min.js?v=2.1.4"></script>
<script src="js/plugins/validate/jquery.validate.min.js"></script>
<script src="js/plugins/validate/messages_zh.min.js"></script>
</head>

<body class="gray-bg">

  <div class="middle-box text-center loginscreen   animated fadeInDown">
    <div>
      <div>

        <h1 class="logo-name">CUIT</h1>

      </div>
      <h3>欢迎注册 研究生导师管理系统</h3>
      <p>创建一个新账户</p>
      <form class="m-t" role="form" id="form" action="RegisterServlet" method="post">
        <div class="form-group">
          <input type="text" class="form-control" name="username" placeholder="请输入用户名"
            value="44@qq.com">

        </div>
        <div class="form-group">
          <input type="text" class="form-control" name="name" placeholder="真实姓名" value="小东">
        </div>
        <div class="form-group">
          <input type="password" class="form-control" id="password" name="password"
            placeholder="请输入密码" value="123456">
        </div>
        <div class="form-group">
          <input type="password" class="form-control" name="aginPassword" placeholder="请再次输入密码"
            value="123456">
        </div>
        <div class="form-group text-left" id="agree">
          <div class="checkbox i-checks">
            <label class="no-padding"> </label><a href="#">我同意注册协议</a>
          </div>

        </div>
        <button type="submit" class="btn btn-primary block full-width m-b">注 册</button>

        <p class="text-muted text-center">
          <small>已经有账户了？</small><a href="login.jsp">点此登录</a>
        </p>

      </form>
    </div>
  </div>

  <!-- 全局js -->

  <script src="js/bootstrap.min.js?v=3.3.6"></script>
  <!-- iCheck -->
  <script src="js/plugins/iCheck/icheck.min.js"></script>
  <!-- validate数据检查 -->

  <script>
  var validate;
        $(document).ready(function () {
            $('.i-checks').iCheck({
                checkboxClass: 'icheckbox_square-green',
                radioClass: 'iradio_square-green',
            });
            validate=$("#form").validate({
        	rules:{
        	    username:{
        			required:true,
        			minlength:4,
        			 remote:{
        			    url:"CheckUserServlet",
        			    type:"post",
        			    dataType:"json",
        			    data:$("#username").val()
        			} 
        	    },
                name:"required",
    			password:{
    			    required:true,
    			    minlength:5
    			},
    			aginPassword:{
    			    required:true,
    			    minlength:5,
    			    equalTo:"#password"
    			}
            
        	},
        	messages:{
        	    username:{
        			remote:"用户名已存在"
        	    }
        	}
        	
        	
            });
        });
    </script>


</body>

</html>
