<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  import="java.util.*,service.NoticeService,util.*,entity.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>研究生导师管理</title>
<link rel="stylesheet" type="text/css" href="/tutors/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/tutors/css/user.css">
<link href="/tutors/css/font-awesome.css?v=4.4.0" rel="stylesheet">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="/tutors/css/animate.css" rel="stylesheet">
<link rel="stylesheet" href="css/pagination.css">
<link href="/tutors/css/style.css?v=4.1.0" rel="stylesheet">
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

  <div class="wrapper wrapper-content animated fadeInRight ">
    <div class="row">
      <div class="col-lg-12">
        <c:forEach var="notice" items="${page.dataList }">
        <div class="ibox">
          <div class="ibox-content">
            <a href="/tutors/NoticeServlet?action=queryById&id=${notice.id }" class="btn-link">
              <h2>${notice.name }</h2>
            </a>
            <div class="small m-b-xs">
              <span class="text-muted"><i class="fa fa-clock-o"></i>${notice.time }</span>
            </div>
            <p>
            ${notice.info }
            </p>
          </div>
        </div>
        </c:forEach>
        <div id="News-Pagination"></div>
        <form action="" id="stuForm" method="post"></form>
      </div>
    </div>
  </div>
  <script src="/tutors/js/jquery.min.js?v=2.1.4"></script>
  <script src="/tutors/js/bootstrap.min.js?v=3.3.6"></script>
  <script src="/tutors/js/content.js"></script>
  <script src="/tutors/js/jquery.pagination.js"></script>
  <script type="text/javascript">
//点击分页按钮以后触发的动作
function handlePaginationClick(new_page_index, pagination_container) {
    $("#stuForm").attr("action", "/tutors/NoticeServlet?action=queryAll&pageNum=" + (new_page_index+1));
    $("#stuForm").submit();
    return false;
}
$(function(){
	$("#News-Pagination").pagination(${page.totalRecord}, {
    items_per_page:${page.pageSize}, // 每页显示多少条记录
    current_page:${page.currentPage} - 1, // 当前显示第几页数据
    num_display_entries:5, // 分页显示的条目数
    next_text:"下一页",
    prev_text:"上一页",
    num_edge_entries:2, // 连接分页主体，显示的条目数
    callback:handlePaginationClick
	});	
	
});
</script>
</body>
</html>