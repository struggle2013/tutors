<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<title>导师申请</title>
<meta name="keywords" content="">
<meta name="description" content="">

<link rel="shortcut icon" href="favicon.ico">
<link href="/tutors/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
<link href="/tutors/css/font-awesome.css?v=4.4.0" rel="stylesheet">
<!-- <link href="css/plugins/iCheck/custom.css" rel="stylesheet"> -->
<link href="/tutors/css/animate.css" rel="stylesheet">
<link href="/tutors/css/style.css?v=4.1.0" rel="stylesheet">
<link rel="stylesheet" href="/tutors/js/plugins/layui/css/layui.css">

</head>

<body class="gray-bg">

  <div class="middle-box  loginscreen  animated fadeInDown">
    <div>
      <div>
        <h2>申请导师</h2>
        <span>申请导师前，尽可能的提交更多的材料。申请导师需要一段时间，请耐心等候</span>
      </div>


      <form class="m-t" role="form" id="form" action="/tutors/ApplyServlet?action=apply"
        method="post">
        <div class="form-group">
          <span>类型</span> <label><input name="category" type="radio" value="学术型"
            checked="checked" />学术型 </label> <label><input name="category" type="radio"
            value="专业学位" />专业学位 </label>
        </div>
        <div class="form-group">
          <span>一级学科</span> <input type="text" class="form-control" id="oneSubject"
            name="oneSubject" placeholder="请输入一级学科" value="计算机科学与技术" required="required">
        </div>
        <div class="form-group">
          <span>二级学科</span> <input type="text" class="form-control" name="twoSubject"
            placeholder="请输入二级学科" value="计算机应用 " required="required">
        </div>
        <div class="form-group">
          <span>研究方向</span> <input type="text" class="form-control" name="direction"
            placeholder="请输入研究方向" value="图像图像处理" required="required">
        </div>
        <div class="form-group">
          <input type="file" name="file" class="layui-upload-file" lay-type="file" /> <input
            type="text" name="file" value="" hidden="hidden" id="filename">
        </div>
        <button type="submit" class="btn btn-primary block full-width " id="apply">申请</button>

      </form>
    </div>
  </div>

  <!-- 全局js -->
  <script src="/tutors/js/jquery.min.js?v=2.1.4"></script>
  <script src="/tutors/js/bootstrap.min.js?v=3.3.6"></script>
  <script src="/tutors/js/plugins/validate/jquery.validate.min.js"></script>
  <script src="/tutors/js/plugins/validate/messages_zh.min.js"></script>
  <script src="/tutors/js/plugins/layui/layui.js"></script>
  <script>
	    var path;
	    layui.use('upload', function() {
		layui.upload({
		    url : '/tutors/UploadServlet',
		    success : function(src) {
			console.log(src.filename);
			$("#filename").val(src.filename);
			path = "/upload/" + src.filename;
			console.log("文件路径" + path);
			// $("#").attr('src', path);
		    }
		});
	    });
	</script>


</body>

</html>
