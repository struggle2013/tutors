<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="/tutors/css/bootstrap.min.css" rel="stylesheet">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
</head>
<body>
  <div class="col-sm-9 col-sm-offset-1">

    <div id="view">
      <h1 class="my-form-group-label">近三年出版的书籍著作</h1>
      <div class="btn-group btn-group-xs" role="group" aria-label="" style="margin-bottom: 0.2em;">
        <button type="button" class="btn btn-default btnAdd">
          <span class="glyphicon glyphicon-plus"></span> 增加
        </button>

      </div>
      <table class="table table-striped table-bordered">
        <thead>
          <tr>
            <th>著作（或教材）名称</th>
            <th>出版社</th>
            <th>时间</th>
            <th>参编字数</th>
            <th>本人排名</th>
            <th>是否是本校成果</th>
            <th>操作</th>
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
              <td>
                <button type="button" class="btn btn-primary" data-toggle="modal"
                  data-target="#myModalUpdate">
                  <span class="glyphicon glyphicon-pencil"></span> 修改
                </button>
                <button type="button" class="btn btn-danger del" onclick="del('${paper.id}')">
                  <span class="glyphicon glyphicon-minus"></span> 删除
                </button>
              </td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
    </div>

    <div class="modal fade" id="dialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
      aria-hidden="true" data-show="false" style="display: none;">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">×</span>
            </button>
            <h4 class="modal-title" id="modalI2Label">主要科研成果</h4>
          </div>
          <div class="modal-body">
            <form class="form-horizontal" id="dialogII">
              <div class="form-group">
                <label for="cgmc" class="col-sm-2 control-label">名称</label>
                <div class="col-sm-10">
                  <input type="text" class="form-control input-sm" id="cgmc" placeholder="成果（项目）名称"
                    style="width: 30em;">
                </div>
              </div>
              <div class="form-group">
                <label for="gbsj" class="col-sm-2 control-label">时间</label>
                <div class="col-sm-10">
                  <div id="gbsj1" class="input-append date">
                    <input type="text" class="form-control input-sm" id="gbsj" value="2010-05-01"
                      style="width: 8em;"> <span class="add-on"><i class="icon-th"></i></span>
                  </div>
                </div>
              </div>
              <div class="form-group">
                <label for="cgjb" class="col-sm-2 control-label">部门</label>
                <div class="col-sm-10">
                  <input type="text" class="form-control input-sm" id="cgjb"
                    placeholder="成果鉴定、颁奖及采用部门" style="width: 30em;">
                </div>
              </div>
              <div class="form-group">
                <label for="pm" class="col-sm-2 control-label">本人排名</label>
                <div class="col-sm-10">
                  <input type="number" class="form-control input-sm" id="pm" placeholder="本人排序"
                    style="width: 16em;">
                </div>
              </div>
              <div class="form-group">
                <label for="bz" class="col-sm-2 control-label">备注</label>
                <div class="col-sm-10">
                  <input type="text" class="form-control input-sm" id="bz" placeholder="备注"
                    style="width: 15em;">
                </div>
              </div>

            </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default btn-cancel">取消</button>
            <button type="button" class="btn btn-primary btn-ok">保存</button>
          </div>
        </div>
      </div>
    </div>



  </div>
</body>
</html>