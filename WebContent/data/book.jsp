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
      <h1 class="my-form-group-label">近三年出版的书籍著作</h1>
      <div class="btn-group btn-group-xs" role="group" aria-label="" style="margin-bottom: 0.2em;">
        <button type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal">
          <span class="glyphicon glyphicon-plus"></span> 增加
        </button>

        <a class="btn btn-default" href="/tutors/DataServlet?action=book">刷新</a>

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
            <tr id="${book.id }">
              <td>${book.name }</td>
              <td>${book.press }</td>
              <td>${book.pressTime }</td>
              <td>${book.editWordNumber }
              <td>${book.signatureOrder }</td>
              <td>${book.school}</td>
              <td>
                <button type="button" class="btn btn-primary" data-toggle="modal"
                  data-target="#myModalUpdate" onclick="editInfo('${book.id}',this)">修改</button>
                <button type="button" class="btn btn-danger del" onclick="del('${book.id}')">
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
          <h4 class="modal-title" id="modalI2Label">书籍著作</h4>
        </div>
        <div class="modal-body">
          <form class="form-horizontal" id="dialogII"
            action="/tutors/DataServlet?action=save&param=book" method="post">
            <div class="form-group">
              <label for="wzmc" class="col-sm-2 control-label">名称</label>
              <div class="col-sm-10">
                <input type="text" class="form-control input-sm" name="name" placeholder="名称"
                  style="width: 30em;">
              </div>
            </div>
            <div class="form-group">
              <label for="kwhymc" class="col-sm-2 control-label">出版社</label>
              <div class="col-sm-10">
                <input type="text" class="form-control input-sm" name="press" placeholder="出版社"
                  style="width: 30em;">
              </div>
            </div>
            <div class="form-group">
              <label for="fbny" class="col-sm-2 control-label">发表时间</label>
              <div class="col-sm-10">
                <div id="fbny1" class="input-append date">
                  <input type="date" class="form-control input-sm" name="pressTime"
                    value="2010-05-01" style="width: 30em;"> <span class="add-on"><i
                    class="icon-th"></i></span>
                </div>
              </div>
            </div>
            <div class="form-group">
              <label for="jsxt" class="col-sm-2 control-label">参编字数</label>
              <div class="col-sm-10">
                <input type="number" class="form-control input-sm" name="editWordNumber"
                  id="editWordNumber" value="" style="width: 30em;">
              </div>
            </div>
            <div class="form-group">
              <label for="pm" class="col-sm-2 control-label">本人排序</label>
              <div class="col-sm-10">
                <select class="form-control input-sm" name="signatureOrder" style="width: 14em;">
                  <option value="通讯作者">通讯作者</option>
                  <option value="第1作者">第1作者</option>
                  <option value="第2作者（导师为1作）">第2作者（导师为1作）</option>
                </select>
              </div>
            </div>
            <div class="form-group">
              <label for="wzmc" class="col-sm-2 control-label">是否为本校</label>
              <div class="col-sm-10">
                <select class="form-control input-sm" name="school" style="width: 14em;">
                  <option value="是">是</option>
                  <option value="否">否</option>
                </select>
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
  <div class="modal fade" id="myModalUpdate" tabindex="-1" role="dialog"
    aria-labelledby="myModalLabel">
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
              <label for="wzmc" class="col-sm-2 control-label">名称</label>
              <div class="col-sm-10">
                <input type="text" class="form-control input-sm" name="name" id="name"
                  placeholder="名称" style="width: 30em;" value="">
              </div>
            </div>
            <div class="form-group">
              <label for="kwhymc" class="col-sm-2 control-label">出版社</label>
              <div class="col-sm-10">
                <input type="text" class="form-control input-sm" name="press" id="press"
                  placeholder="出版社" style="width: 30em;" value="">
              </div>
            </div>
            <div class="form-group">
              <label for="fbny" class="col-sm-2 control-label">发表时间</label>
              <div class="col-sm-10">
                <div id="fbny1" class="input-append date">
                  <input type="date" class="form-control input-sm" name="pressTime" id="pressTime"
                    value="" style="width: 30em;"> <span class="add-on"><i
                    class="icon-th"></i></span>
                </div>
              </div>
            </div>
            <div class="form-group">
              <label for="jsxt" class="col-sm-2 control-label">参编字数</label>
              <div class="col-sm-10">
                <input type="number" class="form-control input-sm" name="editWordNumber"
                  id="editWordNumber" value="" style="width: 30em;">
              </div>
            </div>
            <div class="form-group">
              <label for="pm" class="col-sm-2 control-label">本人排名</label>
              <div class="col-sm-10">
                <select class="form-control input-sm" name="signatureOrder" style="width: 14em;"
                  id="signatureOrder">
                  <option value="通讯作者">通讯作者</option>
                  <option value="第1作者">第1作者</option>
                  <option value="第2作者（导师为1作）">第2作者（导师为1作）</option>
                </select>
              </div>
            </div>
            <div class="form-group">
              <label for="wzmc" class="col-sm-2 control-label">是否为本校</label>
              <div class="col-sm-10">
                <select class="form-control input-sm" name="school" style="width: 14em;" id="school">
                  <option value="是">是</option>
                  <option value="否">否</option>
                </select>
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
		var press = $("#myModalUpdate #press").val();
		var pressTime = $("#myModalUpdate #pressTime").val();
		var editWordNumber = $("#myModalUpdate #editWordNumber").val();
		var school = $("#myModalUpdate #school").val();
		var signatureOrder = $("#myModalUpdate #signatureOrder").val();
		var id = $("#myModalUpdate #id").val();
		$.ajax({
		    url : "/tutors/DataServlet?action=update&param=book",
		    type : "post",
		    data : {
			id : id,
			name : name,
			press : press,
			pressTime : pressTime,
			signatureOrder : signatureOrder,
			editWordNumber : editWordNumber,
			school : school,
		    },
		    success : function(data) {
			var paperTag = $("#" + id).children();
			paperTag[0].innerText = name;
			paperTag[1].innerText = press;
			paperTag[2].innerText = pressTime;
			paperTag[3].innerText = editWordNumber;
			paperTag[4].innerText = signatureOrder;
			paperTag[5].innerText = school;
			$("#myModalUpdate").modal("hide");
		    }
		});
	    }
	    function del(id) {
		var ok = confirm("你确定要删除吗?");
		if (ok) {
		    $.ajax({
			url : "/tutors/DataServlet?action=del&param=book",
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
		var press = paperTag[1].innerText;
		var pressTime = paperTag[2].innerText;
		var editWordNumber = paperTag[3].innerText;
		var signatureOrder = paperTag[4].innerText;
		var school = paperTag[5].innerText;

		$("#myModalUpdate #name").val(name);
		$("#myModalUpdate #press").val(press);
		$("#myModalUpdate #pressTime").val(pressTime);
		$("#myModalUpdate #editWordNumber").val(editWordNumber);
		$("#myModalUpdate #school").val(school);
		$("#myModalUpdate #signatureOrder").val(signatureOrder);
		$("#myModalUpdate #id").val(id);
	    }
	</script>
</body>
</html>