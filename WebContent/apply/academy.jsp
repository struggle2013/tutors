<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="/tutors/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
<link href="/tutors/css/font-awesome.css?v=4.4.0" rel="stylesheet">

<link href="/tutors/css/animate.css" rel="stylesheet">
<link href="/tutors/css/style.css?v=4.1.0" rel="stylesheet">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="/tutors/js/jquery.min.js?v=2.1.4"></script>
</head>
<body>
  <div class="wrapper wrapper-content animated fadeInUp">
    <div class="col-sm-12">
      <div class="ibox">
        <div class="ibox-title">
          <h3>所有未审批的教师</h3>
        </div>
        <div class="ibox-content">
          <div class="row m-b-sm m-t-sm">
            <div class="col-md-1">
              <button type="button" onclick="refresh()" class="btn btn-white btn-sm">
                <i class="fa fa-refresh"></i> 刷新
              </button>
            </div>
            <div class="col-md-11">
              <div class="input-group">
                <input type="text" placeholder="请输入姓名" class="input-sm form-control"> <span
                  class="input-group-btn">
                  <button type="button" class="btn btn-sm btn-primary">搜索</button>
                </span>
              </div>
            </div>
          </div>

          <div class="project-list">

            <table class="table table-hover">
              <thead>
                <tr>
                  <th>姓名</th>
                  <th>申请类别</th>
                  <th>一级学科</th>
                  <th>二级学科</th>
                  <th>研究方向</th>
                  <th>操作</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach var="apply" items="${applys}">
                  <tr>
                    <td class="project-title">
                      <span class="text-info">${apply.username }</span>
                    </td>
                    <td class="project-title">${apply.category }</td>
                    <td class="project-title">${apply.oneSubject }</td>
                    <td class="project-title">${apply.twoSubject }</td>
                    <td class="project-title">${apply.direction }</td>
                    <td class="project-title">
                      <a href="ApplyServlet?action=query&userId=${apply.userId }"
                        class="btn btn-white btn-sm"><i class="fa fa-folder"></i> 查看资料 </a>

                      <button class="btn btn-success" data-toggle="modal" data-target="#myModal"
                        onclick="pass(${apply.userId})">通过</button>
                      <button class="btn btn-danger" data-toggle="modal" data-target="#myModal"
                        onclick="notPass(${apply.userId})">不通过</button>
                      <a class="btn btn-info" href="UploadServlet?fileName='${apply.file }'">下载文档</a>
                      <%--    
                        href="ApplyServlet?action=notPass?userId=${apply.userId }"
                        class="btn btn-danger"><i></i> 不通过 </a> --%>
                    </td>
                  </tr>
                </c:forEach>


              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </div>

  <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
          <h4 class="modal-title" id="modalI2Label">意见</h4>
        </div>
        <div class="modal-body">
          <form class="form-horizontal" id="dialogII"
            action="/tutors/TechnologyCheck?action=saveOpinion" method="post">
            <div class="form-group">
              <label for="wzmc" class="col-sm-2 control-label">审批人</label>
              <div class="col-sm-10">
                <input type="text" class="form-control input-sm" name="chargePerson"
                  placeholder="审批人" style="width: 30em;">
              </div>
            </div>
            <div class="form-group">
              <label for="kwhymc" class="col-sm-2 control-label">意见</label>
              <div class="col-sm-10">
                <textarea class="form-control " name="suggestion" style="width: 30em;"></textarea>
              </div>
            </div>

            <div class="modal-footer">
              <input type="text" name="kind" value="technology" hidden="hidden"> <input
                type="text" name="userId" value="" hidden="hidden" id="userId"> <input
                type="text" name="agree" value="" hidden="hidden" id="agree">
              <button type="button" class="btn btn-default btn-cancel" data-dismiss="modal">取消</button>
              <button type="submit" class="btn btn-primary">保存</button>
            </div>
          </form>
        </div>

      </div>
    </div>
  </div>
  <script src="/tutors/js/jquery.min.js?v=2.1.4"></script>
  <script src="/tutors/js/bootstrap.min.js"></script>
  <!--  <script type="text/javascript">
	    function refresh() {
		window.location.reload();
	    }
	    function pass(value){
			$("#userId").val(value);
			$("#agree").val(1);
	    }
	    function notPass(value){
		$("#userId").val(value);
		$("#agree").val(0);
	    }
	</script> -->
</body>
</html>