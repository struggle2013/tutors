<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  import="java.util.*,service.NoticeService,util.*,entity.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>研究生导师管理</title>
<link rel="stylesheet" type="text/css" href="/tutors/css/user.css">
<link rel="stylesheet" type="text/css" href="/tutors/css/bootstrap.min.css">
<link href="css/font-awesome.css" rel="stylesheet">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="css/animate.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<style type="text/css">
* {
	margin: 0px;
	padding: 0px;
}

#main-content {
	display: block;
	padding-top: 72px;
}

a {
	color: #337ab7;
}
</style>
</head>
<body class="gray-bg">


  <div class="wrapper wrapper-content  animated fadeInRight article">
    <div class="row">
      <div class="col-lg-10 col-lg-offset-1">
        <div class="ibox">
          <div class="ibox-content">
            <div class="pull-right">
              <span class="label">发布时间:${notice.time }</span>
            </div>
            <div class="text-center article-title">
              <h1>${notice.name }</h1>
            </div>
            <div>${notice.content}</div>
          </div>


        </div>
      </div>
    </div>
  </div>


</body>
</html>