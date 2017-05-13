<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="favicon.ico">
<link href="/tutors/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
<link href="/tutors/css/font-awesome.css?v=4.4.0" rel="stylesheet">
<!-- <link href="css/plugins/iCheck/custom.css" rel="stylesheet"> -->
<link href="/tutors/css/animate.css" rel="stylesheet">
<link href="/tutors/css/style.css?v=4.1.0" rel="stylesheet">


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<title>用户查询</title>
</head>
<body>
  <div class="ibox">
    <div class="ibox-title">
      <h5>所有用户</h5>

    </div>
    <div class="ibox-content">
      <div class="row m-b-sm m-t-sm">
        <div class="col-md-1">
          <button type="button" id="loading-example-btn" class="btn btn-white btn-sm">
            <i class="fa fa-refresh"></i>刷新
          </button>
        </div>
        <div class="col-md-11">
          <form action="/tutors/UserInfoQuery?action=some" method="post">
            <div class="input-group">
              <input type="text" placeholder="请输入姓名" class="input-sm form-control" name="name">
              <span class="input-group-btn">
                <button type="submit" class="btn btn-sm btn-primary" id="btnSearch">搜索</button>
              </span>
            </div>
          </form>
        </div>
      </div>

      <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
          <c:forEach var="user" items="${requestScope.users}">
            <div class="col-sm-4" style="height: 200px">
              <a href="${pageContext.request.contextPath}/baseinfo/info.jsp">
                <div class="contact-box">
                  <div class="col-sm-4">
                    <div class="text-center">
                      <img alt="image" class="img-circle m-t-xs img-responsive"
                        src="${pageContext.request.contextPath}/img/${user.pic}">
                    </div>
                  </div>
                  <div class="col-sm-8">
                    <h3>
                      <strong>${user.name }</strong>
                    </h3>
                    <p>
                      <i class="fa fa-map-marker"></i> ${user.address }
                    </p>

                    <address>
                      E-mail:${user.email }<br> <abbr title="Phone">Tel:</abbr>
                      ${user.telephone }
                    </address>
                  </div>
                  <div class="clearfix"></div>
                </div>

              </a>
            </div>
          </c:forEach>

        </div>
      </div>
    </div>
  </div>
  <!-- 全局js -->
  <script src="/tutors/js/jquery.min.js?v=2.1.4"></script>
  <script src="/tutors/js/bootstrap.min.js?v=3.3.6"></script>
  <script src="/tutors/js/content.js"></script>
  <script>
	    $(document).ready(function() {
		$('.contact-box').each(function() {
		    animationHover(this, 'pulse');
		});
		
		$("#loading-example-btn").click(function(){
		    location.reload();
		});
	    });
	</script>
</body>
</html>