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

  <div class="middle-box  loginscreen  animated fadeInDown">
    <div>
      <div>
        <h2>申请导师</h2>
        <span>申请导师前，尽可能的提交更多的材料。申请导师需要一段时间，请耐心等候</span>
      </div>


      <form class="m-t" role="form" id="form" action="/tutors/ApplyServlet?action=apply"
        enctype="multipart/form-data" method="post">
        <div class="form-group">
          <span>类型</span> <label><input name="category" type="radio" value="学术型" />学术型 </label> <label><input
            name="category" type="radio" value="专业学位" />专业学位 </label>
        </div>
        <div class="form-group">
          <span>一级学科</span> <input type="text" class="form-control" id="oneSubject"
            name="oneSubject" placeholder="请输入一级学科" value="计算机科学与技术">
        </div>
        <div class="form-group">
          <span>二级学科</span> <input type="text" class="form-control" name="twoSubject"
            placeholder="请输入二级学科" value="计算机应用 ">
        </div>
        <div class="form-group">
          <span>研究方向</span> <input type="text" class="form-control" name="research"
            placeholder="请输入研究方向" value="图像图像处理">
        </div>
        <div class="form-group">
          <input type="file" name="file" />
        </div>
        <button type="submit" class="btn btn-primary block full-width " id="apply">申请</button>



      </form>
    </div>
  </div>

  <!-- 全局js -->

  <script src="/tutors/js/bootstrap.min.js?v=3.3.6"></script>
  <!-- iCheck -->
  <!--   <script src="/tutors/js/plugins/iCheck/icheck.min.js"></script> -->
  <!-- validate数据检查 -->
  <script src="/tutors/js/plugins/layer/layer.min.js"></script>
  <script>
	    var validate;
	    $(document).ready(function() {

		validate = $("#form").validate({
		    rules : {
			category : "required",
			oneSubject : "required",
			twoSubject : "required",
			research : "required"
		    }

		});
		$("#apply").click(function() {
		    layer.msg('提交成功')
		});
	    });
	</script>


</body>

</html>
