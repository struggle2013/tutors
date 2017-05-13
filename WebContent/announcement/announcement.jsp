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

<link href="/tutors/css/animate.css" rel="stylesheet">
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
<body>

  <%
  	NoticeService ns = new NoticeService();
  	List<Notice> notices = ns.getNotices();
  	pageContext.setAttribute("notices", notices);
  %>

  <div class="wrapper wrapper-content animated fadeInRight ">
    <div class="row">
      <div class="col-lg-12">

        <div class="ibox">
          <div class="ibox-content">
            <a href="information.jsp" class="btn-link">
              <h2>自行车都智能化了，你可知道它的历史？</h2>
            </a>
            <div class="small m-b-xs">
              <strong>郝 影</strong>
              <span class="text-muted"><i class="fa fa-clock-o"></i> 9 小时前</span>
            </div>
            <p>
              在不少旁观者的眼里，智能化几乎成了一种避之唯恐不及的“瘟疫”，开始攀附上大大小小、各式各样的工具和设备，从水杯、灯泡、体重秤这样的小物件，再到冰箱、洗衣机这些生活中的庞然大物。
            </p>

          </div>
        </div>
        <div class="ibox">
          <div class="content-ibox">
            <a href="information.jsp" class="btn-link">
              <h2>想知道宁泽涛每天游多少圈？送他 Misfit 最新款 Speedo Shine</h2>
            </a>
            <div class="small m-b-xs">
              <strong>高 晨</strong>
              <span class="text-muted"><i class="fa fa-clock-o"></i> 3 小时前</span>
            </div>
            <p>就算你敢带着 Apple Watch 下水游泳，它也不能记录你游了多少圈。 夏天刚来时就不停地听到有人提起“有没有在我游泳的时候可以帮忙数圈的设备”，今天
              Misfit 终于赶在夏天结束之前推出可追踪游泳运动的新款 Shine。这款新设备是 Misfit 与泳衣品牌 Speedo （速比涛）合作推出，因此被命名为 Speedo
              Shine。</p>

          </div>
        </div>
        <div class="ibox">
          <div class="ibox-content">
            <a href="information.jsp" class="btn-link">
              <h2>半数用户弃用 Apple Music？苹果发话了</h2>
            </a>
            <div class="small m-b-xs">
              <strong>周 欣</strong>
              <span class="text-muted"><i class="fa fa-clock-o"></i> 3 小时前</span>
            </div>
            <p>前不久，苹果公司高级副总裁 Eddy Cue 还在宣称 Apple Music 试用期用户超 1100 万，最近就有一份来自 MusicWatch
              的调查报告，让人大跌眼镜。</p>
            <p>MusicWatch 针对美国 5000 名 13 岁以上人群进行抽样调查，得出数据：约有 77% 的 iOS 用户知道 Apple Music，只有 11%
              的用户正在使用它；而在已经注册 Apple Music 三个月免费试用服务的用户中，48% 表示已经弃用，61% 称已关闭 iTunes 中的自动订阅功能。</p>

          </div>
        </div>


      </div>
    </div>
  </div>


</body>
</html>