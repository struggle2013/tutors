<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="shortcut icon" href="favicon.ico">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/font-awesome.css" rel="stylesheet">

<link href="css/animate.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
  <div class="wrapper wrapper-content">
    <div class="col-sm-5">
      <div class="ibox float-e-margins">
        <div class="ibox-title">
          <h5>导师审查进度</h5>
          <div class="ibox-tools"></div>
        </div>
        <div class="" id="ibox-content">

          <div id="vertical-timeline" class="vertical-container light-timeline">
            <div class="vertical-timeline-block">
              <div class="vertical-timeline-icon navy-bg">
                <i class="fa fa-check"></i>
              </div>

              <div class="vertical-timeline-content">
                <h2>科技处审查</h2>
                <p>情况属实</p>
                <span class="badge badge-success" style="float: right">审核通过</span> <span
                  class="vertical-date"> <small>2月3日</small>
                </span>
              </div>
            </div>

            <div class="vertical-timeline-block">
              <div class="vertical-timeline-icon navy-bg">
                <i class="fa fa-check"></i>
              </div>

              <div class="vertical-timeline-content">
                <h2>学院初审</h2>
                <p>情况属实</p>
                <span class="badge badge-success" style="float: right">审核通过</span> <span
                  class="vertical-date"> <small>2月3日</small>
                </span>
              </div>
            </div>

            <div class="vertical-timeline-block">
              <div class="vertical-timeline-icon navy-bg">
                <i class="fa"></i>
              </div>

              <div class="vertical-timeline-content">
                <h2>学位委员会评审</h2>
                <p></p>
                <span class="badge badge-success" style="float: right"></span> <span
                  class="vertical-date"> <small></small>
                </span>
              </div>
            </div>

            <div class="vertical-timeline-block">
              <div class="vertical-timeline-icon navy-bg">
                <i class="fa"></i>
              </div>

              <div class="vertical-timeline-content">
                <h2>校学位委员会评审</h2>
                <p></p>
                <span class="badge badge-success" style="float: right"></span> <span
                  class="vertical-date"> <small></small>
                </span>
              </div>
            </div>

          </div>
        </div>
      </div>
    </div>
    <div class="col-sm-7">
      <div class="ibox float-e-margins">
        <div class="ibox-title">
          <h5>站内公告</h5>
          <div class="ibox-tools"></div>
        </div>
        <div class="ibox-content">
          <div class="row m-b-sm m-t-sm">
            <div class="col-md-1">
              <button type="button" id="loading-example-btn" class="btn btn-white btn-sm">
                <i class="fa fa-refresh"></i> 刷新
              </button>
            </div>
            <div class="col-md-11">
              <div class="input-group">
                <input type="text" placeholder="请输入要查找的内容" class="input-sm form-control"> <span
                  class="input-group-btn">
                  <button type="button" class="btn btn-sm btn-primary">搜索</button>
                </span>
              </div>
            </div>
          </div>
          <div class="project-list">
            <table class="table table-hover">
              <tbody>
                <tr>
                  <td class="project-title">
                    <a href="project_detail.html">LIKE－一款能够让用户快速获得认同感的兴趣社交应用</a> <br> <small>创建于
                      2014.08.15</small>
                  </td>
                </tr>
                <tr>

                  <td class="project-title">
                    <a href="project_detail.html">米莫说｜MiMO Show</a> <br> <small>创建于
                      2014.08.15</small>
                  </td>

                </tr>
                <tr>

                  <td class="project-title">
                    <a href="project_detail.html">商家与购物用户的交互试衣应用</a> <br> <small>创建于
                      2014.08.15</small>
                  </td>
                </tr>
                <tr>

                  <td class="project-title">
                    <a href="project_detail.html">天狼---智能硬件项目</a> <br> <small>创建于
                      2014.08.15</small>
                  </td>

                </tr>
                <tr>

                  <td class="project-title">
                    <a href="project_detail.html">乐活未来</a> <br> <small>创建于 2014.08.15</small>
                  </td>

                </tr>
                <tr>

                  <td class="project-title">
                    <a href="project_detail.html">【私人医生项目】</a> <br> <small>创建于
                      2014.08.15</small>
                  </td>

                </tr>
                <tr>

                  <td class="project-title">
                    <a href="project_detail.html">快狗家居</a> <br> <small>创建于 2014.08.15</small>
                  </td>

                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </div>
</body>
</html>