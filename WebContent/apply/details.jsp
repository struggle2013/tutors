<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="/tutors/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
<link href="/tutors/css/font-awesome.css?v=4.4.0" rel="stylesheet">
<!-- <link href="css/plugins/iCheck/custom.css" rel="stylesheet"> -->
<link href="/tutors/css/animate.css" rel="stylesheet">
<link href="/tutors/css/style.css?v=4.1.0" rel="stylesheet">
<script></script>

</head>
<body>
  <div class="wrapper wrapper-content animated fadeIn">
    <div class="ibox-float-e-margins">
      <div class="ibox-title">
        <h3>正在审的用户是: ${username }</h3>
      </div>
      <div class="ibox-content">
        <div class="tabs-container">
          <ul class="nav nav-tabs">
            <li class="active"><a data-toggle="tab" href="#tab-1" aria-expanded="true">书籍</a></li>
            <li class=""><a data-toggle="tab" href="#tab-2" aria-expanded="false">科研成果</a></li>
            <li class=""><a data-toggle="tab" href="#tab-3" aria-expanded="false">学术论文</a></li>
            <li class=""><a data-toggle="tab" href="#tab-4" aria-expanded="false">讲课情况</a></li>
            <li class=""><a data-toggle="tab" href="#tab-5" aria-expanded="false">在研项目</a></li>
          </ul>
          <div class="tab-content">
            <div id="tab-1" class="tab-pane  active">
              <div class="panel-body">
                <div class="col-sm-12">
                  <div id="view">
                    <h1 class="my-form-group-label">近三年出版的书籍著作</h1>
                    <div class="btn-group btn-group-xs" role="group" aria-label=""
                      style="margin-bottom: 0.2em;"></div>
                    <table class="table table-striped table-bordered">
                      <thead>
                        <tr>
                          <th>著作（或教材）名称</th>
                          <th>出版社</th>
                          <th>时间</th>
                          <th>参编字数</th>
                          <th>本人排名</th>
                          <th>是否是本校成果</th>
                        </tr>
                      </thead>
                      <tbody id="vbody">
                        <c:forEach var="book" items="${books }">
                          <tr>
                            <td>${book.name }</td>
                            <td>${book.press }</td>
                            <td>${book.pressTime }</td>
                            <td>${book.editWordNumber }
                            <td>${book.signatureOrder }</td>
                            <td>${book.school}</td>
                          </tr>
                        </c:forEach>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
            <div id="tab-2" class="tab-pane">
              <div class="panel-body">
                <div class="col-sm-12">

                  <div id="view">
                    <h1 class="my-form-group-label">近三年取得的主要科研成果</h1>
                    <div class="btn-group btn-group-xs" role="group" aria-label=""
                      style="margin-bottom: 0.2em;"></div>
                    <table class="table table-striped table-bordered">
                      <thead>
                        <tr>
                          <th>项目名称</th>
                          <th>成果鉴定、颁奖及采用部门</th>
                          <th>时间</th>
                          <th>本人排名</th>
                          <th>是否是本校成果</th>
                        </tr>
                      </thead>
                      <tbody id="vbody">
                        <c:forEach var="fruit" items="${fruits }">
                          <tr>
                            <td>${fruit.name }</td>
                            <td>${fruit.address }</td>
                            <td>${fruit.resultTime }</td>
                            <td>${fruit.signatureOrder }</td>
                            <td>${fruit.school}</td>
                          </tr>
                        </c:forEach>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
            <div id="tab-3" class="tab-pane">
              <div class="panel-body">
                <div class="col-sm-12">

                  <div id="view">
                    <h1 class="my-form-group-label">近三年发表的主要学术论文</h1>
                    <table class="table table-striped table-bordered">
                      <thead>
                        <tr>
                          <th>名称</th>
                          <th>发表刊物或出版单位、卷、期及页码</th>
                          <th>发表时间</th>
                          <th>检索情况</th>
                          <th>本人排序</th>
                          <th>是否是本校</th>
                          <th>操作</th>
                        </tr>
                      </thead>
                      <tbody id="vbody">
                        <c:forEach var="paper" items="${papers }">
                          <tr>
                            <td>${paper.name }</td>
                            <td>${paper.publication }</td>
                            <td>${paper.publicationTime }</td>
                            <td>${paper.retrieval }</td>
                            <td>${paper.signatureOrder }</td>
                            <td>${paper.school}</td>

                          </tr>
                        </c:forEach>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
            <div id="tab-4" class="tab-pane">
              <div class="panel-body">
                <div class="col-sm-12">

                  <div id="view">
                    <h1 class="my-form-group-label">近三年讲授的研究生课程情况</h1>
                    <div class="btn-group btn-group-xs" role="group" aria-label=""
                      style="margin-bottom: 0.2em;"></div>
                    <table class="table table-striped table-bordered">
                      <thead>
                        <tr>
                          <th>研究生课程名称</th>
                          <th>年份</th>
                          <th>课时</th>
                          <th>授课对象</th>
                          <th>备注</th>

                        </tr>
                      </thead>
                      <tbody id="vbody">
                        <c:forEach var="teach" items="${teachs }">
                          <tr>
                            <td>${teach.name }</td>
                            <td>${teach.year }</td>
                            <td>${teach.classHour }</td>
                            <td>${teach.category }</td>
                            <td>${teach.remark}</td>

                          </tr>
                        </c:forEach>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
            <div id="tab-5" class="tab-pane">
              <div class="panel-body">
                <div id="view">
                  <h1 class="my-form-group-label">正在承担的主要科研项目情况</h1>
                  <div class="btn-group btn-group-xs" role="group" aria-label=""
                    style="margin-bottom: 0.2em;"></div>
                  <table class="table table-striped table-bordered">
                    <thead>
                      <tr>
                        <th>项目、课题名称 (编号、合同号)</th>
                        <th>项目来源</th>
                        <th>负责人</th>
                        <th>开始时间</th>
                        <th>经费总额</th>
                        <th>本人可支 配经费数</th>
                        <th>本人排名</th>
                        <th>是否是本校成果</th>
                      </tr>
                    </thead>
                    <tbody id="vbody">
                      <c:forEach var="project" items="${projects }">
                        <tr>
                          <td>${project.name }</td>
                          <td>${project.projectSource }</td>
                          <td>${project.personInCharge }</td>
                          <td>${project.startTime }</td>
                          <td>${project.fundAll}</td>
                          <td>${project.myFund}</td>
                          <td>${project.signatureOrder}</td>
                          <td>${project.school}</td>
                        </tr>
                      </c:forEach>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <a class="btn btn-success" onclick="location.href='javascript:history.go(-1);'">返回</a>
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
            action="/tutors/DataServlet?action=save&param=paper" method="post">
            <div class="form-group">
              <label for="wzmc" class="col-sm-2 control-label">审批人</label>
              <div class="col-sm-10">
                <input type="text" class="form-control input-sm" name="name" placeholder="审批人"
                  style="width: 30em;">
              </div>
            </div>
            <div class="form-group">
              <label for="kwhymc" class="col-sm-2 control-label">意见</label>
              <div class="col-sm-10">
                <textarea class="form-control " name="suggestion" style="width: 30em;"></textarea>
              </div>
            </div>

            <div class="modal-footer">
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
</body>
</html>