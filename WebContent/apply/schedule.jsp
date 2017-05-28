<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/font-awesome.css" rel="stylesheet">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="css/animate.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
</head>
<body>
  <div class="wrapper wrapper-content">
    <div class="col-sm-12">
      <div class="ibox float-e-margins">
        <div class="ibox-title">
          <h2>审查进度</h2>
        </div>
        <div class="ibox-content timeline">

          <div class="timeline-item ">
            <div class="row">
              <c:choose>
                <c:when test="${schedule.technology==1}">
                  <div class="col-xs-3 date">
                    <i class="fa fa-check"></i>
                  </div>
                  <div class="col-xs-7 content no-top-border bg-success">
                    <h3>科技处审查</h3>
                    <p>通过</p>
                    <p>意见:${schedule.tsuggestion }</p>
                  </div>
                </c:when>
                <c:when test="${schedule.technology==0 }">
                  <div class="col-xs-3 date">
                    <i class="fa fa-hourglass-1"></i>
                  </div>
                  <div class="col-xs-7 content">
                    <h3>科技处审查</h3>
                    <p>待审查</p>
                  </div>
                </c:when>
                <c:otherwise>
                  <div class="col-xs-3 date">
                    <i class="fa fa-times"></i>
                  </div>
                  <div class="col-xs-7 content bg-danger">
                    <h3>科技处审查</h3>

                    <p>审查打回</p>
                    <p>意见:${schedule.tsuggestion }</p>
                  </div>
                </c:otherwise>
              </c:choose>
            </div>
          </div>
          <div class="timeline-item">
            <div class="row">
              <c:choose>
                <c:when test="${schedule.academy==1 }">
                  <div class="col-xs-3 date">
                    <i class="fa fa-check"></i>
                  </div>
                  <div class="col-xs-7 content bg-success">
                    <h3>学院初审</h3>
                    <p>通过</p>
                    <p>意见:${schedule.asuggestion }</p>
                  </div>
                </c:when>
                <c:when test="${schedule.academy==0 }">
                  <div class="col-xs-3 date">
                    <i class="fa fa-hourglass-1"></i>
                  </div>
                  <div class="col-xs-7 content">
                    <h3>学院初审</h3>
                    <p>待审查</p>
                  </div>
                </c:when>
                <c:otherwise>
                  <div class="col-xs-3 date">
                    <i class="fa fa-times"></i>
                  </div>
                  <div class="col-xs-7 content bg-danger">
                    <h3>学院初审</h3>
                    <p>审查打回</p>
                    <p>意见:${schedule.asuggestion }</p>
                  </div>
                </c:otherwise>
              </c:choose>
            </div>
          </div>
          <div class="timeline-item">
            <div class="row">
              <c:choose>
                <c:when test="${schedule.degree==1 }">
                  <div class="col-xs-3 date">
                    <i class="fa fa-check"></i>
                  </div>
                  <div class="col-xs-7 content bg-success">
                    <h3>学位分委员会评审</h3>
                    <p>通过</p>
                    <p>意见:${schedule.dsuggestion }</p>
                  </div>
                </c:when>
                <c:when test="${schedule.degree==0 }">
                  <div class="col-xs-3 date">
                    <i class="fa fa-hourglass-1"></i>
                  </div>
                  <div class="col-xs-7 content">
                    <h3>学位分委员会评审</h3>
                    <p>待审查</p>
                  </div>
                </c:when>
                <c:otherwise>
                  <div class="col-xs-3 date">
                    <i class="fa fa-times"></i>
                  </div>
                  <div class="col-xs-7 content bg-danger">
                    <h3>学位分委员会评审</h3>
                    <p>审查打回</p>
                    <p>意见:${schedule.dsuggestion }</p>
                  </div>
                </c:otherwise>
              </c:choose>
            </div>
          </div>
          <div class="timeline-item">
            <div class="row">
              <c:choose>
                <c:when test="${schedule.schoolDegree==1 }">
                  <div class="col-xs-3 date">
                    <i class="fa fa-check"></i>
                  </div>
                  <div class="col-xs-7 content bg-success">
                    <h3>校学位委员会评审</h3>
                    <p>通过</p>
                    <p>意见:${schedule.ssuggestion }</p>
                  </div>
                </c:when>
                <c:when test="${schedule.schoolDegree==0 }">
                  <div class="col-xs-3 date">
                    <i class="fa fa-hourglass-1"></i>
                  </div>
                  <div class="col-xs-7 content">
                    <h3>校学位委员会评审</h3>
                    <p>待审查</p>
                  </div>
                </c:when>
                <c:otherwise>
                  <div class="col-xs-3 date">
                    <i class="fa fa-times"></i>
                  </div>
                  <div class="col-xs-7 content bg-danger">
                    <h3>校学位委员会评审</h3>
                    <p>审查打回</p>
                    <p>意见:${schedule.ssuggestion }</p>
                  </div>
                </c:otherwise>
              </c:choose>
            </div>
          </div>
        </div>
      </div>



    </div>
  </div>


</body>
</html>