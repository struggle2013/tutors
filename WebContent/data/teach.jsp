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
  <div class="col-sm-10 col-sm-offset-1">
    <div id="view">
      <h1 class="my-form-group-label">近三年讲授的研究生课程情况（含主讲、助教或试讲的研究生课程）</h1>
      <div class="btn-group btn-group-xs" role="group" aria-label="" style="margin-bottom: 0.2em;">
        <button type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal">
          <span class="glyphicon glyphicon-plus"></span> 增加
        </button>

        <a class="btn btn-default" href="/tutors/DataServlet?action=teach">刷新</a>

      </div>
      <table class="table table-striped table-bordered">
        <thead>
          <tr>
            <th>研究生课程名称</th>
            <th>年份</th>
            <th>课时</th>
            <th>授课对象</th>
            <th>备注</th>
            <th>操作</th>
          </tr>
        </thead>
        <tbody id="vbody">
          <c:forEach var="teach" items="${teachs }">
            <tr id="${teach.id }">
              <td>${teach.name }</td>
              <td>${teach.year }</td>
              <td>${teach.classHour }</td>
              <td>${teach.category }
              <td>${teach.remark }</td>
              
              <td>
                <button type="button" class="btn btn-primary" data-toggle="modal"
                  data-target="#myModalUpdate" onclick="editInfo('${teach.id}',this)">修改</button>
                <button type="button" class="btn btn-danger del" onclick="del('${teach.id}')">
                  删除</button>
              </td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
    </div>
  </div>
  <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
          <h4 class="modal-title" id="modalI2Label">研究生课程</h4>
        </div>
        <div class="modal-body">
          <form class="form-horizontal" id="dialogII"
            action="/tutors/DataServlet?action=save&param=teach" method="post">
            <div class="form-group">
              <label for="wzmc" class="col-sm-2 control-label">研究生课程名称</label>
              <div class="col-sm-10">
                <input type="text" class="form-control input-sm" name="name" placeholder="名称" id="name"
                  style="width: 30em;">
              </div>
            </div>
            <div class="form-group">
              <label for="kwhymc" class="col-sm-2 control-label">年份</label>
              <div class="col-sm-10">
                <input type="number" class="form-control input-sm" name="year" id="year"
                  placeholder="年份" style="width: 30em;"> 
              </div>
            </div>
            <div class="form-group">
              <label for="fbny" class="col-sm-2 control-label">课时</label>
              <div class="col-sm-10">
                <div id="fbny1" class="input-append date">
                  <input type="number" class="form-control input-sm" name="classHour" id ="classHour"
                    value="" style="width: 30em;"> <span class="add-on"><i
                    class="icon-th"></i></span>
                </div>
              </div>
            </div>
            <div class="form-group">
               <label for="jsxt" class="col-sm-2 control-label">授课对象</label>
              <div class="col-sm-10">
                <input type="text" class="form-control input-sm" name="category"
                  id="category" value="" style="width: 30em;">
              </div>
            </div>
            <div class="form-group">
              <label for="pm" class="col-sm-2 control-label">备注</label>
              <div class="col-sm-10">
                <input type="text" class="form-control input-sm" name="remark"
                  id="remark" value="" style="width: 30em;">
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
  <div class="modal fade" id="myModalUpdate" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
          <h4 class="modal-title" id="modalI2Label">修改著作</h4>
        </div>
        <div class="modal-body">
          <form class="form-horizontal" id="dialogII"
            action="/tutors/DataServlet?action=update&param=paper" method="post">
               <div class="form-group">
              <label for="wzmc" class="col-sm-2 control-label">研究生课程名称</label>
              <div class="col-sm-10">
                <input type="text" class="form-control input-sm" name="name" placeholder="名称" id="name"
                  style="width: 30em;">
              </div>
            </div>
            <div class="form-group">
              <label for="kwhymc" class="col-sm-2 control-label">年份</label>
              <div class="col-sm-10">
                <input type="number" class="form-control input-sm" name="year" id="year"
                  placeholder="年份" style="width: 30em;"> 
              </div>
            </div>
            <div class="form-group">
              <label for="fbny" class="col-sm-2 control-label">课时</label>
              <div class="col-sm-10">
                <div id="fbny1" class="input-append date">
                  <input type="number" class="form-control input-sm" name="classHour" id ="classHour"
                    value="" style="width: 30em;"> <span class="add-on"><i
                    class="icon-th"></i></span>
                </div>
              </div>
            </div>
            <div class="form-group">
               <label for="jsxt" class="col-sm-2 control-label">授课对象</label>
              <div class="col-sm-10">
                <input type="text" class="form-control input-sm" name="category"
                  id="category" value="" style="width: 30em;">
              </div>
            </div>
            <div class="form-group">
              <label for="pm" class="col-sm-2 control-label">备注</label>
              <div class="col-sm-10">
                <input type="text" class="form-control input-sm" name="remark"
                  id="remark" value="" style="width: 30em;">
              </div>
            </div>
            
            <input type="text" value="" style="display: none;" id="id">
            <div class="modal-footer">
              <button type="button" class="btn btn-default btn-cancel" data-dismiss="modal">取消</button>
              <button type="button" class="btn btn-primary" onclick="update()">保存</button>
            </div>
          </form>
        </div>

      </div>

    </div>
  </div>


  <script src="/tutors/js/jquery.min.js?v=2.1.4"></script>
  <script src="/tutors/js/bootstrap.min.js?v=3.3.6"></script>
  <script src="/tutors/js/plugins/layer/layer.min.js"></script>
  <script>
      function update() {
    var name = $("#myModalUpdate #name").val();
    var year = $("#myModalUpdate #year").val();
    var classHour = $("#myModalUpdate #classHour").val();
    var category = $("#myModalUpdate #category").val();
    var remark = $("#myModalUpdate #remark").val();
    var id = $("#myModalUpdate #id").val();
    $.ajax({
        url : "/tutors/DataServlet?action=update&param=teach",
        type : "post",
        data : {
      id : id,
      name : name,
      year : year,
      classHour : classHour,
      category : category,
      remark : remark
     
        },
        success : function(data) {
      var paperTag = $("#" + id).children();
      paperTag[0].innerText = name;
      paperTag[1].innerText = year;
      paperTag[2].innerText = classHour;
      paperTag[3].innerText = category;
      paperTag[4].innerText = remark;

      $("#myModalUpdate").modal("hide");
        }
    });
      }
      function del(id) {
    var ok = confirm("你确定要删除吗?");
    if (ok) {
        $.ajax({
      url : "/tutors/DataServlet?action=del&param=teach",
      type : "post",
      data : {
          id : id
      },
      success : function(data) {
          $("#" + id).remove();
          console.log(data);
      }
        });
    }
      }

      function editInfo(id, obj) {
    var paperTag = $("#" + id).children();
    var name = paperTag[0].innerText;
    var year = paperTag[1].innerText;
    var classHour = paperTag[2].innerText;
    var category = paperTag[3].innerText;
    var remark = paperTag[4].innerText;

    $("#myModalUpdate #name").val(name);
    $("#myModalUpdate #year").val(year);
    $("#myModalUpdate #classHour").val(classHour);
    $("#myModalUpdate #category").val(category);
    $("#myModalUpdate #remark").val(remark);
    $("#myModalUpdate #id").val(id);
      }
  </script>
</body>
</html>