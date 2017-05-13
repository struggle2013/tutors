<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  import="java.util.*,service.NoticeService,util.*,entity.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>研究生导师管理</title>
<link rel="stylesheet" type="text/css" href="/tutors/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/tutors/css/user.css">
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
  <h3>${notice.noticeName }</h3>
  <h5>
    <i class="fa fa-calendar"></i> ${notice.noticeTime}
  </h5>
  <p class="blog-content"></p>

  <p>${notice.content}</p>

  <%
  	NoticeService ns = new NoticeService();
  	String id = request.getParameter("id");
  	Notice notice = ns.getNotice(id);
  	pageContext.setAttribute("notice", notice);
  %>
  <div class="wrapper wrapper-content  animated fadeInRight article">
    <div class="row">
      <div class="col-lg-10 col-lg-offset-1">
        <div class="ibox">
          <div class="ibox-content">
            <div class="pull-right">

              <button class="btn btn-white btn-xs" type="button">乐视超级自行车</button>
            </div>
            <div class="text-center article-title">
              <h1>自行车都智能化了，你可知道它的历史？</h1>
            </div>
            <p>
              在不少旁观者的眼里，智能化几乎成了一种避之唯恐不及的“瘟疫”，开始攀附上大大小小、各式各样的工具和设备，从水杯、灯泡、体重秤这样的小物件，再到冰箱、洗衣机这些生活中的庞然大物。
            </p>
            <p>
              兜兜转转之后，这场“瘟疫”又找上了在生活中不那么起眼的自行车。然而，在搭上智能化的顺风车之前，你可知道自行车的历史？虽然，在乐视超级自行车的发布会上，它已经用了自行车史上有着重要地位的三个名字——斯塔利、西夫拉克、阿尔普迪埃——来命名自家的自行车，但那远远不够。Gizmodo
              为我们梳理了自行车发展的关键节点。</p>
            <p>在开始之前，我们先来看看丹麦的设计师制作的动画，一分钟看完自行车近 200 年的演变。</p>
            <p>比较公认的说法是，第一辆自行车由法国手工艺人西夫拉克（Médé de
              Sivrac）设计，在两个轮子上安装了支架并配上马鞍，前进的话需要用脚蹬地提供动力。这还只是一个很简单的雏形，没有方向舵，转弯的时候需要骑行者下车抬起前轮，稳定性也不好。
            </p>
            <p>德国人杜莱斯（Karl Drais von Sauerbronn）制作了一辆和西夫拉克的设计相近的两轮车子，增加了车把，可以改变行进中的方向，速度可以达到
              15km/h。不过，还是需要靠双脚蹬地提供动力。</p>
            <p>这时候第一辆真正意义上的自行车诞生了，是由苏格兰铁匠麦克米伦（Kirkpatrik Macmillan）设计的，它还有一个专门的名字——Velocipede。</p>
            <p>
              在不少旁观者的眼里，智能化几乎成了一种避之唯恐不及的“瘟疫”，开始攀附上大大小小、各式各样的工具和设备，从水杯、灯泡、体重秤这样的小物件，再到冰箱、洗衣机这些生活中的庞然大物。
            </p>
            <p>
              兜兜转转之后，这场“瘟疫”又找上了在生活中不那么起眼的自行车。然而，在搭上智能化的顺风车之前，你可知道自行车的历史？虽然，在乐视超级自行车的发布会上，它已经用了自行车史上有着重要地位的三个名字——斯塔利、西夫拉克、阿尔普迪埃——来命名自家的自行车，但那远远不够。Gizmodo
              为我们梳理了自行车发展的关键节点。</p>
            <p>在开始之前，我们先来看看丹麦的设计师制作的动画，一分钟看完自行车近 200 年的演变。</p>
            <p>比较公认的说法是，第一辆自行车由法国手工艺人西夫拉克（Médé de
              Sivrac）设计，在两个轮子上安装了支架并配上马鞍，前进的话需要用脚蹬地提供动力。这还只是一个很简单的雏形，没有方向舵，转弯的时候需要骑行者下车抬起前轮，稳定性也不好。
            </p>
            <p>德国人杜莱斯（Karl Drais von Sauerbronn）制作了一辆和西夫拉克的设计相近的两轮车子，增加了车把，可以改变行进中的方向，速度可以达到
              15km/h。不过，还是需要靠双脚蹬地提供动力。</p>
            <p>这时候第一辆真正意义上的自行车诞生了，是由苏格兰铁匠麦克米伦（Kirkpatrik Macmillan）设计的，它还有一个专门的名字——Velocipede。</p>
            <p>
              在不少旁观者的眼里，智能化几乎成了一种避之唯恐不及的“瘟疫”，开始攀附上大大小小、各式各样的工具和设备，从水杯、灯泡、体重秤这样的小物件，再到冰箱、洗衣机这些生活中的庞然大物。
            </p>
            <p>
              兜兜转转之后，这场“瘟疫”又找上了在生活中不那么起眼的自行车。然而，在搭上智能化的顺风车之前，你可知道自行车的历史？虽然，在乐视超级自行车的发布会上，它已经用了自行车史上有着重要地位的三个名字——斯塔利、西夫拉克、阿尔普迪埃——来命名自家的自行车，但那远远不够。Gizmodo
              为我们梳理了自行车发展的关键节点。</p>
            <p>在开始之前，我们先来看看丹麦的设计师制作的动画，一分钟看完自行车近 200 年的演变。</p>
            <p>比较公认的说法是，第一辆自行车由法国手工艺人西夫拉克（Médé de
              Sivrac）设计，在两个轮子上安装了支架并配上马鞍，前进的话需要用脚蹬地提供动力。这还只是一个很简单的雏形，没有方向舵，转弯的时候需要骑行者下车抬起前轮，稳定性也不好。
            </p>
            <p>德国人杜莱斯（Karl Drais von Sauerbronn）制作了一辆和西夫拉克的设计相近的两轮车子，增加了车把，可以改变行进中的方向，速度可以达到
              15km/h。不过，还是需要靠双脚蹬地提供动力。</p>
            <p>这时候第一辆真正意义上的自行车诞生了，是由苏格兰铁匠麦克米伦（Kirkpatrik Macmillan）设计的，它还有一个专门的名字——Velocipede。</p>
            <p>
              在不少旁观者的眼里，智能化几乎成了一种避之唯恐不及的“瘟疫”，开始攀附上大大小小、各式各样的工具和设备，从水杯、灯泡、体重秤这样的小物件，再到冰箱、洗衣机这些生活中的庞然大物。
            </p>
            <p>
              兜兜转转之后，这场“瘟疫”又找上了在生活中不那么起眼的自行车。然而，在搭上智能化的顺风车之前，你可知道自行车的历史？虽然，在乐视超级自行车的发布会上，它已经用了自行车史上有着重要地位的三个名字——斯塔利、西夫拉克、阿尔普迪埃——来命名自家的自行车，但那远远不够。Gizmodo
              为我们梳理了自行车发展的关键节点。</p>
            <p>在开始之前，我们先来看看丹麦的设计师制作的动画，一分钟看完自行车近 200 年的演变。</p>
            <p>比较公认的说法是，第一辆自行车由法国手工艺人西夫拉克（Médé de
              Sivrac）设计，在两个轮子上安装了支架并配上马鞍，前进的话需要用脚蹬地提供动力。这还只是一个很简单的雏形，没有方向舵，转弯的时候需要骑行者下车抬起前轮，稳定性也不好。
            </p>
            <p>德国人杜莱斯（Karl Drais von Sauerbronn）制作了一辆和西夫拉克的设计相近的两轮车子，增加了车把，可以改变行进中的方向，速度可以达到
              15km/h。不过，还是需要靠双脚蹬地提供动力。</p>
            <p>这时候第一辆真正意义上的自行车诞生了，是由苏格兰铁匠麦克米伦（Kirkpatrik Macmillan）设计的，它还有一个专门的名字——Velocipede。</p>
            <hr>


          </div>


        </div>
      </div>
    </div>
  </div>

  </div>


</body>
</html>