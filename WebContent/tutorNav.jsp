<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="renderer" content="webkit">

<title>研究生导师管理</title>

<meta name="keywords" content="">
<meta name="description" content="">



<link rel="shortcut icon" href="favicon.ico">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/font-awesome.min.css?v=4.7.0" rel="stylesheet">
<link href="css/animate.css" rel="stylesheet">
<link href="css/style.css?v=4.1.0" rel="stylesheet">
</head>

<body class="fixed-sidebar full-height-layout gray-bg" style="overflow: hidden">
  <div id="wrapper">
    <!--左侧导航开始-->
    <nav class="navbar-default navbar-static-side" role="navigation">
      <div class="nav-close">
        <i class="fa fa-times-circle"></i>
      </div>
      <div class="sidebar-collapse">
        <ul class="nav" id="side-menu">

          <li class="nav-header">
            <div class="dropdown profile-element">
              <a data-toggle="dropdown" class="dropdown-toggle" href="index_v1.jsp"> <span
                class="clear"> <span class="block m-t-xs" style="font-size: 15px;"> <i
                    class="fa fa-user"></i> <strong class="font-bold">CUIT研究生导师管理</strong>
                </span>
              </span>
              </a>
            </div>
            <div class="logo-element">CUIT</div>
          </li>

          <li class="hidden-folded padder m-t m-b-sm text-muted text-xs"><span class="ng-scope">信息</span>
          </li>
          <li><a class="J_menuIte" href="IndexServlet?param=user"> <i class="fa fa-home"></i> <span
              class="nav-label">主页</span>
          </a></li>
          <li><a href="baseinfo/info.jsp" class="J_menuItem"> <i class="fa fa-address-card"></i>
              <span class="nav-label">基本信息管理</span> <span class="fa arrow"></span>
          </a>
            <ul class="nav nav-second-level">
              <li><a class="J_menuItem" href="baseinfo/info.jsp">个人信息查看</a></li>
              <li><a class="J_menuItem" href="baseinfo/edit.jsp">个人信息修改</a></li>
              <li><a class="J_menuItem" href="baseinfo/passwordChange.jsp">登录密码修改</a></li>
              <li><a class="J_menuItem" href="UserInfoQuery?action=all">用户查询</a></li>
            </ul></li>

          <li class="line dk"></li>
          <li class="hidden-folded padder m-t m-b-sm text-muted text-xs"><span class="ng-scope">遴选</span>
          </li>
          <li><a href="index_v1.jsp"><i class="fa fa-file"></i> <span class="nav-label">材料管理
            </span><span class="fa arrow"></span></a>
            <ul class="nav nav-second-level">
              <li><a class="J_menuItem" href="DataServlet?action=paper">学术论文</a></li>
              <li><a class="J_menuItem" href="DataServlet?action=book">学术著作</a></li>
              <li><a class="J_menuItem" href="DataServlet?action=fruit">科研成果</a></li>
              <li><a class="J_menuItem" href="DataServlet?action=project">科研项目</a></li>
              <li><a class="J_menuItem" href="DataServlet?action=teach">讲授研究生情况</a></li>
            </ul></li>
          <li><a href="index_v1.jsp"><i class="fa fa-check-circle-o"></i> <span
              class="nav-label">导师遴选</span><span class="fa arrow"></span></a>
            <ul class="nav nav-second-level">
              <li><a class="J_menuItem" href="CheckServlet?param=technology">科技处审查</a></li>
              <li><a class="J_menuItem" href="CheckServlet?param=academy">学院初审</a></li>
              <li><a class="J_menuItem" href="CheckServlet?param=degree">学位分评定委员会审核</a></li>
              <li><a class="J_menuItem" href="CheckServlet?param=schoolDegree">校学位评定委员会审核</a></li>
            </ul></li>

          <li class="line dk"></li>
          <li class="hidden-folded padder m-t m-b-sm text-muted text-xs"><span class="ng-scope">考核</span>
          </li>
          <li><a href="index_v1.jsp"><i class="fa fa-check"></i> <span class="nav-label">考核评优</span><span
              class="fa arrow"></span></a>
            <ul class="nav nav-second-level">
              <li><a class="J_menuItem" href="AssessmentServlet?action=lookupScore">查看考核成绩</a></li>
              <li><a class="J_menuItem" href="AssessmentServlet?action=assessmentScore">考核</a></li>
              <li><a class="J_menuItem" href="AssessmentServlet?action=lookupGood">查看评优</a></li>
              <li><a class="J_menuItem" href="AssessmentServlet?action=assessmentGood">评优</a></li>
            </ul></li>
          <li class="line dk"></li>
          <li class="hidden-folded padder m-t m-b-sm text-muted text-xs"><span class="ng-scope">公告</span>
          </li>
          <li><a href="index_v1.jsp"><i class="fa fa-info-circle"></i> <span
              class="nav-label">公告</span><span class="fa arrow"></span></a>
            <ul class="nav nav-second-level">
              <li><a class="J_menuItem" href="NoticeServlet?action=queryAll">查看公告</a></li>
              <li><a class="J_menuItem" href="NoticeServlet?action=add">发布公告</a></li>
              <li><a class="J_menuItem" href="NoticeServlet?action=update">修改公告</a></li>
            </ul></li>
          <li class="line dk"></li>
          <li class="hidden-folded padder m-t m-b-sm text-muted text-xs"><span class="ng-scope">系统管理</span>
          </li>
          <li><a href="index_v1.jsp"><i class="fa fa-wrench"></i> <span class="nav-label">系统管理</span><span
              class="fa arrow"></span></a>
            <ul class="nav nav-second-level">
              <li><a class="J_menuItem" href="SysAdminServlet?action=powerAdmin&param=all">权限分配</a></li>
              <li><a class="J_menuItem" href="SysAdminServlet?action=adminPassword">管理员密码修改</a></li>
            </ul></li>
        </ul>
      </div>
    </nav>
    <!--左侧导航结束-->
    <!--右侧部分开始-->
    <div id="page-wrapper" class="gray-bg dashbard-1">

      <div class="row border-bottom">
        <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
          <div class="login" style="float: right; line-height: 52px; margin-right: 30px;">
            <span><a href="javascript:void(0)">欢迎您，${sessionScope.name}</a></span> <span> | </span>
            <span><a href="LogoutServlet">退出</a></span>
          </div>
        </nav>
      </div>

      <div class="row J_mainContent" id="content-main">
        <iframe id="J_iframe" width="100%" height="100%" src="index_v1.jsp" frameborder="0"
          data-id="index_v1.jsp" seamless></iframe>
      </div>
    </div>
    <!--右侧部分结束-->

  </div>

  <!-- 全局js -->
  <script src="js/jquery.min.js?v=2.1.4"></script>
  <script src="js/bootstrap.min.js?v=3.3.6"></script>
  <script src="js/plugins/metisMenu/jquery.metisMenu.js"></script>
  <script src="js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
  <script src="js/plugins/layer/layer.min.js"></script>

  <!-- 自定义js -->
  <script src="js/hAdmin.js?v=4.1.0"></script>
  <script type="text/javascript" src="js/index.js"></script>

  <!-- 第三方插件 -->
  <script src="js/plugins/pace/pace.min.js"></script>

</body>

</html>
