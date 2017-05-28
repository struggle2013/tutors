<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<title>修改密码</title>
<meta name="keywords" content="">
<meta name="description" content="">

<link rel="shortcut icon" href="favicon.ico">
<link href="/tutors/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
<link href="/tutors/css/font-awesome.css?v=4.4.0" rel="stylesheet">
<!-- <link href="css/plugins/iCheck/custom.css" rel="stylesheet"> -->
<link href="/tutors/css/animate.css" rel="stylesheet">
<link href="/tutors/css/style.css?v=4.1.0" rel="stylesheet">
<script></script>
<script src="/tutors/js/jquery.min.js?v=2.1.4"></script>
<script src="/tutors/js/plugins/validate/jquery.validate.min.js"></script>
<script src="/tutors/js/plugins/validate/messages_zh.min.js"></script>
</head>

<body class="gray-bg">

  <div class="middle-box text-center loginscreen   animated fadeInDown">
    <div>
      <div>

        <h1 class="logo-name">CUIT</h1>

      </div>


      <form class="m-t" role="form" id="form" action="/tutors/UpdateUser?action=updatePassword"
        method="post">
        <div class="form-group">
          <input type="text" class="form-control" name="oldPassword" placeholder="请输入旧密码">
        </div>
        <div class="form-group">
          <input type="password" class="form-control" id="password" name="password"
            placeholder="请输入新密码">
        </div>
        <div class="form-group">
          <input type="password" class="form-control" name="aginPassword" placeholder="请再次输入密码">
        </div>
        <button type="submit" class="btn btn-primary block full-width m-b">确定</button>



      </form>
    </div>
  </div>

  <!-- 全局js -->

  <script src="/tutors/js/bootstrap.min.js?v=3.3.6"></script>
  <!-- iCheck -->
  <!--   <script src="/tutors/js/plugins/iCheck/icheck.min.js"></script> -->
  <!-- validate数据检查 -->

  <script>
	    var validate;
	    $(document).ready(function() {

		validate = $("#form").validate({
		    rules : {

			oldPassword : "required",
			password : {
			    required : true,
			    minlength : 5
			},
			aginPassword : {
			    required : true,
			    minlength : 5,
			    equalTo : "#password"
			}

		    },
		    messages : {
			username : {
			    remote : "用户名已存在"
			}
		    }

		});
	    });
	</script>


</body>

</html>
