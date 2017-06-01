<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="shortcut icon" href="favicon.ico">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/font-awesome.css" rel="stylesheet">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="css/animate.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
  <div class="wrapper wrapper-content">

    <div class="col-sm-5" ${ok}>
      <div class="ibox float-e-margins">
        <div class="ibox-title">
          <h5>导师审查进度</h5>
          <div class="ibox-tools"></div>
        </div>
        <div class="" id="ibox-content">
          <div id="vertical-timeline" class="vertical-container light-timeline">
            <div class="vertical-timeline-block">
              <c:choose>
                <c:when test="${schedule.technology==1}">
                  <div class="vertical-timeline-icon navy-bg">
                    <i class="fa fa-check"></i>
                  </div>
                  <div class="vertical-timeline-content">
                    <h2>科技处审查</h2>
                    <p>意见:${schedule.tsuggestion }</p>
                    <span class="badge badge-success" style="float: right">审核通过</span> <span
                      class="vertical-date"> </span>
                  </div>
                </c:when>
                <c:when test="${schedule.technology==0 }">
                  <div class="vertical-timeline-icon navy-bg">
                    <i class="fa"></i>
                  </div>
                  <div class="vertical-timeline-content">
                    <h2>科技处审查</h2>
                    <p></p>
                    <span class="badge badge-success" style="float: right"></span> <span
                      class="vertical-date"> </span>
                  </div>
                </c:when>
                <c:otherwise>
                  <div class="vertical-timeline-icon navy-bg">
                    <i class="fa fa-times"></i>
                  </div>
                  <div class="vertical-timeline-content">
                    <h2>科技处审查</h2>
                    <p>意见:${schedule.tsuggestion }</p>
                    <span class="badge badge-danger" style="float: right">审查打回</span> <span
                      class="vertical-date"> </span>
                  </div>
                </c:otherwise>
              </c:choose>
            </div>
            <div class="vertical-timeline-block">
              <c:choose>
                <c:when test="${schedule.academy==1}">
                  <div class="vertical-timeline-icon navy-bg">
                    <i class="fa fa-check"></i>
                  </div>
                  <div class="vertical-timeline-content">
                    <h2>学院初审</h2>
                    <p>意见:${schedule.asuggestion }</p>
                    <span class="badge badge-success" style="float: right">审核通过</span> <span
                      class="vertical-date"> </span>
                  </div>
                </c:when>
                <c:when test="${schedule.academy==0 }">
                  <div class="vertical-timeline-icon navy-bg">
                    <i class="fa"></i>
                  </div>
                  <div class="vertical-timeline-content">
                    <h2>学院初审</h2>
                    <p></p>
                    <span class="badge badge-success" style="float: right"></span> <span
                      class="vertical-date"> </span>
                  </div>
                </c:when>
                <c:otherwise>
                  <div class="vertical-timeline-icon navy-bg">
                    <i class="fa fa-times"></i>
                  </div>
                  <div class="vertical-timeline-content">
                    <h2>学院初审</h2>
                    <p>意见:${schedule.asuggestion }</p>
                    <span class="badge badge-danger" style="float: right">审查打回</span> <span
                      class="vertical-date"> </span>
                  </div>
                </c:otherwise>
              </c:choose>
            </div>

            <div class="vertical-timeline-block">
              <c:choose>
                <c:when test="${schedule.degree==1}">
                  <div class="vertical-timeline-icon navy-bg">
                    <i class="fa fa-check"></i>
                  </div>
                  <div class="vertical-timeline-content">
                    <h2>学位分委员会评审</h2>
                    <p>意见:${schedule.asuggestion }</p>
                    <span class="badge badge-success" style="float: right">审核通过</span> <span
                      class="vertical-date"> </span>
                  </div>
                </c:when>
                <c:when test="${schedule.degree==0 }">
                  <div class="vertical-timeline-icon navy-bg">
                    <i class="fa"></i>
                  </div>
                  <div class="vertical-timeline-content">
                    <h2>学位分委员会评审</h2>
                    <p></p>
                    <span class="badge badge-success" style="float: right"></span> <span
                      class="vertical-date"> </span>
                  </div>
                </c:when>
                <c:otherwise>
                  <div class="vertical-timeline-icon navy-bg">
                    <i class="fa fa-times"></i>
                  </div>
                  <div class="vertical-timeline-content">
                    <h2>学位分委员会评审</h2>
                    <p>意见:${schedule.dsuggestion }</p>
                    <span class="badge badge-danger" style="float: right">审查打回</span> <span
                      class="vertical-date"> </span>
                  </div>
                </c:otherwise>
              </c:choose>
            </div>

            <div class="vertical-timeline-block">
              <c:choose>
                <c:when test="${schedule.schoolDegree==1}">
                  <div class="vertical-timeline-icon navy-bg">
                    <i class="fa fa-check"></i>
                  </div>
                  <div class="vertical-timeline-content">
                    <h2>校学位委员会评审</h2>
                    <p>意见:${schedule.ssuggestion }</p>
                    <span class="badge badge-success" style="float: right">审核通过</span> <span
                      class="vertical-date"> </span>
                  </div>
                </c:when>
                <c:when test="${schedule.schoolDegree==0 }">
                  <div class="vertical-timeline-icon navy-bg">
                    <i class="fa"></i>
                  </div>
                  <div class="vertical-timeline-content">
                    <h2>校学位委员会评审</h2>
                    <p></p>
                    <span class="badge badge-success" style="float: right"></span> <span
                      class="vertical-date"> </span>
                  </div>
                </c:when>
                <c:otherwise>
                  <div class="vertical-timeline-icon navy-bg">
                    <i class="fa fa-times"></i>
                  </div>
                  <div class="vertical-timeline-content">
                    <h2>校学位委员会评审</h2>
                    <p>意见:${schedule.ssuggestion }</p>
                    <span class="badge badge-danger" style="float: right">审查打回</span> <span
                      class="vertical-date"> </span>
                  </div>
                </c:otherwise>
              </c:choose>
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
           
          </div>
          <div class="project-list">
            <table class="table table-hover">
              <tbody>
                <c:forEach var="notice" items="${notices }">
                  <tr>
                    <td class="project-title">
                      <a href="NoticeServlet?action=queryById&id=${notice.id }">${notice.name }</a> <br> <small>创建于
                        ${notice.time }</small>
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
</body>
</html>